#!/usr/bin/ksh

# 毎秒繰り返し任意のコマンドを実行し、その実行回数を標準出力するスクリプト
# sleepの引数でループ周期を指定します
# ループ内で任意のコマンドを書くだけで使えます
# 初期状態では毎秒dateコマンドが実行され標準出力されます

count=0

while true
do

echo '==============='
echo "DATE: `date`"
# このあたりで好きなコマンドを実行する
let "count=count + 1"
echo "count: ${count}"

sleep 1

done