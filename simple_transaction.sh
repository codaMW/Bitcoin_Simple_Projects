#Send a simple transaction
#Use sendtoaddress to send 0.1 BTC to bcrt1qrkzxvtcc3w7yyayd3md4tj7j7lheyve4qphd4e in regtest mode
#Verify the transaction in the mempool


#setting up the address variable

addr_recepient="bcrt1qrkzxvtcc3w7yyayd3md4tj7j7lheyve4qphd4e"

#creating a wallet

bitcoin-cli -regtest createwallet "Bitpractice"

#generating an address

addr_sender=$(bitcoin-cli -regtest -rpcwallet=Bitpractice getnewaddress)

#adding funds to address

bitcoin-cli -regtest -rpcwallet=Bitpractice generatetoaddress 505 $addr_sender | jq '.' >> mine.txt

#check available balance
bitcoin-cli -regtest -rpcwallet=Bitpractice getbalance

#sending to address and allowing RBF BIP 125
txid=$(bitcoin-cli -regtest -rpcwallet=Bitpractice sendtoaddress $addr_recepient 0.1 "simple transaction" "practice makes perfect" true true)

#Verifying that the transaction is in the mempool
bitcoin-cli -regtest -rpcwallet=Bitpractice getmempoolentry $txid | jq '.'




