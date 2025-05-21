#!/bin/sh

source "$CONFIG_DIR/colors.sh"


url="https://www.githubstatus.com/api/v2/incidents/unresolved.json"
data=$(http $url)

incidents=$(echo $data | jq '.incidents | length')

GITHUB_LOGO=""

if [ $incidents -gt 0 ]; then
  highest_impact="none"
  highest_impact=$(echo $data | jq '.incidents | map(.impact) | sort_by(if . == "critical" then 0 elif . == "major" then 1 elif . == "minor" then 2 else 3 end) | first')
  color=$ORANGE
  if [ $highest_impact = "minor" ]; then
    color=$YELLOW
  elif [ $highest_impact == "major" ]; then
    color=$ORANGE
  elif [ $highest_impact == "critical" ]; then
    color=$RED
  fi

  ICON=" "
  LABEL="#incidents_$incidents"
  sketchybar --set $NAME label=$LABEL icon=$ICON icon.color=$color label.color=$color
else
  sketchybar --set $NAME  icon="$GITHUB_LOGO" icon.color=$GREEN label="alles gucci" label.color=$GREEN
fi

