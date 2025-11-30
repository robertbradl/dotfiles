#!/bin/sh
set -eu

SIG="$HOME/.config/aerc/sign/work.html"
PANDOC="/opt/homebrew/bin/pandoc"

# Choose input source:
# If aerc provided a path in AERC_MAIL_BODY, prefer that.
# Otherwise read from stdin (/dev/stdin). Using /dev/stdin avoids trying to "cat" a possibly-empty stdin.
if [ -n "${AERC_MAIL_BODY:-}" ] && [ -f "$AERC_MAIL_BODY" ]; then
  INFILE="$AERC_MAIL_BODY"
else
  INFILE="/dev/stdin"
fi

# Make temp files
TMPBASE="$(mktemp -u aercconv.XXXXXX)" || exit 1
PRE_MD="$(mktemp "${TMPBASE}.pre.XXXXXX")"
QUOTE_MD="$(mktemp "${TMPBASE}.quote.XXXXXX")"
PRE_HTML="$(mktemp "${TMPBASE}.pre.html.XXXXXX")"
QUOTE_HTML="$(mktemp "${TMPBASE}.quote.html.XXXXXX")"

cleanup() {
  rm -f "$PRE_MD" "$QUOTE_MD" "$PRE_HTML" "$QUOTE_HTML"
}
trap cleanup EXIT

# Split the markdown into PRE and QUOTE on the first line that begins with optional whitespace then '>'
# Important: preserve all lines exactly (including blank lines).
awk -v pre="$PRE_MD" -v q="$QUOTE_MD" '
  BEGIN { quoted = 0 }
  /^[[:space:]]*>/ { quoted = 1 }
  { if (!quoted) print > pre; else print > q }
' "$INFILE"

# Convert parts separately with pandoc. If a part is empty, create an empty file so concatenation is safe.
if [ -s "$PRE_MD" ]; then
  $PANDOC -f commonmark -t html <"$PRE_MD" >"$PRE_HTML"
else
  : >"$PRE_HTML"
fi

if [ -s "$QUOTE_MD" ]; then
  $PANDOC -f commonmark -t html <"$QUOTE_MD" >"$QUOTE_HTML"
else
  : >"$QUOTE_HTML"
fi

# Decide output order:
# - If there is quoted text (QUOTE_HTML non-empty), output pre-html, SIG, quote-html.
# - If no quoted text, output pre-html then SIG (original behavior).
if [ -s "$QUOTE_HTML" ]; then
  # Print pre-html (may be empty), newline, signature, newline, quote-html
  cat "$PRE_HTML"
  printf "\n"
  cat "$SIG"
  printf "\n"
  cat "$QUOTE_HTML"
else
  # No quoted text: behave like original converter (message -> html -> signature)
  cat "$PRE_HTML"
  printf "\n"
  cat "$SIG"
fi

exit 0
