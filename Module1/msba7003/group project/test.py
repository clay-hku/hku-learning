import numpy as np
from scipy.stats import multinomial
from itertools import product
import pandas as pd

# Given data
sku_costs = np.array([5, 6, 7, 8, 6, 2, 8, 5, 15, 7])
wtp_means = np.array([6, 7.2, 8.4, 9.6, 7.2, 2.4, 9.6, 6, 18, 8.4])
initial_price = np.array([6, 7.2, 8.4, 9.6, 7.2, 2.4, 9.6, 6, 18, 8.4])
purchases = np.array([2, 16, 7, 3, 10, 4, 6, 19, 11, 12])
possible_std_devs = np.array([0.2, 0.5, 0.8, 1, 1.5])
prior_prob = 1 / len(possible_std_devs)  # Each standard deviation is equally likely

# Number of customers
n_customers = 100

# Function to compute the value distribution for a specific SKU
def compute_value_distribution_for_sku(sku_index, std_dev):
    mean = wtp_means[sku_index]
    # cost = sku_costs[sku_index]
    values = np.random.normal(loc=mean, scale=std_dev, size=n_customers) - initial_price[sku_index]
    return values

# Function to compute the posterior probabilities

# Generate all possible standard deviation combinations for all SKUs

std_dev_combinations = list(product(possible_std_devs, repeat=len(sku_costs)))
print(len(std_dev_combinations))

posterior_probs = np.zeros(len(std_dev_combinations))

for idx, std_dev_comb in enumerate(std_dev_combinations):
    # Simulate value distributions for all SKUs based on the current std_dev_comb
    values = np.zeros((n_customers, len(sku_costs)))
    for i in range(len(sku_costs)):
        values[:, i] = compute_value_distribution_for_sku(i, std_dev_comb[i])

    print(pd.DataFrame(values))
    chosen_skus = np.argmax(values, axis=1)
    print(chosen_skus)
    simulated_purchases = np.array([np.sum(chosen_skus == i) for i in range(len(sku_costs))])
    print(simulated_purchases)

    simulated_purchases_prob = simulated_purchases / n_customers
    print(simulated_purchases_prob)

    # Compute the log-likelihood using multinomial distribution
    log_likelihood = multinomial.logpmf([simulated_purchases, n_customers - simulated_purchases], n_customers,
                                        [simulated_purchases_prob, 1 - simulated_purchases_prob])

    print(log_likelihood )
    # posterior_probs[idx] = np.exp(log_likelihood) * prior_prob
    print(posterior_probs)

    if idx == 0:
        break