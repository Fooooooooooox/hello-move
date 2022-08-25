script {
    // Import the Debug module published at the named account address std.
    // 使用在std account下发布的debug module
    use std::debug;

    const ONE: u64 = 1;

    fun main(x: u64) {
        let sum = x + ONE;
        debug::print(&sum)
    }
}