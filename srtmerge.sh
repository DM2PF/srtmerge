RED='\033[0;31m'
NC='\033[0m'

pattern=$1

for f in $pattern.mkv
do
	echo "${RED}Processing $f${NC}"
	subtitle=$(echo "$f" | sed 's/....$//' | sed 's/$/.srt/')
	mv "$f" "$f.old"
	mkvmerge -o "$f" "$f.old" "$subtitle"
	rm "$f.old"
done
