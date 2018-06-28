#! /bin/bash
start_time=`date "+%Y-%m-%d"`
end_time=`date "+%Y-%m-%d" -d "$1 1 days"`
#从命令行获取参数(GETOTPS FROM CMDLINE)
while getopts d:e:h opt
do
 case "$opt" in
  d) start_time="$OPTARG";;
  e) end_time="$OPTARG";;
  h) help;;
  *) help;exit 1;;
 esac
done

 
 



total=0


MAX_SERVER=1216
for ((data=1200 ; data<=$MAX_SERVER; data++))
do
    bash iosCharge.sh -s "gs-${data}" -d ${start_time} -e ${end_time}
    serverCharge=`bash iosCharge.sh -s "gs-${data}" -d ${start_time} -e ${end_time} |  awk -F '充值RMB:' '{sum += $2} END{print sum}'`
    echo "gs-${data}" 服务器总充值: $serverCharge
    let "total += $serverCharge"
done


echo ios当前server中总共充值: $total


 #./allCharge.sh | awk -F '充值返利人数 ' '{sum += $2} END{print "总返利人数: "sum}'


# ./allCharge.sh | awk -F '值供奉数量 :' '{print $2}' | awk -F ' 充值60钻石订单数量 :' '{sum += $1} END{print "总供奉人数: "sum}'

