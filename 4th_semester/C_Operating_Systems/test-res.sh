if ! (gcc p3200179-p3200207-res.c -pthread && ./a.out 1 1000); then
	echo "Error"
else
	echo "Script ended successfully"
fi
