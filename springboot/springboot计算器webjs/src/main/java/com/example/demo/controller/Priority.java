package com.example.demo.controller;
public class Priority{
    public static int priorty(String exp){
        //二目运算符小于一目运算符
        // ^ > */ > +-
        if(InputCheck.CheckOperator(exp) == 2){
            if(exp.equals("log") ){
                return 8;
            }
            if(exp.equals("^")){
                return 7;
            }
            if(exp.equals("*") || exp.equals("/")){
                return 6;
            }
            if(exp.equals("+") || exp.equals("-")){
                return 5;
            }
        }
        if(InputCheck.CheckOperator(exp) == 1){
            return 10;
        }
        if(exp.equals("(") || exp.equals(")") ){
            return 15;
        }
        return -1;
    }
}
