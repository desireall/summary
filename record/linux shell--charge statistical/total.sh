#! /bin/bash

# ./allCharge.sh | awk -F '充值RMB:' '{printf $2"\n"}' | awk '{sum += $1} END{print "总共充值:"sum}'

./allCharge.sh

 ./allCharge.sh | awk -F '充值RMB:' '{sum += $2} END{print "总充值: "sum}'
 
 ./allCharge.sh | awk -F '充值返利人数 ' '{sum += $2} END{print "总返利人数: "sum}'
