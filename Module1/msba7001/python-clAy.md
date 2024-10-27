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
pattern = re.compile('\b[a-z]{5}\b')	# \b表示pattern将会只匹配words
```

![image-20240904120155799](C:\Users\15635\AppData\Roaming\Typora\typora-user-images\image-20240904120155799.png)

**special use**

![image-20240907095703487](C:\Users\15635\AppData\Roaming\Typora\typora-user-images\image-20240907095703487.png)

```python
x(?=y)	# x后面跟着y，只返回x
x(?!y)	# x后面不跟着y，只返回x
(?<=y)x	# x前面有y，只返回x
(?<!y)x	# x前面有y，只返回x
```

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



#### numpy&pandas

##### np.array(data,dtype=)

通过np.array创建一个array对象

```python
arr.size
arr.shape
arr.ndim
arr.dtype
np.info(arr)

np.append(arr,values)			# 插入值(end)
np.insert(arr,index,values)		# 指定index插入
np.delete(arr,row,axis=0)			# 删除指定值
np.isnan(arr)					# 返回True or False，是否有空值，类型是array。可以用.sum()计算总共有多少nan，或者使用.all()|.any()判断是否全是nan|存在nan
np.argwhere(arr)				# 返回非0值的索引，每个索引是一个[]

arr.sort(axis=0)
arr.reshape(x,y)				# 改变成x行y列，也可以写-1，表示根据另一个值reshape
arr.all()						# 如果全为True，返回True，否则返回False
arr.any()						# 如果一个为True，则返回True，否则返回False

np.concatenate((a,b),axis=0|1)	# axis=0垂直方向累加，axis=1水平方向累加
np.vstack((arr1,arr2))			# 垂直方向累加数组
np.hstack((arr1,arr2))			# 水平方向累加数组

np.loadtxt()		# read txt
np.genfromtxt()		# read csv
np.savetxt()		# save csv

# 类似切片的用法
arr[x,y]	# 用:来进行切片，当xy都是切片时，会返回二维数组，否则返回一维数组

# File I/O
np.loadtxt()	# reads from text file
np.genfromtxt()
np.genfromtxt('../data_in/hk_covid_stats.csv', delimiter = ',', skip_header = 1, usecols = 2)		# reads csv, skip_header跳过表头，usecols用索引表示，多列用[]
np.savetxt()	# write csv or txt

```



##### pandas

```python
df.dtypes, s.dtype		# 查看type
df.shape
df.index				# row索引
df.columns				# col索引
df.head(n)				# 前5行
df.tail(n)				# 后5行

df.unique()				# 去重查看value
df.value_counts()		# 查看所有种value和计数

df.rename()				# 重命名列（或行）
df.columns = ['a','b','c'] #重命名列
df.drop('colname', axis=1)					# 删除某一列
df.drop_duplicates()

df.reset_index(drop = True, inplace = True)	# 重设索引

# df索引：
df['col']				# 某一列
df.iloc[row, col]		# 同样可以用切片方法（只能用索引）
df.loc[['row1','row2']]	# 如果设置了rowname，可以用loc调用
df.loc[(df[col] > 1) & (condition 2)]		# 通过loc可以筛选
df.filter(regex = "e$")	# 可以用正则表达式，只是在查找列名

# 当需要添加一个新行的时候，无法使用iloc
# 查找一些值：
df.loc[..., ...]		# ,前匹配行 ,后匹配列 ...代表体哦条件

# datetime
pd.to_datetime()		# 转换为datetime对象

# NaN
df.interpolate(method = 'linear')	# 通过某个方法填充nan值, linear代表均值
df.isnull()				# 检查空值
df.ffill()				# forward fill
df.bfill()				# backward fill

# Transforming
df.sort_values(col)		# 排序
df.apply()				# 实现一个方法

df1.append(df2)			# 纵向叠加
df1.join(df2, on=col1, how='inner')	# 横向叠加 类似sql的inner join

# groupby
df.groupby(col)			# 返回pandas的groupby对象
students.groupby('Gender')['Score'].agg(['max','min','mean']) # 通过这种方式调用多个聚合函数
.value_count()			# 计数

pd.crosstab(index, columns)	# 默认是计数

# pivot_table
passengers.pivot_table(values = 'alive_bool',
                       index = 'class',
                       columns = 'who',
                       aggfunc='mean')

#File IO
from io import StringIO
import requests
pd.read_html(StringIO(requests.get(url).text))	# 读取网页的表格

topuniversity.drop(0, axis = 0, inplace = True)	# inplace = True，直接更新，否则返回copy
str.extract(r',\s(.+)')							# (捕获的内容)

datetime.dt.year
datetime.dt.month								# 先.dt

df.set_index('colname', inplace = True)			# 重设index

# datetime index
.loc[]					# 非常灵活，可以部分查找（如查找某年）
.at_time()				# 只考虑index的time部分（不考虑date部分）
.between_time(x, y)		# 类似at_time,time介于x,y之间，灵活程度较差
.resample(rule)			# rule='W'按

```



##### web scraping

```python
# requests
import requests
url = '...'
headers = {}			https://www.useragentstring.com/pages/Browserlist/
resp = requests.get(url, headers = headers)

resp.status_code
resp.text

# BeautifulSoup
from bs4 import BeautifulSoup
soup = BeautifulSoup(resp.text, 'html.parser')

soup.find_all('a', attrs = {}, limit = )
soup.text

```

网页与python requests.get的源码可能不完全一样 -- 如空格翻译成.

```python
# css selectors
soup.select('')		# 调用
.class	# 选某个class的元素
#id		# 选id
*		# 所有元素
element	# 选某个元素，如p
element1, element2	# 选两个元素，如div和p
element1 element2	# 选元素1内的元素2
element1>element2	# 选所有元素1为父类的元素2
element1+element2	# 选紧接着元素1的元素2
element1~element2	# 选元素1之后的元素2

ele:nth-child(n)	# 选所有ele的元素，如果他们是第n个子类
ele:nth-last-child(n)	# 倒数n个
ele:nth-of-type(n)		# 第n个ele元素的ele子类
ele:nth-last-of-type(n)	# 

# Xpath
# 调用
dom = etree.HTML(str(soup))
dom.xpath('')
# 查找格式
store
/store
store/store
//store
...[1]		# 第一个

# 使用Xpath，必须查找到具体要取出的元素
dom_t.xpath('//h1/span')[0].text

```

```python
# selenium
# 导入
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
driver = webdriver.Chrome(service = Service('chromedriver.exe'))

send_keys()

```

常见的input类型

![{5271CD8E-E91F-49F0-9680-86389BA14162}](C:\Users\15635\OneDrive\图片\typora\{5271CD8E-E91F-49F0-9680-86389BA14162}.png)
