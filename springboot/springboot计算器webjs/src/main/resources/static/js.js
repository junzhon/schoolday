function cal(e) {
    //获取触发事件的元素

    var obj = e.target||e.srcElement;
    if(obj.nodeName != "BUTTON"){
        return;
    }
    var v = obj.innerHTML;


    var screen = document.getElementById("screen");
    if(v == "C"){
        screen.value = 0;
    }else if(v == "="){
        //获取到输入框的值
        var e=document.getElementById("expression");
        e.value= screen.value;
        try{
            var result = eval("("+exp+")");
            //将计算结果赋值给输入框
            screen.value = result;
        }catch(e){
            console.log(e);
            screen.value = "error";
        }
    }else{
        if(screen.value == 0){
            screen.value = "";
        }
        screen.value += v;
    }

}
