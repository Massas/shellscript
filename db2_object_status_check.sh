#!/usr/bin/ksh

## db2_object_status_check.sh
# 以下をカタログビューから照会して標準出力する
# ・テーブルのステータス
# ・ストアド系のステータス
# ・トリガーのステータス
# このスクリプトはDb2のインスタンスを持つユーザで実行すること

DBNAME=''
USERNAME=''
PASSWD=''

echo '################'
echo '# 基本情報：　date;whoami;hostname;'
echo '################'

db2 connect to $DBNAME user $USERNAME using $PASSWD

echo "テーブルのステータスを確認する"
db2 "select varchar(tabname,30) as tabname,status from SYSCAT.TABLES where tabschema="$USERNAME" order by tabname"

echo "トリガーのステータスを確認する"
db2 "select varchar(trigname,30) as trigname,varchar(tabname,30) as tabname,valid from SYSCAT.TRIGGERS where trigschema="$USERNAME" order by trigname"

echo "ストアド系のステータスを確認する"
db2 "select varchar(routinemodulename,30) as routinemodulename,varchar(routinename,30) as routinename,valid,create_time,alter_time from SYSCAT.ROUTINES where routineschema="$USERNAME" and dialect='PL/SQL' order by routinemodulename,routinename"

exit