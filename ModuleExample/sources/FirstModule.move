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

    // Declare a unit test. It takes a signer called `account` with an
    // address value of `0xC0FFEE`.
    #[test(account = @0xC0FFEE)]
    fun test_mint_10(account: signer) acquires Coin {
        let addr = 0x1::signer::address_of(&account);
        mint(account, 10);
        // Make sure there is a `Coin` resource under `addr` with a value of `10`.
        // We can access this resource and its value since we are in the
        // same module that defined the `Coin` resource.
        // coin is a resource!!!
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }
}
