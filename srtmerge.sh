RED='\033[0;31m'
NC='\033[0m'

for f in *S02*.mkv
do
	subtitle=$(echo "$f" | sed 's/....$//' | sed 's/$/.srt/')

	if [ -f "$f" ]  && [ -f "$subtitle" ]
		then
	    	echo "${RED}Processing $f${NC}"
			mv "$f" "$f.old"
			mkvmerge -o "$f" "$f.old" "$subtitle"
			rm "$f.old"
	else
	   	echo "${RED}One of the files does not exist or isn't named properly.{NC}"
	fi
done
