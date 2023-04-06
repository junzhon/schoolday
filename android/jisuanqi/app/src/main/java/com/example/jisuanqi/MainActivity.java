package com.example.jisuanqi;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.text.util.Linkify;
import android.util.AttributeSet;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.BreakIterator;
import com.example.jisuanqi.InputDealing;
import com.example.jisuanqi.InputCheck;
import com.example.jisuanqi.DealingException;
import com.example.jisuanqi.WayToHintErrorMessage;
import com.example.jisuanqi.Priority;

import java.util.regex.Pattern;
import java.util.ArrayList;
import java.util.EmptyStackException;
import java.util.List;
import java.util.Stack;
public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    EditText et_input;
    boolean clr_flag;
     @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TextView t1 = (TextView)findViewById(R.id.text1);//button是textview的子类
//         InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
//         imm.toggleSoftInput(0, InputMethodManager.HIDE_NOT_ALWAYS);
        String s1 = "<font color='blue'><b>因为各种原因稍微遗憾的作业废案</b></font><br>";
        s1 += "<a href = 'http://n404i19600.wicp.vip/'>未完待续</a>";
        t1.setText(Html.fromHtml(s1));
        t1.setMovementMethod(LinkMovementMethod.getInstance());
         initView();
    }

    private void initView() {
        Button btn1 = (Button) findViewById(R.id.btn1);
        Button btn2 = (Button) findViewById(R.id.btn2);
        Button btn3 = (Button) findViewById(R.id.btn3);
        Button btn4 = (Button) findViewById(R.id.btn4);
        Button btn5 = (Button) findViewById(R.id.btn5);
        Button btn6 = (Button) findViewById(R.id.btn6);
        Button btn7 = (Button) findViewById(R.id.btn7);
        Button btn8 = (Button) findViewById(R.id.btn8);
        Button btn9 = (Button) findViewById(R.id.btn9);
        Button btnback = (Button) findViewById(R.id.back);
        Button btnclear = (Button) findViewById(R.id.clear);
        Button btnjia = (Button) findViewById(R.id.btnplus);
        Button btnjian= (Button) findViewById(R.id.btnjian);
        Button btncheng = (Button) findViewById(R.id.btnx);
        Button btnchu = (Button) findViewById(R.id.btnchu);
        Button btn0= (Button) findViewById(R.id.btn0);
        Button btndian = (Button) findViewById(R.id.btndian);
        Button btndeng = (Button) findViewById(R.id.btndeng);
        Button btnN= (Button) findViewById(R.id.btnN);
        Button btnYC= (Button) findViewById(R.id.btnYC);
        Button btnZC= (Button) findViewById(R.id.btnZC);
        Button btnEXP= (Button) findViewById(R.id.btnEXP);
        Button btncos= (Button) findViewById(R.id.btncos);
        Button btnSIN= (Button) findViewById(R.id.btnSIN);
        Button btnPI= (Button) findViewById(R.id.btnPI);
        Button btnLN= (Button) findViewById(R.id.btnLN);
        Button btnlog= (Button) findViewById(R.id.btnlog);
        Button btnXN= (Button) findViewById(R.id.btnXN);
        Button btnX1= (Button) findViewById(R.id.btnx1);
        Button btnSQRT= (Button) findViewById(R.id.btnsqrt);
        Button btnjd= (Button) findViewById(R.id.btnjd);
        Button btne= (Button) findViewById(R.id.btne);
        et_input= (EditText) findViewById(R.id.et_input);

        btn0.setOnClickListener(this);
        btn1.setOnClickListener(this);
        btn2.setOnClickListener(this);
        btn3.setOnClickListener(this);
        btn4.setOnClickListener(this);
        btn5.setOnClickListener(this);
        btn6.setOnClickListener(this);
        btn7.setOnClickListener(this);
        btn8.setOnClickListener(this);
        btn9.setOnClickListener(this);
        btndeng.setOnClickListener(this);
        btndian.setOnClickListener(this);
        btnchu .setOnClickListener(this);
        btncheng.setOnClickListener(this);
        btnjian.setOnClickListener(this);
        btnjia.setOnClickListener(this);
        btnclear.setOnClickListener(this);
        btnback.setOnClickListener(this);
        btnN.setOnClickListener(this);
        btnYC.setOnClickListener(this);
        btnZC.setOnClickListener(this);
        btnEXP.setOnClickListener(this);
        btncos.setOnClickListener(this);
        btnSIN.setOnClickListener(this);
        btnLN.setOnClickListener(this);
        btnlog.setOnClickListener(this);
        btnX1.setOnClickListener(this);
        btnXN.setOnClickListener(this);
        btnSQRT.setOnClickListener(this);
        btnPI.setOnClickListener(this);
        btnjd.setOnClickListener(this);
        btne.setOnClickListener(this);


    }

    public void onClick(View v) {

        String str=et_input.getText().toString();
        switch (v.getId()){
            case R.id.btn0:

            case R.id.btn1:

            case R.id.btn2:

            case R.id.btn3:

            case R.id.btn4:

            case R.id.btn5:

            case R.id.btn6:

            case R.id.btn7:

            case R.id.btn8:

            case R.id.btn9:
            case R.id.btnPI:
            case R.id.btnN:
            case R.id.btnXN:
            case R.id.btnx1:

            case R.id.btnsqrt:
            case R.id.btnZC:
            case R.id.btnYC:
            case R.id.btnlog:
            case R.id.btnLN:
            case R.id.btne:
            case R.id.btnEXP:
            case R.id.btncos:
            case R.id.btnSIN:
            case  R.id.btndian:
                if(clr_flag){
                    clr_flag=false;
                    str="";
                    et_input.setText("");
                }
                et_input.setText(str+((Button)v).getText());
                break;
            case R.id.btnplus:
            case R.id.btnjian:
            case R.id.btnx:
            case R.id.btnchu:
            case R.id.btnjd:

                if(clr_flag){
                    clr_flag=false;
                    str="";
                    et_input.setText("");
                }
                if(str.contains("+")||str.contains("-")||str.contains("×")||str.contains("÷")) {
                    str=str.substring(0,str.indexOf(" "));
                }
                et_input.setText(str+" "+((Button)v).getText()+" ");
                break;
            case R.id.clear:
                if(clr_flag)
                    clr_flag=false;
                str="";
                et_input.setText("");
                break;
            case R.id.back: //判断是否为空，然后在进行删除
                if(clr_flag){
                    clr_flag=false;
                    str="";
                    et_input.setText("");
                }
                else if(str!=null&&!str.equals("")){
                    et_input.setText(str.substring(0,str.length()-1));
                }
                break;
            case R.id.btndeng: //单独运算最后结果
                getResult();//调用下面的方法
                break;
        }
    }

    private void getResult() {
        String exp=et_input.getText().toString();
        System.out.println(exp.replace(" ",""));
        exp=exp.replace(" ","");
        try {
            exp=URLEncoder.encode(exp,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        try {
            exp=URLDecoder.decode(exp,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String result = InputDealing.dealing(exp,this);
        if(result.equals("success")){
            new AlertDialog.Builder(this).setTitle("成功").setMessage("设置精度成功").setPositiveButton("确定",null).show();
            et_input.setText("");
        }else if(result.equals("fail")){
            new AlertDialog.Builder(this).setTitle("错误").setMessage("设置精度失败,精度范围0-15").setPositiveButton("确定",null).show();
            et_input.setText("");
        }else {
            et_input.setText(result);
        }
//        float j = (float) Math.exp(4);
//        et_input.setText(j+"");
        //无需main外其他类的简易计算器
//        if(exp==null||exp.equals("")) return ;
//        //因为没有运算符所以不用运算
//        if(!exp.contains(" ")){
//            return ;
//        }
//        if(clr_flag){
//            clr_flag=false;
//            return;
//        }
//        clr_flag=true;
//        //截取运算符前面的字符串
//        String s1=exp.substring(0,exp.indexOf(" "));
//        //截取的运算符
//        String op=exp.substring(exp.indexOf(" ")+1,exp.indexOf(" ")+2);
//        //截取运算符后面的字符串
//        String s2=exp.substring(exp.indexOf(" ")+3);
//        double cnt=0;
//        if(!s1.equals("")&&!s2.equals("")){
//            double d1=Double.parseDouble(s1);
//            double d2=Double.parseDouble(s2);
//            if(op.equals("+")){
//                cnt=d1+d2;
//            }
//            if(op.equals("-")){
//                cnt=d1-d2;
//            }
//            if(op.equals("×")){
//                cnt=d1*d2;
//            }
//            if(op.equals("÷")){
//                if(d2==0) cnt=0;
//                else cnt=d1/d2;
//            }
//            if(!s1.contains(".")&&!s2.contains(".")&&!op.equals("÷")) {
//                int res = (int) cnt;
//                et_input.setText(res+"");
//            }else {
//                et_input.setText(cnt+"");}
//        }
//        //如果s1是空    s2不是空  就执行下一步
//        else if(!s1.equals("")&&s2.equals("")){
//            double d1=Double.parseDouble(s1);
//            if(op.equals("+")){
//                cnt=d1;
//            }
//            if(op.equals("-")){
//                cnt=d1;
//            }
//            if(op.equals("×")){
//                cnt=0;
//            }
//            if(op.equals("/")){
//                cnt=0;
//            }
//            if(!s1.contains(".")) {
//                int res = (int) cnt;
//                et_input.setText(res+"");
//            }else {
//                et_input.setText(cnt+"");}
//        }
//        //如果s1是空    s2不是空  就执行下一步
//        else if(s1.equals("")&&!s2.equals("")){
//            double d2=Double.parseDouble(s2);
//            if(op.equals("+")){
//                cnt=d2;
//            }
//            if(op.equals("-")){
//                cnt=0-d2;
//            }
//            if(op.equals("×")){
//                cnt=0;
//            }
//            if(op.equals("÷")){
//                cnt=0;
//            }
//            if(!s2.contains(".")) {
//                int res = (int) cnt;
//                et_input.setText(res+"");
//            }else {
//                et_input.setText(cnt+"");}
//        }
//        else {
//            et_input.setText("");
//        }
    }

}


