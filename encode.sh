#!/bin/bash


#################################################################
#                                                               #
#   文字列をURLエンコーディングするシェルスクリプト             #
#   from SoftwareDesign 393号 使えるシェルスクリプトの書き方    #
#                                                               #
#################################################################

# グローバル変数
result=""

# 関数定義
array_to_encoded_strings(){
    
    # evalコマンドで配列を一つの文字列として変数termsに格納する 
    eval terms=(\${$1[@]})
    
    i=0
    
    # スクリプトに与えた引数の数(#terms[@])分ループ処理を行う
    # 比較演算子はそのまま書くとエラーになるため、文字列展開されないシングルクオートで囲う
    while [ $i '<' ${#terms[@]} ]
    do
        if [ $i != 0 ]
        then
            result="$result\n"
        fi
        # i番目の要素の値を変数termに格納する
        term=${terms[$i]}
        # 変数termに格納されている値をechoからnkfに渡し、
        # UTF-8コード・MIME Quoted streamに変換して再度変数termに格納する
        term=$(echo $term | nkf -W8MQ)
        # 変数term値をsedに渡し、「s/」以降の文字列にマッチした部分を
        # 次の「/」以降の文字列に全置換して、再度変数termに格納する
        term=$(echo $term | 
                sed -e 's/=$//' \
                    -e 's/=/%/g' \
                    -e 's/%7E/~/g' \
                    -e 's/%5F/_/g' \
                    -e 's/%2D/-/g' \
                    -e 's/%2E/./g')
        result="$result$term"
        # 変数iを後置でインクリメントする
        let i++
    done
}

# 「$@」：すべての引数を個別で処理する
given_terms=($@)

# 関数を実行する
array_to_encoded_strings given_terms

# 変数resultを展開して、改行を出力する形で標準出力する
echo -e "$result"




