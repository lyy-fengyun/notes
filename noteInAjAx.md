Note in ajax
所有现代浏览器均支持XMLHttpRequest对象，XMLHttpRequest用于在后台与服务器交换数。
创建XMLHttpRequest对象的语法：
Var = new XMLHttpRequest();
使用open(),send()向服务器发送请求。
Xmlhttp.open(“GET”,”url”,true)
open(method,url,async) 
method:请求类型，GET POST
url:文件在服务器上的位置
async：true(异步) false同步
send(string) 用于post请求

使用ajax通过get方法发送数据
xmlhttp.open("GET","test1.txt",true);
xmlhttp.send();

通过POST像表单一个发送请求，要使用setRequestHeader()添加http头，在send()方法中设
置发送的数据

xmlhttp.open("POST","ajax.asp",true);
xmlhttp.setRequestHeader("Content-type","application/x-www.form-urlencoded");
xmlhttp.send("fname=bill&name=gates");

setRequestHeader(header,value) 
    header:规定头的名称
    value:规定头的值
    
XMLHttpRequest用于ajax时，open方法中的async参数必须是 true

获取来自服务器的响应，使用 responseText 或者 responseXML

通过 document.getElementById("myDiv").innerHtml.responseText;使用得到的响应信息

onreadystatechange事件：
    readyState改变时会触发onreadystatechange事件。
    readyState存有XMLHttpRequest的状态，从0到4
        0：请求未初始化
        1：服务器连接已建立
        2: 请求已接收
        3：请求处理中
        4：请求已完成，且响应已就绪
    status: 200  ok  404:未找到页面
    
javascript:
    document.write();向页面输出信息
    alert(); 函数
    onclick=""  onclick事件，buttorn上的点击事件
    document.getElementByID("some id") 查找元素
    通过id得到html页面中的相应元素
    innerHtml可以代表html中页面元素的内容
