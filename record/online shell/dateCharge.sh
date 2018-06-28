#! /bin/bash

DATE=`date "+%Y-%m-%d"` #指定提取的归档日志的日期，默认为当天
SERVER="gs-1200"
help(){
    echo "注意：使用前，请注意日志文件是否存在.
    USAGE:
    $0 [-d datetime] [-s server]
    -s : 指定游戏服务器默认为gs-2004
    -d : 指定特定时间,不指定则默认为当天,格式为2015-12-31 "
}
#从命令行获取参数(GETOTPS FROM CMDLINE)
while getopts s:d:h opt
do
     case "$opt" in
          d) DATE="$OPTARG";;
          s) SERVER="$OPTARG";;
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



chargeorderNum=$(grep "get charge order" ${filepath} | wc -l);
echo 充值订单总数 : ${chargeorderNum}

total=0;
yuka=$(grep "get charge order" ${filepath} | grep "ma62.yueka" | wc -l);
echo 充值月卡数量 : ${yuka};
let "total+=${yuka}*30";

gongfeng=$(grep "get charge order" ${filepath} | grep "ma62.30rmbgongfeng" | wc -l);
echo 充值供奉数量 : ${gongfeng};
let "total+=${gongfeng}*30";

qifu=$(grep "get charge order" ${filepath} | grep "ma62.18rmbqifu" | wc -l);
echo 充值18元祈福礼包数量 : ${qifu};
let "total+=${qifu}*18";

chongwu=$(grep "get charge order" ${filepath} | grep "ma62.18rmbchongwu" | wc -l);
echo 充值18元宠物礼包数量 : ${chongwu};
let "total+=${chongwu}*18";


# 钻石
array=(
6
18
68
128
198
328
648
)

azuan=1;
for data in ${array[@]}  
do  
 azuan=$(grep "get charge order" ${filepath} | grep "ma62.${data}0zuanshi" | wc -l);
 echo 充值${data}0钻石订单数量 : ${azuan};
 let "total+=${azuan}*${data}";
done 

#礼包
libao=(
18
30
68
128
198
)
for data in ${libao[@]}
do
 azuan=$(grep "get charge order" ${filepath} | grep "ma62.${data}rmbdestiny" | wc -l);
 echo 充值${data}元礼包订单数量 : ${azuan};
 let "total+=${azuan}*${data}";
done

echo "${SERVER}   ${DATE} 总充值RMB: ${total}"
