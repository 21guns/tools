#!/bin/sh
#自动打版本号
#根据项目名称查找项目ID
#
if [ $# == 1 ]
then
	v=$1
	echo "输入版本号为:$v,确认 y,取消 n"
	read e
	if [ $e == "y" ]
	then
		url='https://gitlab.creditcloud.com'
		token='LhozE4xpPWvE2os79dzd'
		dirs=( 'cms' 'event' 'promotion' 'timed-task' 'docking' 'notify' 'query' 'warehouse' 'logistics' 'order' 'upload' 'admin' 'financial-scheme' 'server' 'common' 'admin-user' 'user' 'store' 'leads' 'vehicle')
		for loop in ${dirs[@]}
		do
			id=`curl -s -X GET -H "PRIVATE-TOKEN: $token" $url/api/v3/projects/ddhc%2F$loop | awk -F '[:,]' '/id/{print$2}'`
			echo "get project($id) for $loop"
			#判断master和uat是否由变更
			commit=`curl -s -X GET -H "PRIVATE-TOKEN: $token" $url/api/v3/projects/$id/repository/compare\?from\=master\&to\=uat|awk -F '[:,]' '/commit/{print$2}'`
			echo "$commit"
			if [ $commit != "null" ]
			then  
				mrid=`curl -s -X POST -H "Content-Type:application/json" -H "PRIVATE-TOKEN: $token" --data '{"id": "$id","target_branch": "master","source_branch": "uat",  "title": "'$v'"}' $url/api/v3/projects/$id/merge_requests | awk -F '[:,]' '/id/{print$2}'`
				echo "create mr($mrid) for $loop"

				echo "accept mr for $loop"
				curl -s -X PUT -H "Content-Type:application/json" -H "PRIVATE-TOKEN: $token" --data '{"id": "$id","merge_request_id": "$mrid"}' $url/api/v3/projects/$id/merge_requests/$mrid/merge
			else 
				echo "$loop hasn't changes"
			fi
		        echo "create tag for $loop \n"
			curl -s -X POST -H "Content-Type:application/json" -H "PRIVATE-TOKEN: $token" --data '{"id": "$id","tag_name": "'$v'","ref":"master"}' $url/api/v3/projects/$id/repository/tags
		done
		echo "yeye successfull!!"
	fi
else
	echo "请输入版本号vx.x.x"
fi
