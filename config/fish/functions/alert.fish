function alert
	set time $argv[1]
	set time (math "$time*60")
	set message $argv[2..-1]
	for sec in (seq $time)
		echo -n (math "$time-$sec")
		sleep 1
		echo -en "\b\b\b\b"
	end
	osascript -e "display notification \"$message\" with title \"Alert\" sound name \"Basso.aiff\""
end
