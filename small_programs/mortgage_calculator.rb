# capture loan amount
# capture annual percentage rate (APR)
# capture loan duration
# calculate monthly interest rate
# calculate load duration in months

## goal - find the monthly payment amount

# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def prompt(message)
  puts message
end

prompt('Welcome to the Mortgage Calculator')

prompt('What is the loan total?')
loan_amount = gets.chomp.to_i

prompt('What is the annual interest rate')
prompt('(Example 5 for 5% or 2.5 for 2.5%)')
apr = gets.chomp.to_f

prompt('How long is the loan for in years?')
years = gets.chomp

annual_interest = apr.to_f / 100
monthly_interest_rate = annual_interest / 12
montly_loan_duration = years.to_i * 12

month_pay = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-montly_loan_duration)))

prompt(month_pay.round(2))
