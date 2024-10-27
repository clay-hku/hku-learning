import numpy as np
import pandas as pd
from scipy.stats import multinomial
from itertools import product

# Given data
sku_costs = np.array([5, 6, 7, 8, 6, 2, 8, 5, 15, 7])
wtp_means = np.array([6, 7.2, 8.4, 9.6, 7.2, 2.4, 9.6, 6, 18, 8.4])
initial_price = np.array([6, 7.2, 8.4, 9.6, 7.2, 2.4, 9.6, 6, 18, 8.4])
purchases = np.array([2, 16, 7, 3, 10, 4, 6, 19, 11, 12])
possible_std_devs = np.array([0.5, 1, 2])
prior_prob = 1 / len(possible_std_devs)  # Each standard deviation is equally likely

# Number of customers
n_customers = 100
purchases = np.append(purchases, n_customers - purchases.sum())

# Function to compute the value distribution for a specific SKU
def compute_value_distribution_for_sku(sku_index, std):
    mean = wtp_means[sku_index]
    values = np.random.normal(loc=mean, scale=std, size=n_customers) - initial_price[sku_index]
    return values


# Generate all possible standard deviation combinations for all SKUs
std_dev_combinations = list(product(possible_std_devs, repeat=len(sku_costs)))

# Initialize the posterior array
likelihood = np.zeros((len(std_dev_combinations)))

for idx, std_dev_comb in enumerate(std_dev_combinations):

    # Simulate value distributions for all SKUs based on the current std_dev_comb
    values = np.zeros((n_customers, len(sku_costs)))
    for i in range(len(sku_costs)):
        values[:, i] = compute_value_distribution_for_sku(i, std_dev_comb[i])
    # 模拟每个顾客每个商品的价值
    values = pd.DataFrame(values, columns=[f"SKU_{i}" for i in range(1, len(sku_costs) + 1)])

    # 每一行代表一个顾客，每一列代表一个商品，求每一行最大值
    max_values = values.idxmax(axis=1).values