// 0xCAFE here is the address that the module is published under
module 0xCAFE::BasicCoin {

    // Structures in Move can be given different abilities that describe what can be done with that type.
    // abilities: copy, drop, store, key
    // key: Allows the type to serve as a key for global storage operations. 
    struct Coin has key {
        value: u64,
    }

    // Functions are default private, and can also be public, public(friend), or public(script). 
    public fun mint(account: signer, value: u64) {
        // move_to is one of the five different global storage operators.
        // move_to(&signer,T)Publish T under signer.address
        // check here: https://move-language.github.io/move/global-storage-operators.html
        move_to(&account, Coin { value })
    }
}
