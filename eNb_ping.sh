#!/bin/bash

date
declare -a s1_mme_ifs=( Sx-MMEx-x-interface-ip ... ... ... ... )

for value in "${s1_mme_ifs[@]}";
do
        cat /tmp/ip_pool.txt | while read output
        do
                ping -I "${value}" "${output}" -c 7 >> /tmp/test_result.log
                if [ $? -eq 0 ]; then
                        echo "ping from $value to $output: node is up!";
                else
                        echo "ping from $value to $output: node is down!";
                fi
        done
done 
