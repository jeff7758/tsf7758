


iii
mypath="/usr/local/src/backup"
rollback_file=$(/bin/ls -lt ${mypath}|/bin/grep 'LT2019*'|/bin/awk 'NR==1{print $NF}')
[ -e ${mypath}/${rollback_file} ] && echo "rollback LT..."
/bin/rm -rf /usr/local/src/LT
/bin/\cp -r ${mypath}/${rollback_file} /usr/local/src/LT
[ $? -eq 0 ] && echo "rollback LT Finished..." || echo "rollback LT Failed..."
  pm2 list |/bin/grep online |wc -l
  pm2 reload LT
  pm2 logs |head -30 >backup/pm2_$(date  ++%Y-%m-%d-%H-%M).log;echo "" > pm2.log
