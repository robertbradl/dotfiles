#!/usr/bin/env bash

CONFIG=~/.config/tmux/profiles.yaml

# Check dependencies
command -v fzf >/dev/null || {
  echo "fzf required"
  exit 1
}
command -v yq >/dev/null || {
  echo "yq required"
  exit 1
}

# Parse config and present fzf
selection=$(
  yq -o=json '.[]' $CONFIG |
    jq -rc '. as $item | "\($item.label) [\($item.user)@\($item.host)]:::\($item.window):::\($item.user):::\($item.host):::\($item.key // "")"' |
    fzf --prompt "Choose profile: " \
      --delimiter ":::" \
      --preview='echo -e "Window: {2}\nHost: {3}\nUser: {4}\nKey: {5}"' \
      --color dark \
      --border="rounded" \
      --border-label="Select Server"
)

# Bail
[ -z "$selection" ] && exit 0

# Split values
window=$(echo "$selection" | head -n 1 | awk -F ':::' '{print $2}')
user=$(echo "$selection" | head -n 1 | awk -F ':::' '{print $3}')
host=$(echo "$selection" | head -n 1 | awk -F ':::' '{print $4}')
key=$(echo "$selection" | head -n 1 | awk -F ':::' '{print $5}')

# Build command
if [ -n "$key" ]; then
  cmd="ssh -tt -i $key $user@$host"
else
  cmd="ssh -tt $user@$host"
fi

# Run in new tmux window using bash wrapper (Fish-safe)
tmux new-window -n "$window" "bash -c '$cmd || read -p \"SSH failed. Press Enter...\"'"
