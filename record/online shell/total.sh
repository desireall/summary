#! /bin/bash


 
 
 #"gs-1201"
 #"gs-1203"
 server=(
 "gs-1200"
 "gs-1201"
 "gs-1203"
 )




total=0

 #for data in ${server[@]}
 #do
 #     ./allCharge.sh -s ${data} 
 #     ./allCharge.sh -s ${data} |  awk -F '充值RMB:' '{sum += $2} END{print "总充值: "sum}' 
 #done


for data in ${server[@]}
do
     ./allCharge.sh -s ${data}
     serverCharge=`./allCharge.sh -s ${data} |  awk -F '充值RMB:' '{sum += $2} END{print sum}'`
     echo 服务器总充值: $serverCharge
     let "total += $serverCharge"     
done

echo 当前server中总共充值: $total


 #./allCharge.sh | awk -F '充值返利人数 ' '{sum += $2} END{print "总返利人数: "sum}'


# ./allCharge.sh | awk -F '值供奉数量 :' '{print $2}' | awk -F ' 充值60钻石订单数量 :' '{sum += $1} END{print "总供奉人数: "sum}'

