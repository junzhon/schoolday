package com.example.jisuanqi;
import java.util.regex.Pattern;


public class InputCheck {
    public final static double e = 2.718281828459;
    public final static double PI = 3.14159265;
    public final static String regex = "(-?([1-9]+\\d*)|0)(\\.\\d*)?";//匹配普通浮点数
    public final static String regex2 = String.format("%s((E|e)-?%s)?",regex,regex);//匹配科学计数法，也可普通浮点数
    public static Boolean CheckNum(String num){
        //判断是否为浮点数或常数
        if(Pattern.matches(regex2,num) || num.equals("e") || num.equals("PI")){
            return true;
        }
        else{
            return false;
        }
        
    }

    public static int CheckOperator(String operator){
        String textInButtons[] = {
            "log","+",
            "*","/","-","^"
        };
        String textInButtons2[] ={
            "x^n","sqrt","n!","exp","1/x","ln","cos","+/-","sin","fac"
        };
        for(String a:textInButtons){
            if(a.equals(operator)){
                return 2;//双目运算符
            }
        }
        for(String b:textInButtons2){
            if(b.equals(operator)){
                return 1;//单目运算符
            }
        }
        //判断双目与单目运算符
        return 0;
    }
    public static int factorial(float n) throws DealingException {
        int flag = 0;
        n = (int) n;
        if(n <= 0){
            if(flag == 0){
                throw new DealingException("fac方程参数不能小于零");
            }
            return -1;
        }
        if(n == 1){
            return 1;
        }else if(n > 500){
            throw new DealingException("太大了算不了");
        }
        else{
            int a;
            a = (int) (n * factorial(n - 1));
            return a;
        }
    }
}