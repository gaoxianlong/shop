package com.interceptors;
//第二种解决方案
public  class Helloworldb {
    public static String sayHello(){
        String str = "执行读取数据";
        System.out.println(str);
        return str;
    }

    public static void main(String[] args){
        sayHello();

    }
    public void b(){
        sayHello();
    }
}
