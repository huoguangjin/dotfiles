on run {}
	tell application "Finder" to set ss to selection as alias list
	tell application "Finder" to set dir to target of front Finder window as text
	
	set fs to {}
	repeat with s in ss
		set fs to fs & (quoted form of POSIX path of s)
	end repeat
	set filelist to list2string(fs, " ")
	
	-- command 'toggle_side_bar'
	-- display dialog ("'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n " & filelist & " -a " & (quoted form of POSIX path of dir))
	do shell script "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n " & filelist & " -a " & (quoted form of POSIX path of dir)
end run

on list2string(theList, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theString to theList as string
	set AppleScript's text item delimiters to ""
	return theString
end list2string

-- set the clipboard to (POSIX path of dir)
