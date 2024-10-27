import numpy as np

# the expected net payoff of option 1
revenue = 50000
cost = 10000
cost_copy = 20000
cost_inspection = 5000
def option1():
    p = 0.5
    q = 1 - p
    payoff = p * (revenue - cost) - q * cost
    return payoff

print(f'question1:{option1():.2f}')

def option2():
    payoff = revenue - cost_copy - cost
    return payoff

print(f'question2:{option2():.2f}')



def option3():
    p_initial = 0.5 # 货没有缺陷的概率
    # 如果检测结果正常
    p_updated_normal = 0.5 / (0.5 + 0.5 * 0.995 ** 100)    # 更新后货没有缺陷的概率
    payoff1 = p_updated_normal * revenue - cost       # 直接交货的收益
    payoff2 = option2()     # 重新复制的收益
    payoff_normal = max(payoff1, payoff2)

    # 如果检测结果异常
    p_updated_defect = 0        # 更新后货没有缺陷的概率
    payoff3 = p_updated_defect * revenue -cost      # 直接交货的收益
    payoff4 = option2()   # 重新复制的收益
    payoff_defect = max(payoff3, payoff4)

    # 计算是否检测出缺陷的概率
    p_no_detected = 0.5 * 1 + 0.5 * 0.995 ** 100   # 没有检测出缺陷的概率
    p_detected = 1 - p_no_detected

    # 计算期望收益
    payoff = p_no_detected * payoff_normal + p_detected * payoff_defect - cost_inspection

    return payoff

print(f'question3:{round(option3(), 2):.2f}')

print(f'qustion4:{round(option3() + cost_inspection - max(option1(), option2()), 2):.2f}')