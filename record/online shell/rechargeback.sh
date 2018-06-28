#! /bin/bash

DATE=`date "+%Y-%m-%d"` #指定提取的归档日志的日期，默认为当天
SERVER="gs-1200"
USERID="1"
help(){
  echo "注意：使用前，请注意日志文件是否存在.
        USAGE:
        $0 [-d datetime] [-s server]
            -u : 指定玩家检测
            -s : 指定游戏服务器默认为gs-2004
            -d : 指定特定时间,不指定则默认为当天,格式为2015-12-31 "
    }
                   
#从命令行获取参数(GETOTPS FROM CMDLINE)
while getopts s:d:u:h opt
do
  case "$opt" in
       d) DATE="$OPTARG";;
       s) SERVER="$OPTARG";;
       u) USERID="$OPTARG";;  
       h) help;;
       *) help;exit 1;;
  esac
done


filepath="/home/ma62/script/lfac_fetcher/fetchtool/dest/${DATE}/${SERVER}/log/gameserver.log"

# 这里的-f参数判断文件是否存在
if [ ! -f "$filepath" ]; then
    echo 文件 : ${filepath}不存在!
    if [ $(echo `bash lfac_fetchtool.sh -u ma62 -i ${SERVER} -d ${DATE}` | grep "error" | wc -l) > 1 ]; then
       echo 文件更新失败
       exit 1
    fi
fi

if [ "$USERID" != 1 ]; then
    if [ $(grep "chargeback" ${filepath} | grep "$USERID" | wc -l) == 1 ]; then
       echo "$USERID" "$DATE" 充值返利完成
    fi
fi
#| awk -F  ':'  '{printf userId: $2  roleId : $3}'
#grep "chargeback" ${filepath} | awk -F  ':'  '{printf userId: $2  roleId : $3}'

echo 充值返利人数 $(grep "chargeback" ${filepath} | wc -l)



