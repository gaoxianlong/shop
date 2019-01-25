package com.interceptors;

public class Helloworld {
    public String sayHello(){
        String str = "执行读取数据";
        System.out.println(str);
        return str;
    }

    public static void main(String[] args){
        //为什么不对？
        //第一种解决方案
        Helloworld hw=new Helloworld();
        hw.sayHello();
        /*
             第二种解决方案：sayHello() 声明为静态方法 static
             原因是调用 sayHello（） 时
             1、Helloworld 的对象必须先存在于堆内存（Helloworld 类的 sayHello（）没有通过new 的方法 加载到虚拟机的堆内存中，必须先存在于堆内存或虚拟机的静态方法区，才可调用）
             或者
             2、sayHello（）方法已经存在虚拟机的方法区
         */


    }
    public void b(){
        sayHello();
    }
}
