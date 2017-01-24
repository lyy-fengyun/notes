# optparse
作用：可以方便地生成标准的、符合Unix/Posix 规范的命令行说明
### 简单用例
```
from optparse import OptionParser  
[...]  
parser = OptionParser()  
parser.add_option("-f", "--file", dest="filename",  
                  help="write report to FILE", metavar="FILE")  
parser.add_option("-q", "--quiet",  
                  action="store_false", dest="verbose", default=True,  
                  help="don't print status messages to stdout")  
  
(options, args) = parser.parse_args()  
```