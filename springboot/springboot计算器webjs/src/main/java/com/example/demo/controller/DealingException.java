package com.example.demo.controller;


public class DealingException extends Exception implements WayToHintErrorMessage {

    String s;
    @Override
    public void hint(){
        System.out.println("sdah");
    }
//        new AlertDialog.Builder(activity).setTitle("错误").setMessage("关于"+s+"的输入格式有误").setPositiveButton("确定",null).show();
//    }
    DealingException(String e){
        s = e;
    }
    DealingException(){
        s = "无法判断的符号";
    }
}
