credit = read.csv('credit_data.csv')
credit$age = ifelse(credit$age < 0, 40.92, credit$age)

census = read.csv('census.csv')

# income x age
plot(credit$income, credit$age)

# income x loan
plot(credit$income, credit$loan)

# age x loan
plot(credit$age, credit$loan)

# age x final weight
plot(census$age, census$final.weight)