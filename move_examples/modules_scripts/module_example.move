// 0x42 here specifies that the module Test will be published under the account address 0x42 in global storage.
// Modules can also be declared using named addresses. For example:
// module test_addr::test {
// }

module 0x42::Test {
    struct Example has copy, drop { i: u64 }

    // use import types from other modules
    // what's the difference between use and friend???
    use std::debug;
    friend 0x42::AnotherTest;
    // friend specify a list of trusted modules

    const ONE: u64 = 1;

    public fun print(x: u64) {
        let sum = x + ONE;
        let example = Example { i: sum };
        debug::print(&sum)
    }
}
