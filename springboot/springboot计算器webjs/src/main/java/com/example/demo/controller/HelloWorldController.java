package com.example.demo.controller;

import java.util.Map;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HelloWorldController {

    @GetMapping("/eval")

    public String greetingForm(Model model) {
        model.addAttribute("expression", new Expression());
        return "operation";
    }

    @PostMapping("/eval")
    public String greetingSubmit(@ModelAttribute Expression expression, Map<String, Object> map) {

        try{
            System.out.println(expression.getExpr());
            // 定义shell返回值
            String result = null;
            try {
                ScriptEngineManager mgr = new ScriptEngineManager();
                ScriptEngine engine = mgr.getEngineByName("javascript");
                result = engine.eval(expression.getExpr()).toString();
            } catch (ScriptException e) {
                e.printStackTrace();
                result = "Error expression: " + e.getMessage();
            }
            System.out.println(result);

            if (result.startsWith("Error")) {
                map.put("answer", result.toString() );
            } else {
                map.put("answer", result.toString() ); //增加一个answer属性，html文件读取该属性，显示结果
            }
        }catch(Exception err){
            map.put("answer", err.toString() );
        }

        return "operation";
    }

}