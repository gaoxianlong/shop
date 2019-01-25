package com.stk;

import java.text.SimpleDateFormat;
import java.util.Date;
public class Ts {
    public String gao(){
        return "okokokok";
    }
    public static void main(String[] args) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
//        java.sql.Date nowSqldate = new java.sql.Date(System.currentTimeMillis());
//        System.out.println(nowSqldate);
    }
}
