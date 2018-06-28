#! /bin/bash
SERVER="gs-1200"
start_time=`date "+%Y-%m-%d"`
end_time=`date "+%Y-%m-%d" -d "$1 1 days"`
#从命令行获取参数(GETOTPS FROM CMDLINE)
while getopts s:d:e:h opt
do
 case "$opt" in
 s) SERVER="$OPTARG";;
 d) start_time="$OPTARG";;
 e) end_time="$OPTARG";;
 h) help;;
 *) help;exit 1;;
 esac
done

#开始时间 2017-06-15   结束时间为2017-07-05
#start_time="2017-06-15"
#end_time="2017-07-06"


#开始时间 2017-08-22   结束时间为2017-09-07
#start_time="2017-08-22"
#end_time="2017-09-08"

#开始时间 2017-11-3
#start_time="2017-11-03"


#start_time="2017-11-09"

#结束时间为明天
#end_time=`date "+%Y-%m-%d" -d "$1 1 days"`


#end_time="2017-11-07"


day=0;


echo 服务器： $SERVER

while [ $start_time != $end_time ]
do  
    let "day+=1"
    echo 日期： ${start_time}  day:${day}
    #echo `bash rechargeback.sh -d $start_time -s $SERVER`
    echo `bash dateCharge.sh -d $start_time -s $SERVER`
    start_time=`date -d "+1 day ${start_time}" +%Y-%m-%d` #获取第二天的时间 
done


