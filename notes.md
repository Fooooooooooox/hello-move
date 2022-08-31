# installation
i got this error when installing:
```shell
z3 already exists at /usr/local/bin/z3
but this install will go to /Users/foooox/bin//z3.
you may want to remove the shared instance to avoid version confusion
```
it stucks here

i solved this by removing /usr/local/bin/z3

there is a tutorial in move folder and it's nice: /Users/foooox/move/language/documentation/tutorial

# how to run unit test in move?

```shell
# this creates a TestExample folder with sources and move.toml
move new TestExample; cd TestExample
```

I used `move build` at first but it always stuck, so I changed into aptos-cli.
aptos-cli can be found here: 

https://github.com/aptos-labs/aptos-core/releases?q=cli&expanded=true

https://aptos.dev/cli-tools/aptos-cli-tool/install-aptos-cli
```shell
aptos move compile
```

# about move.toml
## manifest
section of manifest: must provide exactly one of 'local' or 'git' or 'aptos' for dependency."

for example:
```shell
local = "../../../../move-stdlib/"
```
the path here is: /Users/foooox/move/language/move-stdlib

## rev
rev here is the commit hash

you can simply use `rev = "main"`

(i don't see the meaning of this para... )

so i just leave it blank
rev=<git commit hash>

# modules & scripts

modules: libraries that define struct types(global storage) and functions(the rules for updating storage)

scripts: calls functions 

# storage in move

```rust
struct GlobalStorage {
    resources: Map<address, Map<ResourceType, ResourceValue>>
    modules: Map<address, Map<ModuleName, ModuleBytecode>>
}
```
和evm不一样，move的module没有自己的storage，evm中的存储可以参考：https://learnblockchain.cn/books/geth/part7/storage.html

A Move module doesn't have its own storage. Instead, Move "global storage" (what we call our blockchain state) is indexed by addresses. Under each address there are Move modules (code) and Move resources (values).
每一个地址下有resource（values）和 modules（code）。

# account & address & signer

`account` is equal to `address` i think.

check here: https://move-language.github.io/move/address.html?highlight=account#address

```rust
let account = @0x1
```

# how to install boogie (prover)

```shell
# run the following in move repo root directory
cd aptos-core/
./scripts/dev_setup.sh -yp
source ~/.profile
```

but when i ran `move prove`, i got this error:
`Error: expected at least version 2.15.7 but found 2.9.6.0 for `boogie``.

so i had to upgrade boogie myself:

```shell
dotnet  tool uninstall boogie -g

```

## generic & phantom type

`generic` and `phantom` have similar functions as `abstract` and `interface` in solidity.

```rust
struct Coin<phantom CoinType> has store {
    value: u64
}

struct Balance<phantom CoinType> has key {
    coin: Coin<CoinType>
}

/// Publish an empty balance resource under `account`'s address. This function must be called before
/// minting or transferring to the account.
public fun publish_balance<CoinType>(account: &signer) {
    let empty_coin = Coin<CoinType> { value: 0 };
    assert!(!exists<Balance<CoinType>>(signer::address_of(account)), EALREADY_HAS_BALANCE);
    move_to(account, Balance<CoinType> { coin: empty_coin });
}
```