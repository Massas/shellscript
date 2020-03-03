# shellscript

シェルスクリプト用リポジトリ
１）survey_rec_hexlength.sh


★概要
１）survey_rec_hexlength.sh
■ 機能
Db2のテーブルとカラム名を一つずつ指定してレコードを取得する
以下が取得可能
・一意なレコード(distinct)
・一意なレコードのHEX表記
・一意なレコードのデータ長
また、指定したテーブルのカラムに関するテーブル定義(describe)を出力する

■ 引数の定義
第一引数：テーブル名
第二引数：カラム名

■ 使い方
1.Db2のインスタンスを持つユーザでログインする
2.配置ディレクトリに移動
3../survey_rec_hexlength.sh <TABLE_NAME> <COLUMN_NAME>
※テーブル名とカラム名は小文字でも指定できます
