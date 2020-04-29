#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# chmod a+x hello.py

import os
import subprocess
import pyperclip
import utils

def set_clipboard(data: str):
    p = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
    p.stdin.write(data.encode("utf-8"))
    p.stdin.close()
    p.communicate()

def get_from_clipboard():
    p = subprocess.Popen(['pbpaste'], stdout=subprocess.PIPE)
    p.wait()
    byte_data = map(lambda x: x.decode('utf-8'), p.stdout.readlines())
    p.stdout.close()
    return byte_data
    
def samples1():
    #将当前剪切板的内容输出到m.txt文件里并用Python读取
    os.system("pbpaste > m.txt")
    f = open('m.txt','r')
    txt=f.read()
    #去除换行符和回车符
    txt=txt.strip().replace('\r\n',' ').replace('\r',' ').replace('\n',' ')
    f.close()
    print(txt)
    #将新内容拷贝至Mac系统的剪切板
    p1=subprocess.Popen(["echo", txt], stdout=subprocess.PIPE)
    subprocess.Popen(["pbcopy"], stdin=p1.stdout)

def db_java_type(jdbcType):
    if "VARCHAR" in jdbcType:
        type = "String"
        javaType = "java.lang.String"
    elif "TINYINT" in jdbcType:
        type = "Byte"
        javaType = "java.lang.Byte"
    elif "DATETIME" in jdbcType:
        type = "LocalDateTime"
        javaType = "java.time.LocalDateTime"
    elif "DATE" in jdbcType:
        type = "LocalDate"
        javaType = "java.time.LocalDate"
    elif "DECIMAL" in jdbcType:
        type = "BigDecimal"
        javaType = "java.math.BigDecimal"
    elif "INT" == jdbcType:
        type = "Integer"
        javaType = "java.lang.Integer"
    elif "INT" == jdbcType:
        type = "Integer"
        javaType = "java.lang.Integer"
    elif "BIGINT UNSIGNED" == jdbcType:
        type = "Long"
        javaType = "java.lang.Long"
    elif "BIGINT" == jdbcType:
        type = "Long"
        javaType = "java.lang.Long"
    elif "JSON" == jdbcType:
        type = "HashMap"
        javaType = "java.util.HashMap"
    else:
        type = None
        print(name, jdbcType)
    return type

commont = """

    /**
    * {}
    * {}
    */
    private {} {};"""
tmps = []
for field in pyperclip.paste().split("\r"):
    field_split = field.split('\t') 
    code = commont.format(field_split[0],field_split[8],db_java_type(field_split[2]),utils.convert(field_split[1],'_',False))
    tmps.append(code)
pyperclip.copy("".join(tmps))
