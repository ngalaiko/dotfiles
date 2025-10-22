function trash
	for file in $argv
		set file_path (realpath $file)
		/usr/bin/osascript -e "tell application \"Finder\" to move POSIX file \"$file_path\" to trash" > /dev/null 
	end
end
