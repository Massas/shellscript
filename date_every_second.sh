#!/usr/bin/ksh

# ���b�J��Ԃ��C�ӂ̃R�}���h�����s���A���̎��s�񐔂�W���o�͂���X�N���v�g
# sleep�̈����Ń��[�v�������w�肵�܂�
# ���[�v���ŔC�ӂ̃R�}���h�����������Ŏg���܂�
# ������Ԃł͖��bdate�R�}���h�����s����W���o�͂���܂�

count=0

while true
do

echo '==============='
echo "DATE: `date`"
# ���̂�����ōD���ȃR�}���h�����s����
let "count=count + 1"
echo "count: ${count}"

sleep 1

done