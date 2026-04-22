#!/bin/bash

USERID=$(id -u)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if the user not supplied

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1"
}

LOGS_FOLDER=/var/log/shell-scripting
LOGS_FILE=/var/log/shell-scripting/backup.log


mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
   echo -e "$R please user root user to access $N"
   exit 1
fi 

usage(){
   log "$R USAGE:: <SOURCE_DIR> <DEST_DIR> <DAYS> [by default 14] $N"

}
if [ $# -lt 2 ]; then
    USAGE
fi
if [ ! -d "$SOURCE_DIR" ]; then
exit 1
fi
if [ ! -d "$DEST_DIR" ]; then
exit 1
fi
#files not 
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS)
 log "Backup started"
 log "Source Directory: $SOURCE_DIR"
 log "Destination Directory: $DEST_DIR"
 log "Days: $DAYS"
 
 if [ -z "${FILES}" ]; then
  log "No files to archieve ... $Y Skipping $N"
else
  # app-logs-$timestamp.zip
    log "Files found to archieve: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    log "Archieve name: $ZIP_FILE_NAME"
    tar -zcvf $ZIP_FILE_NAME $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)
    
    # Check archieve is success or not
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archeival is ... $G SUCCESS $N"
      
      while IFS= read -r filepath;
       do
        # Process each line here
        log "Deleting file: $filepath"
        rm -f $filepath
        log "Deleted file: $filepath"
      done <<< $FILES
    else
        log "Archeival is ... $R FAILURE $N"
        exit 1
    fi
fi
