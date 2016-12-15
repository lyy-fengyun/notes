#xml 正则表达式
**问题场景：**
	将下面字符串中将xml文件内容提取出来？
```
这是一个xml文件<?xml version="1.0"?>
<collection shelf="New Arrivals">
    <movie title="Transformers">
       <type>Anime, Science Fiction</type>
       <format>DVD</format>
       <year>1989</year>
       <rating>R</rating>
       <stars>8</stars>
       <description>A schientific fiction</description>
    </movie>
       <movie title="Trigun">
       <type>Anime, Action</type>
       <format>DVD</format>
       <episodes>4</episodes>
       <rating>PG</rating>
       <stars>10</stars>
       <description>Vash the Stampede!</description>
    </movie>
    <movie title="Ishtar">
       <type>Comedy</type>
       <format>VHS</format>
       <rating>PG</rating>
       <stars>2</stars>
       <description>Viewable boredom</description>
    </movie>
</collection>这是文件的结尾
```
**解决方案：**
使用正则表达式进行文本匹配
```
(<collection[^>])([\s\S]*?)(</collection>)
```
- \s:匹配任何空白字符，包括空格、制表符、换页符等等。等价于 [ \f\n\r\t\v]。
  - \S:匹配任何非空白字符。等价于` [^ \f\n\r\t\v]`。
- ?: 表明是非贪婪匹配

