#!/bin/sh
source $HOME/.config/sketchybar/colors.sh

# We want to fetch if all the unresolved incidents from github status
# if the lenght of the .incidents is greateh than 0 we will show the number of incidents
# we want to highlight the color of the hights impact
#  minor (yellow), major (orange), or critical (red)

url="https://www.githubstatus.com/api/v2/incidents/unresolved.json"
data=$(http $url)

incidents=$(echo $data | jq '.incidents | length')

if [ $incidents -gt 0 ]; then

  highest_impact=$(echo $data | jq '.incidents | map(.impact) | sort_by(if . == "critical" then 0 elif . == "major" then 1 elif . == "minor" then 2 else 3 end) | first')
  thecolor=$ORANGE
  echo 'before'
  echo $highest_impact
  echo $thecolor

  if [ $highest_impact = "minor" ]; then
    color=$ORANGE
    echo 'inside minor'
    echo $color
  elif [ $highest_impact == "major" ]; then
    color="#FFA500"
  elif [ $highest_impact == "critical" ]; then
    color="#FF0000"
  fi

  sketchybar --set $NAME label="bad" icon.color=$color
else
  sketchybar --set $NAME label=""
fi

