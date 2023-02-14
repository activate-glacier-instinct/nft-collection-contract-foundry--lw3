-include .env

# .PHONY: all test clean deploy-anvil

all: clean update build

# Clean the repo
clean  :; forge clean

# Update Dependencies
update:; forge update

build:; forge build

run-test :; forge test 

run-test--cov :; forge coverage > coverage.txt

snapshot :; forge snapshot
