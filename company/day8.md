##读源码需要的知识
1. 常见的设计模式和算法
2. IO流
3. 反射
4. 线程
5. 内部类
6. 集合
7. xml语法
8. 注解

##前端学习
- jqury
- json
- ajax
- node.js
- javascript
- dtd
- schema
- 正则表达式

###前端技术
- css(样式)+html(布局)+javaScript(交互，特效，验证)
- bootstrap（css库）
- jqury(js库)
- ajax XMLhttpRequest对象

##代码
    public void registerAlias(String alias, Class<?> value){
	    if (alias == null) throw new TypeException("The parameter alias cannot be null");
	    String key = alias.toLowerCase(Locale.ENGLISH); // issue #748
	    if (TYPE_ALIASES.containsKey(key) && TYPE_ALIASES.get(key) != null && !TYPE_ALIASES.get(key)	.equals(value)) {
	      throw new TypeException("The alias '" + alias + "' is already mapped to the value '" + TYPE_ALIASES.get(key).getName() + "'.");
	    }
	    TYPE_ALIASES.put(key, value);
	}

- 元注解
- 系统注解
- 自定义注解

#正则
	-?(0.[1-9]\d*)(\.\d+)?([eE][+-]?\d+)?
年月日：写正则表达式

spring ioc 加载自己的配置文件
spring mvc 加载mvc需要的配置文件
可以将公共的bean配置进行抽取，得到一个公共的配置文件


#项目整合顺序
spring
spring + mybits
spting + mybits + spring mvc
