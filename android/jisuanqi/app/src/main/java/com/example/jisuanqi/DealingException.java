package com.example.jisuanqi;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;

public class DealingException extends Exception implements WayToHintErrorMessage {
    @Override
    public String hint() {
        return s;
    }

    String s;
    @Override
    public void hint(AppCompatActivity activity){
        new AlertDialog.Builder(activity).setTitle("错误").setMessage("关于"+s+"的输入格式有误").setPositiveButton("确定",null).show();
    }
    DealingException(String e){
        s = e;
    }
    DealingException(){
        s = "无法判断的符号";
    }
}
