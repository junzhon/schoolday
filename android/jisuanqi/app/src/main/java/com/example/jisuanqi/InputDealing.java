package com.example.jisuanqi;
import java.util.ArrayList;
import java.util.EmptyStackException;
import java.util.List;
import java.util.Stack;
import java.util.regex.Pattern;
/*
  流程
  zhong -> checkMinus(zhong)->
  zhongToHou(zhong)->calculate(zhong)
*/
public class InputDealing {

    List<String> zhong;
    static int precision = 5;
    public static int getPrecision() {
        return precision;
    }
    public static float setPrecision(int precision,float num) throws DealingException{
        if(precision != -1 && precision > 0){
            String format = String.format("%%.%df",precision);
            num = Float.parseFloat(String.format(format,num));
        }else if(precision == -1){

        }
        else{
            throw new DealingException("不支持的精度");
        }
        return num;
    }
    private static String createRegex(){
        //保留 分隔符 分离 数字
        String ss = "(\\*|\\+|(sin)|(cos)|(sqrt)|/|-|(1/x)|(ln)|(!)|(exp)|\\^|(log)|\\(|\\)|(fac))";
        String superRegex = String.format("((?<=%s)|(?=%s))",ss,ss);
        return superRegex;
    }
    private static List<String> exp2zhong(String expression) throws DealingException{
        String regex = createRegex();

        List<String> a = new ArrayList<>();
        for(String s : expression.split(regex)){
            System.out.println(s);
            if(InputCheck.CheckNum(s) || InputCheck.CheckOperator(s) > 0 || s.equals("(") || s.equals(")") || !s.equals(" ")){
                a.add(s);
            }else{
                throw new DealingException(String.format("%s是非法字符！",s));
            }
        }
        return a;
    };//将从界面得到的表达式转化为中缀表达式

    public static String dealing(String expression, MainActivity activity){
        String ss = null;
        List<String> zhong = new ArrayList<String>();
        try{
            if(Pattern.matches("(\\S)*precision(\\S)*",expression)){
                String []sss = expression.split("precision");
                if(sss.length == 1 && Pattern.matches("([1-9]\\d*)|0", sss[0])){
                    precision = Integer.parseInt(sss[0]);
                    if(precision > 0 && precision <= 15){
                        throw new DealingException("精度设置成功");
                    }else{
                        precision = -1;
                        throw new DealingException("不支持的精度或精度错误");
                    }
                }else if(sss.length == 2 && Pattern.matches("([1-9]\\d*)|0", sss[1]) && sss[0].equals("")){
                    precision = Integer.parseInt(sss[1]);
                    if(precision > 0 && precision <= 15){
                        throw new DealingException("精度设置成功");
                    }else{
                        precision = -1;
                        throw new DealingException("不支持的精度或精度错误");
                    }
                }
            }
        }catch(DealingException e){
            if(e.hint().equals("精度设置成功")){
                return "success";
            }else if(e.hint().equals("不支持的精度或精度错误")){
                return "fail";
            }
        }
    try{
        zhong = exp2zhong(expression);
        if(zhong.size() == 0){

        }else if(zhong.size() == 1){
            String check = zhong.get(0);
            if(InputCheck.CheckNum(check)){

                if(check.equals("e")){
                    return String.valueOf(InputCheck.e);
                }else if(check.equals("PI")){
                    return String.valueOf(InputCheck.PI);
                }
                else if(!Pattern.matches(InputCheck.regex, check)){

                    String []science = check.split("E|e");
                    double a = (Math.round(Math.pow(Float.parseFloat(science[0]),Float.parseFloat(science[1]))));
                    check = String.valueOf(a);
                }
                return check;


            }
            else if(InputCheck.CheckOperator(check) > 0){
                return check;
            }
            else{
                throw new DealingException(String.format("%s是非法字符！",check));
            }
        }
        zhong = checkMinus(zhong);

        zhong  = zhongToHou(zhong);
        if(zhong.size() == 0){

        }
        ss = calculate(zhong);
    }catch(DealingException ee){
        ee.hint(activity);
        return "";
    }
        return ss;

    }
    /**
     * 检查负数
     * @author 2569660434@qq.com
     * @param  zhong
     * @return list
     * @throws DealingException
     */

    //待修改
    public static List<String> checkMinus(List<String> zhong){
        Object [] obj = zhong.toArray();
        List<String> zhongTemp = new ArrayList<String>();
        for(int count = 0; count < obj.length; count ++){
            if(obj[count].toString().equals("-")){
                if(count - 1 == -1 || (obj[count - 1].toString().equals("("))){
                    zhongTemp.add("0");
                    zhongTemp.add("-");
                }
                else if(InputCheck.CheckNum(obj[count - 1].toString())){
                    zhongTemp.add("-");
                }
                else{
                    if(count + 1 == obj.length){
                        break;
                    }else if(!obj[count].toString().equals("") && InputCheck.CheckNum(obj[count + 1].toString())){
                        obj[count] = obj[count].toString() + obj[count + 1].toString();
                        obj[count + 1] = "";
                        zhongTemp.add(obj[count].toString());
                    }
                }
            }else{
                zhongTemp.add(obj[count].toString());
            }
        }

        return zhongTemp;
    }//判断负数

    /**
     * 中缀转后缀
     * @author 2569660434@qq.com
     * @param zhong
     * @return  list
     * @throws DealingException
     */
    //参数zhong为中缀表达式列表
	public static List<String> zhongToHou(List<String> zhong) throws DealingException{
		//创建栈s1和列表s2
        Stack<String> s1 = new Stack<>();
        List<String> s2 = new ArrayList<>();
        String s;

        for (int i = 0; i < zhong.size();) {
            s = zhong.get(i);
            //为数字时直接压栈并将索引i向后移动
            if (InputCheck.CheckNum(s)) {
                // if it doesn't match the normal float number,
                //then matches with scientific number



                if(s.equals("e")){
                    s = String.valueOf(Math.E);
                }else if(s.equals("-e"))
                {
                    s = String.valueOf(- Math.E);
                }else if(s.equals("PI")){
                    s = String.valueOf(Math.PI);
                }else if(s.equals("-PI")){
                    s = String.valueOf(- Math.PI);
                }//处理常数

                s2.add(s);
                i++;
                if(!Pattern.matches(InputCheck.regex, s)){

                    String []science = s.split("E|e");
                    double a = (Math.round(Math.pow(Float.parseFloat(science[0]),Float.parseFloat(science[1]))));
                    s = String.valueOf(a);
                }//处理
            } else if (s.equals("(")) {
            	//为左括号时直接压栈并将索引i向后移动
                s1.push(s);
                i++;
            } else if (s.equals(")")) {
                try{
            	//为右括号时依次弹栈并存入列表s2，直到栈顶为左括号
                while (!s1.peek().equals("(")) {
                    s2.add(s1.pop());
                }
                }catch(EmptyStackException e){
                    throw new DealingException("括号不匹配");

                }
                //将栈顶的左括号弹出
                s1.pop();
                //索引向后移动
                i++;
            } else {
            	//当栈为空或者栈顶为 “(” 或运算符优先级大于栈顶运算符的优先级时直接压栈，并将索引向后移动。
                if (s1.empty() || s1.peek().equals("(") || InputCheck.CheckOperator(s) == 2 && Priority.priorty(s) > Priority.priorty(s1.peek())) {
                    s1.push(s);
                    i++;
                }else if(InputCheck.CheckOperator(s) == 1 && Priority.priorty(s) >= Priority.priorty(s1.peek())) {
                    s1.push(s);
                    i++;
                }
                else {
                	//当小于或等于栈顶运算符优先级时，将栈顶运算符弹出并存入列表s2中,此时索引不移动,以便让该运算符继续判断。
                    s2.add(s1.pop());
                }
            }
        }

        //将栈中剩余元素依次弹出并存入列表s2
        while (!s1.empty()) {
            s2.add(s1.pop());
        }
        //最后返回后缀表达式列表s2
        return s2;
    }

    /**
     * 通过传入后缀表达式列表进行计算
     * @param list
     * @return
     * @throws DealingException
     */
    public static String calculate(List<String> list) throws DealingException {
        Stack<String> stack = new Stack<>();
        float result = 0;

        for (String s : list) {
        	//当s为数字时直接压栈
            if (InputCheck.CheckNum(s)) {
                stack.push(s);
            } else if(InputCheck.CheckOperator(s) == 2){
                String num1;
                String num2;
            	//为二目运算符时弹出栈顶和次栈顶并进行运算
                try{
                    num2 = stack.pop();
                    num1 = stack.pop();
                }catch(EmptyStackException e){
                    throw new DealingException("数字与符号不匹配");

                }

                float numm1 = Float.parseFloat(num1);
                float numm2 = Float.parseFloat(num2);

                switch (s) {
                    case "+":
                        System.out.println("1");
                        result = numm1 + numm2;
                        break;
                    case "-":
                        result =numm1 - numm2;
                        break;
                    case "*":
                        result = numm1 * numm2;
                        break;
                    case "/":
                        if(numm2 == 0f){
                            throw new DealingException("不能除以零");

                        }else{
                            result = numm1 / numm2;
                        }
                        break;
                    case "log":
                        System.out.println("1");
                        if(numm1 < 0 || numm2 < 0){
                            throw new DealingException("锟斤拷烫烫烫");

                        }
                        result = (float) (Math.log(numm1) / Math.log(numm2));
                        //base changing formula
                        // log(b,a) = ln(b,e) / ln(a,e)
                        // b is the antilog like the 3 in ln(3)
                        // while a is the base like e in ln(x)
                        // e is the natural constant
                        break;
                    case "^":
                        result = (float) Math.pow(numm1, numm2);
                        break;
                    default:
                        throw new DealingException("含有非法字符");

                    }
                result = setPrecision(precision, result);
                stack.push(String.valueOf(result));
            }else if(InputCheck.CheckOperator(s) == 1){
                String num;
                try{
                    num = stack.pop();
                }catch(EmptyStackException e){
                    throw new DealingException("可能原因: 字符数量与操作符不匹配\n"+
                        "如果是因为log, 请使用如9log3这样的方法操作log"
                    );

                }

                float numm = Float.parseFloat(num);
                switch(s){
                    case "ln":
                        result = (float) Math.log(numm);
                        break;
                    case "sin":
                        result = (float) Math.sin(numm);
                        break;
                    case "cos":
                        result = (float) Math.cos(numm);
                        break;
                    case "exp":
                        result = (float) Math.exp(numm);
                        break;
                    case "fac":
                    try{
                        result = InputCheck.factorial(numm);
                    }catch(Exception E){
                        System.out.println("数据溢出");
                    }
                        if(result == -1){

                        }
                        break;
                    case "sqrt":
                        if(numm < 0){
                            throw new DealingException("sqrt不能低于零");

                        }
                        result = (float) Math.sqrt(numm);
                        break;
                }
                //,"sqrt","n!","exp","1/x","ln","cos","+/-","sin"
                result = setPrecision(precision, result);
                stack.push(String.valueOf(result));
            }
                //将运算结果压入栈
        }
        //返回运算结果
        String xx;
        try{
            xx = stack.pop();
        }catch(EmptyStackException e){
            throw new DealingException(
             "EmptyStackException:Your operator "+
             "is not matched with the amount of number");

        }

        if(!stack.isEmpty()){
            throw new DealingException("运算符数量与数字的数量不匹配");

        }
        return xx;
    }

}
