#!/usr/bin/ksh

# ■ 機能
# Db2のテーブルとカラム名を一つずつ指定してレコードを取得する
# 以下が取得可能
# ・一意なレコード(distinct)
# ・一意なレコードのHEX表記
# ・一意なレコードのデータ長
# また、指定したテーブルのカラムに関するテーブル定義(describe)を出力する

# ■ 引数の定義
# 第一引数：テーブル名
# 第二引数：カラム名

# ■ 使い方
# 1.Db2のインスタンスを持つユーザでログインする
# 2.配置ディレクトリに移動
# 3../survey_rec_hexlength.sh <TABLE_NAME> <COLUMN_NAME>
# ※テーブル名とカラム名は小文字でも指定できます

DBNAME=""
USER=""
PASSWD=""
FIRST_PARAM=""
SECOND_PARAM=""
FIRST_PARAM_UPPER=""
SECOND_PARAM_UPPER=""

db2 connect to $DBNAME user $USER using $PASSWD > /dev/null

echo

FIRST_PARAM=$1
SECOND_PARAM=$2

FIRST_PARAM_UPPER=`echo ${FIRST_PARAM} | tr '[:lower:]' '[:upper:]'`
SECOND_PARAM_UPPER=`echo ${SECOND_PARAM} | tr '[:lower:]' '[:upper:]'`

echo
echo "★カラムの定義"
echo "---------------------------------------------------"
db2 describe table ${FIRST_PARAM_UPPER} | grep ${SECOND_PARAM_UPPER}

echo

echo "★一意なレコード"
db2 "select distinct ${SECOND_PARAM_UPPER},hex(${SECOND_PARAM_UPPER}) as hex,length(${SECOND_PARAM_UPPER}) as length from ${FIRST_PARAM_UPPER}"

echo "================================"
date
echo "================================"

exit