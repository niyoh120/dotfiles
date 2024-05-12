function check_update() {
	# won't handle situations where /var/log/pacman.log doesn't exist or full system upgrade not run once

	last_upgrade_time=$(grep "\[PACMAN\] starting full system upgrade" /var/log/pacman.log | tail -1 | grep -oP '\[\K[^\]]+' | head -1)
	last_upgrade_utime=$(date '+%s' -d "$last_upgrade_time")
	current_utime=$(date '+%s')

	time_diff=$(($current_utime - $last_upgrade_utime))
	day_diff=$(($time_diff / 86400))
	hour_diff=$((($time_diff - 86400 * $day_diff) / 3600))

	# colors
	RED='\033[31m'
	NC='\033[0m'

	if (($day_diff > 6)); then
		echo -e "${RED}You have not upgraded your system for ${day_diff} days ${hour_diff} hours!${NC}"
		echo "Check Arch news page and Run \"pacman -Syu\" to upgrade."
	else
		echo "System last upgraded at ${last_upgrade_time} (${day_diff} days ${hour_diff} hours ago)."
	fi
}

if [ "$(command -v pacman)" ]; then
	check_update
fi
