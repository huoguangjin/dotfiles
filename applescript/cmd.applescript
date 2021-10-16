on run {}
	tell application "Finder" to set dir to target of front Finder window as text
	
	-- display dialog(dir)
	tell application ":Applications:iTerm.app"
		create window with default profile
		tell the first window
			tell current session to write text ("cd " & (quoted form of POSIX path of dir) & "; clear")
		end tell
	end tell
end run
