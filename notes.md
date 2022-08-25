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


