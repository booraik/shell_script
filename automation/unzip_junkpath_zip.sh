mkdir tmp
for file in ./*
do
    if [[ "$file" =~ ".zip" ]]
    then
        unzip -j "$file" -d tmp/
        rm "$file"
        zip -r --junk-path "$file" tmp/*
        rm -rf tmp/*
    fi
done
rm -rf tmp
