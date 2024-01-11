## SELF-DESTRUCT

**selfdestruct is a special solidity operation used to delete a contract. It can also be used to force send ether to a contract as was the case with the `EtherGame` contract in `src` folder.**

It's important to avoid the use of `address.this` in functions that are not pure/view as it often creates room for this problem.

## TESTING

To test this contract simple run the following command:

1. Clone the Repo

```shell
git clone https://github.com/Chinwuba22/selfdestruct.git
```

2. Read and understand the contracts in `src` folder

3. Compile all file

```shell
forge build
```

or

```shell
forge compile
```

4. Read and understand the contracts in `test` folder

5. Run Test

```shell
forge test
```
