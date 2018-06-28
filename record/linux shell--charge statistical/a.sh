#! /bin/bash
chargeorderNum=$(grep "get charge order" gameserver.log | wc -l);
echo 充值订单总数 : ${chargeorderNum}

total=0;
yuka=$(grep "get charge order" gameserver.log | grep "ma62.yueka" | wc -l);
echo 充值月卡数量 : ${yuka};
let "total+=${yuka}*30";

azuan=$(grep "get charge order" gameserver.log | grep "ma62.60zuanshi" | wc -l);
echo 充值60钻石订单数量 : ${azuan};
let "total+=${azuan}*6";

bzuan=$(grep "get charge order" gameserver.log | grep "ma62.180zuanshi" | wc -l);
echo 充值180钻石订单数量 : ${bzuan};
let "total+=${bzuan}*18";

czuan=$(grep "get charge order" gameserver.log | grep "ma62.680zuanshi" | wc -l);
echo 充值680钻石订单数量 : ${czuan};
let "total+=${czuan}*68";

dzuan=$(grep "get charge order" gameserver.log | grep "ma62.1280zuanshi" | wc -l);
echo 充值1280钻石订单数量 : ${dzuan};
let "total+=${dzuan}*128";

ezuan=$(grep "get charge order" gameserver.log | grep "ma62.1980zuanshi" | wc -l);
echo 充值1980钻石订单数量 : ${ezuan};
let "total+=${ezuan}*198";

fzuan=$(grep "get charge order" gameserver.log | grep "ma62.3280zuanshi" | wc -l);
echo 充值32800钻石订单数量 : ${fzuan};
let "total+=${fzuan}*328";

gzuan=$(grep "get charge order" gameserver.log | grep "ma62.6480zuanshi" | wc -l);
echo 充值6480钻石订单数量 : ${gzuan};
let "total+=${gzuan}*648";

echo "总充值RMB: ${total}"
