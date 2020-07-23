#!/bin/bash
# 获取当前日期
# 1.编辑crontab -e
#   0 0 * * * sh /root/corn/corn_run_sql.sh
# 2. service crond restart
DATE=`date +%Y%m%d`

cp ermas_case_main_daily.sql run.sql

sed -i "s|replace_date|$DATE|" run.sql

r=$(docker run --rm -v /root/corn:/sql imega/mysql-client mysql --host=rm-2ze00q455i80h3xq9.mysql.rds.aliyuncs.com --user=canal --password=canal-ktjr --database=analytic --execute='source /sql/run.sql' 2>&1)
e=$(echo $r |grep 'ERROR'|wc -l)
echo $r>/var/log/daily.log

curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=f201a363-4d65-422d-85e3-7052f028c6cd' \
   -H 'Content-Type: application/json' \
   -d '
   {
        "msgtype": "text",
        "text": {
            "content": "ermas_case_main_daily快照已执行,错误消息数'$e',如有错误请检查/var/log/daily.log日志"
        }
   }'
