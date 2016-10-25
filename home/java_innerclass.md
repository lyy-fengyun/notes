#java 内部类 
  内部类就是一个类中还包含着一个类。
	//外部类
    class Out {
        private int age = 12;

        //内部类
        class In {
            public void print() {
                System.out.println(age);
            }
        }
    }
    public class Demo {
        public static void main(String[] args) {
            Out.In in = new Out().new In();
            in.print();
            //或者采用下种方式访问
            /*
            Out out = new Out();
            Out.In in = out.new In();
            in.print();
            */
        }
    }
程序编译过后会产生两个.class文件，分别是Out.class和Out$In.class
其中$代表了上面程序中Out.In中的那个 .

Out.In in = new Out().new In()可以用来生成内部类的对象，这种方法存在两个小知识点需要注意
　　1.开头的Out是为了标明需要生成的内部类对象在哪个外部类当中
　　2.必须先有外部类的对象才能生成内部类的对象，因为内部类的作用就是为了访问外部类中的成员变量
　　
### 2,内部类变量的访问方法
	class Out {
        private int age = 12;

        class In {
            private int age = 13;
            public void print() {
                int age = 14;
                System.out.println("局部变量：" + age);
                System.out.println("内部类变量：" + this.age);
                System.out.println("外部类变量：" + Out.this.age);
            }
        }
    }
    public class Demo {
        public static void main(String[] args) {
            Out.In in = new Out().new In();
            in.print();
        }
    }
从上面的代码中可以发现，内部类在没有同名成员变量和局部变量的情况下，内部类会直接访问外部类的成员变量，而无需指定Out.this.属性名

否则，内部类中的局部变量会覆盖外部类的成员变量
而访问内部类本身的成员变量可用this.属性名，访问外部类的成员变量需要使用Out.this.属性名

###实例3：静态内部类
    class Out {
        private static int age = 12;

        static class In {
            public void print() {
                System.out.println(age);
            }
        }
    }

    public class Demo {
        public static void main(String[] args) {
            Out.In in = new Out.In();
            in.print();
        }
    }
如果用static 将内部内静态化，那么内部类就只能访问外部类的静态成员变量，具有局限性
其次，因为内部类被静态化，因此Out.In可以当做一个整体看，可以直接new 出内部类的对象（通过类名访问static，生不生成外部类对象都没关系）

###实例4：私有内部类
    class Out {
        private int age = 12;

        private class In {
            public void print() {
                System.out.println(age);
            }
        }
        public void outPrint() {
            new In().print();
        }
    }
    public class Demo {
        public static void main(String[] args) {
            //此方法无效
            /*
            Out.In in = new Out().new In();
            in.print();
            */
            Out out = new Out();
            out.outPrint();
        }
    }
如果一个内部类只希望被外部类中的方法操作，那么可以使用private声明内部类
上面的代码中，我们必须在Out类里面生成In类的对象进行操作，而无法再使用Out.In in = new Out().new In() 生成内部类的对象
也就是说，此时的内部类只有外部类可控制

###实例5：方法内部类
    class Out {
        private int age = 12;

        public void Print(final int x) {
            class In {
                public void inPrint() {
                    System.out.println(x);
                    System.out.println(age);
                }
            }
            new In().inPrint();
        }
    }

    public class Demo {
        public static void main(String[] args) {
            Out out = new Out();
            out.Print(3);
        }
    }
在上面的代码中，我们将内部类移到了外部类的方法中，然后在外部类的方法中再生成一个内部类对象去调用内部类方法
如果此时我们需要往外部类的方法中*传入参数*，那么外部类的方法形参必须使用 **final** 定义
至于final在这里并没有特殊含义，只是一种表示形式而已

#匿名内部类
匿名内部类也就是没有名字的内部类
正因为没有名字，所以匿名内部类只能使用一次，
它通常用来简化代码编写，但使用匿名内部类还有个前提条件：必须继承一个父类或实现一个接口必须继承一个父类或实现一个接口

###实例1:不使用匿名内部类来实现抽象方法
    abstract class Person {
        public abstract void eat();
    }

    class Child extends Person {
        public void eat() {
            System.out.println("eat something");
        }
    }

    public class Demo {
        public static void main(String[] args) {
            Person p = new Child();
            p.eat();
        }
    }
#####运行结果：eat something
可以看到，我们用Child继承了Person类，然后实现了Child的一个实例，将其向上转型为Person类的引用
但是，如果此处的Child类只使用一次，那么将其编写为独立的一个类岂不是很麻烦？
这个时候就引入了匿名内部类

###实例2：匿名内部类的基本实现
    abstract class Person {
        public abstract void eat();
    }

    public class Demo {
        public static void main(String[] args) {
            Person p = new Person() {
                public void eat() {
                    System.out.println("eat something");
                }
            };
            p.eat();
        }
    }
#####运行结果：eat something
可以看到，我们直接将抽象类Person中的方法在大括号中实现了
这样便可以省略一个类的书写
并且，匿名内部类还能用于接口上

###实例3：在接口上使用匿名内部类
    interface Person {
        public void eat();
    }

    public class Demo {
        public static void main(String[] args) {
            Person p = new Person() {
                public void eat() {
                    System.out.println("eat something");
                }
            };
            p.eat();
        }
    }
#####运行结果：eat something
由上面的例子可以看出，只要一个类是抽象的或是一个接口，那么其子类中的方法都可以使用匿名内部类来实现
最常用的情况就是在多线程的实现上，因为要实现多线程必须继承Thread类或是继承Runnable接口

###实例4：Thread类的匿名内部类实现
    public class Demo {
        public static void main(String[] args) {
            Thread t = new Thread() {
                public void run() {
                    for (int i = 1; i <= 5; i++) {
                        System.out.print(i + " ");
                    }
                }
            };
            t.start();
        }
    }
#####运行结果：1 2 3 4 5

 

###实例5：Runnable接口的匿名内部类实现
    public class Demo {
        public static void main(String[] args) {
            Runnable r = new Runnable() {
                public void run() {
                    for (int i = 1; i <= 5; i++) {
                        System.out.print(i + " ");
                    }
                }
            };
            Thread t = new Thread(r);
            t.start();
        }
    }
#####运行结果：1 2 3 4 5
