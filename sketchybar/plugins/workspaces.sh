#!/usr/bin/env bash

source "${CONFIG_DIR}/theme/catppuccin.sh"
source "${CONFIG_DIR}/scripts/app-font-fn.sh"

_SSDF_WS_ID=$1
_SSDF_WS_COLOR=$2
_SSDF_WS_FOCUSED="${FOCUSED_WORKSPACE}"

if [[ -z "${_SSDF_WS_FOCUSED}" ]]; then
  _SSDF_WS_FOCUSED=$(aerospace list-workspaces --focused)
fi

# Get the front app in this workspace
FRONT_APP=$(aerospace list-windows --workspace "${_SSDF_WS_ID}" --format "%{app-name}" 2>/dev/null | head -1)

__icon_map "$FRONT_APP"
if [ "${_SSDF_WS_ID}" = "${_SSDF_WS_FOCUSED}" ]; then
  # Focused workspace - larger filled dot with assigned color
  sketchybar --animate tanh 5 --set "$NAME" \
    icon.color="${_SSDF_CM_GREEN}" \
    icon.background.drawing=off
elif [ -n "$FRONT_APP" ]; then
  if [ -n "${icon_result}" ]; then
    # Known app - show Nerd Font icon
    sketchybar --animate tanh 5 --set "$NAME" \
      icon="$icon_result" \
      icon.font="sketchybar-app-font:Regular:25" \
      icon.color="${_SSDF_CM_MAUVE}" \
      icon.background.drawing=off
  else
    # Unknown app - show app icon from macOS
    sketchybar --animate tanh 5 --set "$NAME" \
      icon="" \
      icon.background.image="app.${FRONT_APP}" \
      icon.background.image.scale=0.7 \
      icon.background.drawing=on
  fi
else
  # Empty workspace - show small dot
  sketchybar --animate tanh 5 --set "$NAME" \
    icon="" \
    icon.font="JetBrainsMono Nerd Font:Bold:25.0" \
    icon.color="${_SSDF_CM_SUBTEXT_0}" \
    icon.background.drawing=off
fi
