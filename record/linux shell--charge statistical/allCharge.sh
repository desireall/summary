#! /bin/bash



#开始时间 2017-06-15   结束时间为2017-07-05
#start_time="2017-06-15"
#end_time="2017-07-06"


#开始时间 2017-08-22   结束时间为2017-09-05
start_time="2017-08-22"
#end_time="2017-09-05"


#结束时间为明天
end_time=`date "+%Y-%m-%d" -d "$1 1 days"`



day=0;


while [ $start_time != $end_time ]
do  
    let "day+=1"
    echo 日期： ${start_time}  day:${day}
    echo `bash rechargeback.sh -d $start_time`
    echo `bash dateCharge.sh -d $start_time`
    start_time=`date -d "+1 day ${start_time}" +%Y-%m-%d` #获取第二天的时间 
done


