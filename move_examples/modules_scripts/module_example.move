module 0x42::Test {
    struct Example has copy, drop { i: u64 }

    use std::debug;
    friend 0x42::AnotherTest;

    const ONE: u64 = 1;

    public fun print(x: u64) {
        let sum = x + ONE;
        let example = Example { i: sum };
        debug::print(&sum)
    }
}
