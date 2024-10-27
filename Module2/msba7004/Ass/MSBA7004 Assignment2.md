##### 1.

(a) the patient.

##### 2.

(a) the throughput rate is 150 patients / week.
$$
throughput\;rate=(30 patients / day * 5 days / week)=150patients/week
$$
(b) capacity rate: 90 beds / 3 days. throughputrate: 150 patients / 7days. (on average)

Thus, the average utilization is 71.43%.
$$
\frac{throuput\;rate}{capacity\;rate}=(\frac{\frac{150 patients}{7days}}{\frac{90beds}{3days}} )=71.43\%
$$


(c)

| Time                 | patient number               |
| -------------------- | ---------------------------- |
| Sunday:              | 30 patients                  |
| Monday:              | 60 patients                  |
| Tuesday to Thursday: | 90 patients (peak occupancy) |
| Friday:              | 60 patients                  |
| Saturday:            | 30 patients                  |

![msba7004 ass2](C:\Users\15635\OneDrive\图片\typora\msba7004 ass2-1730009442875-3.png)

##### **3.**

**(a)** 
$$
New\;throughput rate=150patients/week* (1+0.20) =150*1.20=180patients/week.
$$
If Shouldice hospital admits 30 patients for Saturday operations. The beds are not beyond limitation. So, the new throughput rate is 180patients/7days, while the capacity rate of beds will not change. As a result, the average utilization will be 85.71%
$$
Average\;utilization=(\frac{\frac{180 patients}{7days}}{\frac{90beds}{3days}} )=85.71\%
$$

##### **4.**

(a) 
$$
Surgeon\;capacity=12\;surgeons×4\;operations \;per \;surgeon/day=48\;operations/day.
$$

$$
Operating \;room\; capacity=5operating\;rooms×8hours\; per\;room/day=40operations/ day.
$$

Thus, the bottleneck for Operation is Operating room. We could admit 40 patients a day condition on relaxing assumption (b). The bed capacity is 30 beds/ day and there is buffer.

Operations with 90 beds(maximum 40 patients/day)

|                   | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
| ----------------- | ------ | ------- | --------- | -------- | ------ | -------- | ------ |
| **Monday**        | 40     | 40      | 40        |          |        |          |        |
| **Tuesday**       |        | 40      | 40        | 40       |        |          |        |
| **Wednesday**     |        |         | 10        | 10       | 10     |          |        |
| **Thursday**      |        |         |           | 40       | 40     | 40       |        |
| **Friday**        |        |         |           |          | 40     | 40       | 40     |
| **Saturday**      |        |         |           |          |        |          |        |
| **Sunday**        |        |         |           |          |        |          |        |
| **Beds occupied** | 40     | 80      | 90        | 90       | 90     | 80       | 40     |

According to the table above, we could admit 170 patients / week due to the bed limits. In conclusion, the maximum throughput rate is 170 patients / week if only assumption (b) is relaxed.

(b) 

Now, the total number of beds is 135. So the Bed Capacity increases.
$$
Bed \;capacity = \frac{135beds}{3days}=45patients/day
$$
Thus, the bed capacity is no longer the bottleneck resource, which turn out to be Operating room capacity. 

In conclusion, the maximum throughput rate is 200 patients/week, which is limited by Operating room capacity.

(c)

To increase throughput by 20% (i.e., from 150 to 180 patients per week) while maintaining the 5-day operation schedule, we could consider the following strategies(we must relax assumption(b), otherwise the maximum throughput rate would be 150patients/week no matter what we change):

- Extend operating hours:(relax assumption(b) and (d) )

  - Any adjustment on surgeon(assumption (c)) is futile, due to the limitation of operating room capacity.

  - The capacity of operating rooms will increase 5 patients/day if we extend one operating hour per day.

  - $$
    Operating \; room\;capacity =5operating\;rooms×9hours\; per\;room/day=45operations/ day.
    $$

  - |               | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
    | ------------- | ------ | ------- | --------- | -------- | ------ | -------- | ------ |
    | **Monday**    | 45     | 45      | 45        |          |        |          |        |
    | **Tuesday**   |        | 45      | 45        | 45       |        |          |        |
    | **Wednesday** |        |         | 0         | 0        | 0      |          |        |
    | **Thursday**  |        |         |           | 45       | 45     | 45       |        |
    | **Friday**    |        |         |           |          | 45     | 45       | 45     |
    | **Saturday**  |        |         |           |          |        |          |        |
    | **Sunday**    |        |         |           |          |        |          |        |
    | total         | 45     | 90      | 90        | 90       | 90     | 90       | 45     |

  - The throughput rate would be 180 patients / day. (Satisfied the goal of increasement)

- Building new operating rooms:(relax assumption(b) and (d))

  - Only 1 room is enough to reach the current goal. The operating room capacity would be 48 operations/day, equaling to the capacity of surgeon. However, it is not a good idea, for healthcare resources are expensive and new operating room strategy is even more costly.

- Add 10 more beds:(relax assumption(b) and (e))

  - We know that the current bottleneck is number of beds, so adding beds is good idea to increase throughput rate. Only 10 beds is enough to reach the 20% goal.

  - |                   | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
    | ----------------- | ------ | ------- | --------- | -------- | ------ | -------- | ------ |
    | **Monday**        | 40     | 40      | 40        |          |        |          |        |
    | **Tuesday**       |        | 40      | 40        | 40       |        |          |        |
    | **Wednesday**     |        |         | 20        | 20       | 20     |          |        |
    | **Thursday**      |        |         |           | 40       | 40     | 40       |        |
    | **Friday**        |        |         |           |          | 40     | 40       | 40     |
    | **Saturday**      |        |         |           |          |        |          |        |
    | **Sunday**        |        |         |           |          |        |          |        |
    | **Beds occupied** | 40     | 80      | 100       | 100      | 90     | 80       | 40     |

  - Now, the bed capacity turn out to be 180 patients/ week. And the throughput rate would be 180 patients/week.

In conclusion, extending operating hours could be the best solution, due to its limited cost. However, it is possible for surgeons unions deny the plan, due to the increasement of their workload. In that case, adding 10 more beds could be the best idea. It is reasonable that 10 beds would not cost too much, especially compared to the expensive healthcare machine or operating rooms.

