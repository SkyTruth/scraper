
for table in `cat tablelist.txt`
do
	echo -n "$table "
	psql skytruth --tuples-only -c "select count(*) from \"$table\""
done

