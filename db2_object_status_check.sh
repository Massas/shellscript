#!/usr/bin/ksh

## db2_object_status_check.sh
# �ȉ����J�^���O�r���[����Ɖ�ĕW���o�͂���
# �E�e�[�u���̃X�e�[�^�X
# �E�X�g�A�h�n�̃X�e�[�^�X
# �E�g���K�[�̃X�e�[�^�X
# ���̃X�N���v�g��Db2�̃C���X�^���X�������[�U�Ŏ��s���邱��

DBNAME=''
USERNAME=''
PASSWD=''

echo '################'
echo '# ��{���F�@date;whoami;hostname;'
echo '################'

db2 connect to $DBNAME user $USERNAME using $PASSWD

echo "�e�[�u���̃X�e�[�^�X���m�F����"
db2 "select varchar(tabname,30) as tabname,status from SYSCAT.TABLES where tabschema="$USERNAME" order by tabname"

echo "�g���K�[�̃X�e�[�^�X���m�F����"
db2 "select varchar(trigname,30) as trigname,varchar(tabname,30) as tabname,valid from SYSCAT.TRIGGERS where trigschema="$USERNAME" order by trigname"

echo "�X�g�A�h�n�̃X�e�[�^�X���m�F����"
db2 "select varchar(routinemodulename,30) as routinemodulename,varchar(routinename,30) as routinename,valid,create_time,alter_time from SYSCAT.ROUTINES where routineschema="$USERNAME" and dialect='PL/SQL' order by routinemodulename,routinename"

exit