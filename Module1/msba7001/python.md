##### get

`dict.get(k, default)`

返回字典dict对应k的value，如果没有则返回default

##### map

`map(func, *iterables)`

可以对数据容器中的内容进行操作（可以使用lambda）。

##### filter

`filter(func, *iterables)`

返回iterable中func为TRUE的结果。

#### file I/O

`os.chdir()`改变目前的工作目录到新的目录下

`f.seek(0)`将指针放到0的位置

`open('filepath', 'w', encoding=, newline=)`通过newline可以设置默认行结尾的内容（可以设置为空），write的时候手动添加\n

##### csv.reader(f)

每次调用reader时，会重新读取，设置f.seek(0)可以重设指针。

##### json

`json.load(f)`

load dump操作文件流，loads dumps操作字符串

`json.dump(file1, file2, [, indent])`

将内容file1写入file2的对象，转化成json格式，indent表示在每一行前有多少空格（格式化json，4则为标准格式化后的json）

##### enumerate函数

```python
enumerate(var, start)
# 返回一个标号的enumerate对象（给列表的数据标号，start默认为0）
```

##### 正则表达式

```python
pattern = re.compile() # 创建一个正则表达式对象
pattern.search(text)	# 通过pattern对象找符合情况的text内容，search只返回true or false
pattern.findall(text)	# 返回所有符合条件的内容组成的列表
'.+?'非贪心，'.+'贪心算法
# 用[]来表示一个结合，匹配内部的任意内容，内部内容会被自动转义，用()可以表示一个组合。
# {x} 用以表示前面的内容出现x次,也可使用{x,y}表示最小x次，最大y次

```

![image-20240904120155799](C:\Users\15635\AppData\Roaming\Typora\typora-user-images\image-20240904120155799.png)

##### file.readlines()

返回一个列表，每行是一个元素

##### str.isdigit判断是否是数字，float.is_integer()判断是否是整数

作用对象不一样

##### format

```python
print(f"{var:^10}, {var:>15%}, {var:.2f}, {var.capitalize()})	# ^居中，>右对齐, capitalize()首字母大写，%百分比，e：exponentiation幂
```

##### collections.defaultdict 默认值字典

```python
import collections 
mp = collections.defaultdict(list)
# mp是一个字典，默认value是一个空的list
```

##### join

```python
str.join(list)
# list转字符串
```

