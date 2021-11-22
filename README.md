# Bank tech test

## Project Outline

Language: Ruby

### Setup & Usage

In your terminal, you can run the following commands. If you don't already have Bundler installed, please run: 
``` 
$ gem install bundler 
```
Please clone the repo and access the project folder:
```
$ git clone git@github.com:s-palmer/bank-tech-test.git
```
```
$ cd bank-tech-test
```
Next install any gems required for the project using:
```
$ bundle install
```
You will then be able to launch the application into IRB by running:
```
$ irb -r ./lib/bank-account.rb
```

## Specification

### Creating User Stories From Requirements

```
As a bank account holder,
So that I can interact with my bank account
The program should work using IRB
```
```
As a bank account holder,
So that I can add my money to the account
I want to be able to make a deposit.
```
```
As a bank account holder,
So that I can spend my money
I want to be able to make a withdrawal.
```
```
As a bank account holder,
So that I can see how much money I have
I want to be able to review account statements
```

### Class Model From User Stories

![Class Model](ClassModel.png)

Based on the user stories, I came up with the above initial class / method models to describe how I think my program will look.
From the requirements, I think I will need to create 2 classes, a Bank Account class and a Transaction class. The Bank Account class will be responsible for initialising an empty account and I added just one method for now, which is a print_balance method.

The Transaction class will have 4 methods, and a Transaction History attribute. I expect that I will store a record of Transactions as an array of hashes, given that each transaction should consist of several pieces of information. I have currently given the Transaction class 4 methods - however I may look to extract the print_statement method out into its own Statement class. 

### Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).



## Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2023
* And a deposit of 2000 on 13-01-2023
* And a withdrawal of 500 on 14-01-2023
* When she prints her bank statement
* Then she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```
