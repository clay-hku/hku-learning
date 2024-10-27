##### map

`map(func, *iterables)`

可以对数据容器中的内容进行操作（可以使用lambda）。

##### filter

`filter(func, *iterables)`

返回iterable中func为TRUE的结果。

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

