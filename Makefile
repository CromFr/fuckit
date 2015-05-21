all: fuckit

fuckit:
	dmd fuckit.d
	

test: fuckit
	echo "Hello World" | ./fuckit encode | ./fuckit decode
