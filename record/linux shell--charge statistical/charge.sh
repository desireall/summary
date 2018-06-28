#! /bin/bash

chargeorderNum=$(grep "get charge order" gameserver.log | wc -l);
echo 充值订单总数 : ${chargeorderNum}

total=0;
yuka=$(grep "get charge order" gameserver.log | grep "ma62.yueka" | wc -l);
echo 充值月卡数量 : ${yuka};
let "total+=${yuka}*30";

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
 azuan=$(grep "get charge order" gameserver.log | grep "ma62.${data}0zuanshi" | wc -l);
 echo 充值${data}0钻石订单数量 : ${azuan};
 let "total+=${azuan}*${data}";
done 
echo "总充值RMB: ${total}"