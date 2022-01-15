from sys import platform
from sys import argv
import subprocess

if len(argv) != 2:
	print("Only 1 arg expected...the gtkwave file to view.")
	exit(1)
else:
	# Run gtkwave differently on OSX...because Apple...

	if platform == "linux" or platform == "linux2" or platform == "win32":
		# linux or windows
		subprocess.run(["gtkwave", argv[1]])
	elif platform == "darwin":
		# OSX
		print("Make sure you follow the instructions here: https://ughe.github.io/2018/11/06/gtkwave-osx")
		subprocess.run(["/Applications/gtkwave.app/Contents/Resources/bin/gtkwave", argv[1]])
	else:
		print("Platform not recognized.")
		exit(1)