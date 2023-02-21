-include .env

# .PHONY: all test clean deploy-anvil

all: clean update build

# Clean the repo
clean  :; forge clean

# Update Dependencies
update:; forge update

build:; forge build

run-test :; forge test 

run-test--v :; forge test -vvvv

run-test--cov :; forge coverage > coverage.txt

snapshot :; forge snapshot

deploy--local  :; forge script script/CryptoDevs.s.sol:CryptoDevsScript --fork-url http://localhost:8545 \ --private-key $PRIVATE_KEY --broadcast

call--local :; cast call $CONTRACT_ADDRESS "maxTokenIds()"

deploy--goerli :; source ./.env && forge script script/CryptoDevs.s.sol:CryptoDevsScript --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv