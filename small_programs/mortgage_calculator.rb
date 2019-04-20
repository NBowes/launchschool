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

def monthly_pay(loan_amount, monthly_rate, montly_loan_duration)
  denominator = 1 - (1 + monthly_rate)**-montly_loan_duration
  loan_amount.to_f * monthly_rate / denominator
end

prompt('Welcome to the Mortgage Calculator')

loan_amount = nil
loop do
  prompt('What is the loan total?')
  loan_amount = gets.chomp.to_i

  break if loan_amount > 0

  prompt('Please input a valid loan amount.')
end

apr = nil
loop do
  prompt('What is the annual interest rate')
  prompt('(Example 5 for 5% or 2.5 for 2.5%)')
  apr = gets.chomp.to_f
  break if apr.to_i > 0

  prompt('Please input a valid interest rate.')
end

years = nil
loop do
  prompt('How long is the loan for in years?')
  years = gets.chomp
  break unless years.empty? || years.to_i < 0

  prompt('Please enter a valid number of years.')
end

annual_rate = apr.to_f / 100
monthly_rate = annual_rate / 12
montly_loan_duration = years.to_i * 12

month_pay = monthly_pay(loan_amount, monthly_rate, montly_loan_duration)

prompt("Your monthly payment is $#{month_pay.round(2)}")
