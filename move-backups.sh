backups=`find . | grep '.*\.bak'`
for line in $backups ; do
	mv $line $1
done
