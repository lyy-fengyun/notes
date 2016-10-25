# javascript note
\<script> \</script>
alert('.....');
javascript中，语句以 ; 号结尾。
var x =1;
'hello world'; 这样也可以看作是一个语句 
// 行注释
/*  */ 多行注释
### 数据类型
- Number 不区分整数与浮点数 NaN Infinity
- 字符串
- 布尔值 true false && || !
- 比较运算符  > >= == ===  
- 数组    
用 [var, var, ...]  用[]定义数组，用 , 表示分隔 以0开始进行索引

- 对象  
是一组由键值对组成的无序集合， 键是字符串类型，值是任意类型，通过 对象变量.属性名 得到对象的属性

- 变量
- strict 模式 
变量未声明就使用，则变量就是全局变量。var声明的变量作用域在函数体内，strict模式强制变量进行声明，通过 \`use strict\`说明要声明变量

第一种是 **==** 比较，它会自动转换数据类型再比较，很多时候，会得到非常诡异的结果；
第二种是 **===** 比较，它不会自动转换数据类型，如果数据类型不一致，返回false，如果一致，再比较。

由于JavaScript这个设计缺陷，不要使用==比较，始终坚持使用===比较。
另一个例外是NaN这个特殊的Number与所有其他值都不相等，包括它自己：
*NaN === NaN; // false*
唯一能判断NaN的方法是通过isNaN()函数：
isNaN(NaN); // true

null 空值 undefined 未定义 
大多数情况下，我们都应该用null。undefined仅仅在判断函数参数是否传递的情况下有用。

### 字符串
'' " " 表明字符串， \`\`表明可以写多行文本，省略了 \n 换行符
字符串不可变
\`这是一个
多行
字符串\`;
可以通过 + 号进行字符串的拼接，
通过 ${var} 可以自动替换字符串中的变量(ES6标准下可以使用 模板字符串)
####常见操作
	var s = 'Hello, world!';
	s.length; // 13
    
    var s = 'Hello, world!';
    s[0]; // 'H'
    s[6]; // ' '
    s[7]; // 'w'
    s[12]; // '!'
    s[13]; // undefined 超出范围的索引不会报错，但一律返回undefined

- toUpperCase()
        var s = 'Hello';
        s.toUpperCase(); // 返回'HELLO'
- toLowerCase()
        var s = 'Hello';
        var lower = s.toLowerCase(); // 返回'hello'并赋值给变量lower
        lower; // 'hello'
- indexOf()
        var s = 'hello, world';
        s.indexOf('world'); // 返回7
        s.indexOf('World'); // 没有找到指定的子串，返回-1
- substring()返回指定索引区间的子串：
        var s = 'hello, world'
        s.substring(0, 5); // 从索引0开始到5（不包括5），返回'hello'
        s.substring(7); // 从索引7开始到结束，返回'world'

#### 数组 
数组中的 length 属性可以表明数组长度

直接给Array的length赋一个新的值会导致Array大小的变化：

    var arr = [1, 2, 3];
    arr.length; // 3
    arr.length = 6;
    arr; // arr变为[1, 2, 3, undefined, undefined, undefined]
    arr.length = 2;
    arr; // arr变为[1, 2]

如果通过索引赋值时，索引超过了范围，同样会引起Array大小的变化：
	var arr = ['A', 'B', 'C'];
    arr[1] = 99;
    arr; // arr现在变为['A', 99, 'C']
大多数其他编程语言不允许直接改变数组的大小，越界访问索引会报错。然而，JavaScript的Array却不会有任何错误。在编写代码时，不建议直接修改Array的大小，访问索引时要确保索引不会越界。

indexOf

与String类似，Array也可以通过indexOf()来搜索一个指定的元素的位置：

    var arr = [10, 20, '30', 'xyz'];
    arr.indexOf(10); // 元素10的索引为0
    arr.indexOf(20); // 元素20的索引为1
    arr.indexOf(30); // 元素30没有找到，返回-1
    arr.indexOf('30'); // 元素'30'的索引为2
    注意了，数字30和字符串'30'是不同的元素。

slice

slice()就是对应String的substring()版本，它截取Array的部分元素，然后返回一个新的Array：

    var arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
    arr.slice(0, 3); // 从索引0开始，到索引3结束，但不包括索引3: ['A', 'B', 'C']
    arr.slice(3); // 从索引3开始到结束: ['D', 'E', 'F', 'G']
    注意到slice()的起止参数包括开始索引，不包括结束索引。

如果不给slice()传递任何参数，它就会从头到尾截取所有元素。利用这一点，我们可以很容易地复制一个Array：

    var arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
    var aCopy = arr.slice();
    aCopy; // ['A', 'B', 'C', 'D', 'E', 'F', 'G']
    aCopy === arr; // false
    push和pop

push()向Array的末尾添加若干元素，pop()则把Array的最后一个元素删除掉：
    var arr = [1, 2];
    arr.push('A', 'B'); // 返回Array新的长度: 4
    arr; // [1, 2, 'A', 'B']
    arr.pop(); // pop()返回'B'
    arr; // [1, 2, 'A']
    arr.pop(); arr.pop(); arr.pop(); // 连续pop 3次
    arr; // []
    arr.pop(); // 空数组继续pop不会报错，而是返回undefined
    arr; // []
    unshift和shift

如果要往Array的头部添加若干元素，使用unshift()方法，shift()方法则把Array的第一个元素删掉：

    var arr = [1, 2];
    arr.unshift('A', 'B'); // 返回Array新的长度: 4
    arr; // ['A', 'B', 1, 2]
    arr.shift(); // 'A'
    arr; // ['B', 1, 2]
    arr.shift(); arr.shift(); arr.shift(); // 连续shift 3次
    arr; // []
    arr.shift(); // 空数组继续shift不会报错，而是返回undefined
    arr; // []
    sort

sort()可以对当前Array进行排序，它会直接修改当前Array的元素位置，直接调用时，按照默认顺序排序：

    var arr = ['B', 'C', 'A'];
    arr.sort();
    arr; // ['A', 'B', 'C']
能否按照我们自己指定的顺序排序呢？完全可以，我们将在后面的函数中讲到。

reverse

reverse()把整个Array的元素给掉个个，也就是反转：

    var arr = ['one', 'two', 'three'];
    arr.reverse(); 
    arr; // ['three', 'two', 'one']
splice

splice()方法是修改Array的“万能方法”，它可以从指定的索引开始删除若干元素，然后再从该位置添加若干元素：

    var arr = ['Microsoft', 'Apple', 'Yahoo', 'AOL', 'Excite', 'Oracle'];
    // 从索引2开始删除3个元素,然后再添加两个元素:
    arr.splice(2, 3, 'Google', 'Facebook'); // 返回删除的元素 ['Yahoo', 'AOL', 'Excite']
    arr; // ['Microsoft', 'Apple', 'Google', 'Facebook', 'Oracle']
    // 只删除,不添加:
    arr.splice(2, 2); // ['Google', 'Facebook']
    arr; // ['Microsoft', 'Apple', 'Oracle']
    // 只添加,不删除:
    arr.splice(2, 0, 'Google', 'Facebook'); // 返回[],因为没有删除任何元素
    arr; // ['Microsoft', 'Apple', 'Google', 'Facebook', 'Oracle']
concat

concat()方法把当前的Array和另一个Array连接起来，并返回一个新的Array：

    var arr = ['A', 'B', 'C'];
    var added = arr.concat([1, 2, 3]);
    added; // ['A', 'B', 'C', 1, 2, 3]
    arr; // ['A', 'B', 'C']
请注意，concat()方法并没有修改当前Array，而是返回了一个新的Array。

实际上，concat()方法可以接收任意个元素和Array，并且自动把Array拆开，然后全部添加到新的Array里：

    var arr = ['A', 'B', 'C'];
    arr.concat(1, 2, [3, 4]); // ['A', 'B', 'C', 1, 2, 3, 4]
join

join()方法是一个非常实用的方法，它把当前Array的每个元素都用指定的字符串连接起来，然后返回连接后的字符串：

    var arr = ['A', 'B', 'C', 1, 2, 3];
    arr.join('-'); // 'A-B-C-1-2-3'
如果Array的元素不是字符串，将自动转换为字符串后再连接。

多维数组

如果数组的某个元素又是一个Array，则可以形成多维数组，例如：

	var arr = [[1, 2, 3], [400, 500, 600], '-'];
上述Array包含3个元素，其中头两个元素本身也是Array。





