#!/bin/bash
str='com.itextpdf:itext-asian:jar:5.19, ddp-jibx-product:ddp-jibx-product:jar:1.1.7, PKIBASE:PKIBASE:jar:1.0, axiom-impl:axiom-impl:jar:1.2.8, bcmail-jdk15:bcmail-jdk15:jar:141, bcprov-jdk15:bcprov-jdk15:jar:141, if-crypto-client:if-crypto-client:jar:2.0.1, if-crypto-metadata:if-crypto-metadata:jar:4.3.19, if-crypto-sdk:if-crypto-sdk:jar:4.3.19, if-jibx-schema-commons:if-jibx-schema-commons:jar:1.0.1, if-util:if-util:jar:4.0.2, jibx-bind:jibx-bind:jar:1.2, jibx-run:jibx-run:jar:1.2, jsr173_api:jsr173_api:jar:1.0, jsr173_ri:jsr173_ri:jar:1.0, spring-oxm:spring-oxm:jar:1.5.6, spring-ws-core:spring-ws-core:jar:1.5.6, spring-xml:spring-xml:jar:1.5.6, stax-api:stax-api:jar:1.0.1, axiom-api:axiom-api:jar:1.2.8, log4j:log4j:bundle:1.2.16, com.pqsoft.rd3.DBstep:DBstep:jar:1.0'

#echo $str |awk -F, '{print $1}'

mails=$(echo $str | tr "," "\n")

for addr in $mails
do
    # echo "> [$addr]"
    groupId=$(echo $addr |awk -F: '{print $1}')
    artifactId=$(echo $addr |awk -F: '{print $2}')
    version=$(echo $addr |awk -F: '{print $4}')
    echo "mvn deploy:deploy-file -Dmaven.test.skip=true -DgroupId=$groupId -DartifactId=$artifactId -Dversion=$version -Dpackaging=jar -Dfile=./$artifactId-$version.jar -Dpackaging=jar -DrepositoryId=thirdparty -Durl=http://creditcloud.com:8081/nexus/content/repositories/thirdparty/"
done 