#!/bin/bash

NC_PORT=9999

RESPONE_FILE='/var/tmp/nctrans_res'
ZIP_FILE='/var/tmp/nctrans_zip.zip'

file=''
fname=''
if [ -f "$1" ]; then
  # File case
  file="$1"
  fname="$(basename "$file")"
elif [ -d "$1" ]; then
  # Dir case
  zip -r $ZIP_FILE "$1"
  file=$ZIP_FILE
  fname="$(basename "$1").zip"
else
  echo 'usage: nctrans file'
  exit 1
fi

mimetype="$(file -b --mime-type "$file")"
bytes=$(wc -c < "$file")

echo -ne "HTTP/1.1 200 OK\r\n" > $RESPONE_FILE
echo -ne "Content-Type: "$mimetype"\r\n" >> $RESPONE_FILE
echo -ne "Content-Length:"$bytes"\r\n" >> $RESPONE_FILE
echo -ne "Content-Disposition: attachment; filename=\""$fname\""\r\n" >> $RESPONE_FILE
echo -ne "\r\n" >> $RESPONE_FILE
cat "$file" >> $RESPONE_FILE

echo "Listening on port $NC_PORT.."
nc -l $NC_PORT < $RESPONE_FILE
