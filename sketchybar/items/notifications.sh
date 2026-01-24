#!/usr/bin/env bash

source "${CONFIG_DIR}/theme/catppuccin.sh"

# Gmail item
sketchybar --add item notif.gmail left \
  --set notif.gmail \
  icon="󰊫" \
  icon.color="${_SSDF_CM_SUBTEXT_0}" \
  icon.padding_left=12 \
  icon.padding_right=2 \
  label="0" \
  label.color="${_SSDF_CM_SUBTEXT_0}" \
  label.padding_right=6 \
  update_freq=60 \
  script="$CONFIG_DIR/plugins/gmail.sh" \
  click_script="open https://mail.google.com"

# GitHub item
sketchybar --add item notif.github left \
  --set notif.github \
  icon="" \
  icon.color="${_SSDF_CM_SUBTEXT_0}" \
  icon.padding_left=6 \
  icon.padding_right=2 \
  label="0" \
  label.color="${_SSDF_CM_SUBTEXT_0}" \
  label.padding_right=12 \
  update_freq=60 \
  script="$CONFIG_DIR/plugins/github.sh" \
  click_script="open https://github.com/notifications"
