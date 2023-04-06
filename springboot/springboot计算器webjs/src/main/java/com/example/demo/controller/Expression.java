package com.example.demo.controller;

public class Expression {

    private String expr;

    public String getExpr() {
        try {
            expr = InputDealing.dealing(expr);
        }catch (NullPointerException e){
            return "0";
        }
        if(expr.equals("success")){
            return "0";
        }else if(expr.equals("fail")){
            return  "0";
        }
        return expr;
    }

    public void setExpr(String expr) {
        this.expr = expr;
    }

}