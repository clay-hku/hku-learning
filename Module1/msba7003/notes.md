# MSBA7003

贝叶斯公式：描述两个条件概率之间的关系
$$
P(AB)=P(A)*P(B|A)=P(B)*P(A|B)
$$
全概率定理：
$$
P(B) = P(B|A)*P(A)+P(B|\bar A)*P(\bar A)
$$
**update belief**

bayesian inference **贝叶斯推理**

某个事物可能存在K种状态，称之为替代假设。

替代假设互相独立，概率和为1。



观测X的值后，根据bayes' rule改变目前的belief

dF(x)/dx = f(x)	(概率密度函数，F(x)是分布函数)

##### naive bayes

当变量较多的时候，假设各个变量在条件下（Y=1 ...），是相互独立的。

> 已知结果的条件下，各个变量相互独立。不已知结果的情况下，变量可以不互相独立。

$$
\Pr\{Y=a|X_1=b,X_2=c\}=\frac{\Pr\{X_1=b,X_2=c|Y=a\}\times\Pr\{Y=a\}}{\Pr\{X_1=b,X_2=c\}}=\frac{\Pr\{X_1=b|Y=a\}\times\Pr\{X_2=c|Y=a\}\times\Pr\{Y=a\}}{\Pr\{X_1=b,X_2=c\}}.
$$

excel

norm.dist(x,mean,st.dev,1)

1表示累积概率，0表示概率密度

数据-模拟分析-模拟运算表
$$
P(A|X_1 ,X_2) = \frac {P(X_1|A)*P(X_2|A)*P(A)}{P(X_1,X_2)}
$$
求和某概率
$$
P(A) = \sum P(A|X_1,X_2)*P(X_1)*P(X_2)
$$
EVPI(expected value of perfect information) -- perfect information的价值
$$
EVPI=EVwPI - Best EMV
$$


##### 蒙特卡罗模拟

$$
\frac{1}{N}\sum V(X_i,D)
$$

D是你的决策，X是其他的影响因素，确定某个D，不断模拟得到V的结果，通过平均值来估算该决策的价值。
