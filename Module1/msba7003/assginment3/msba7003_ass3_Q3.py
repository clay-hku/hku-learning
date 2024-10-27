import pulp as pl

problem = pl.LpProblem('mip', pl.LpMaximize)

Qr = pl.LpVariable('Qr', lowBound=0, cat='Continuous')
Qa = pl.LpVariable('Qa', lowBound=0, cat='Continuous')
Qb = pl.LpVariable('Qb', lowBound=0, cat='Continuous')
Xa = pl.LpVariable('Xa', lowBound=0, cat='Continuous')
Xb = pl.LpVariable('Xb', lowBound=0, cat='Continuous')

produce_a = pl.LpVariable('produce_a', lowBound=0, cat='Binary')
produce_b = pl.LpVariable('produce_b', lowBound=0, cat='Binary')
process_a = pl.LpVariable('process_a', lowBound=0, cat='Binary')
process_b = pl.LpVariable('process_b', lowBound=0, cat='Binary')

M = 1e+6

problem += 10*(Qa - Xa) + 12*(Qb - Xb + 0.6*Xa) + 20*(0.3*Xa + 0.8*Xb) - 5*Qr - 3*Xa - 2*Xb - 300 * produce_a - 500 * produce_b - 600 * process_a - 2000 * process_b

problem += Qa - Xa <= 300
problem += Qb - Xb + 0.6*Xa <= 300
problem += 0.3*Xa + 0.8*Xb <= 300
problem += 0.7 * Qa  + 0.9 * Qb <= 0.63 * Qr
problem += Xa <= Qa
problem += Xb <= Qb

problem += Qa <= M * produce_a
problem += Qb <= M * produce_b
problem += Xa <= M * process_a
problem += Xb <= M * process_b


problem.solve()

print(f"Status: {pl.LpStatus[problem.status]}")
print('Solutions:')
for i in problem.variables():
    print(f'\t{i.name} = {i.varValue}')
print(f'OBJECTIVE VALUE: {pl.value(problem.objective)}')