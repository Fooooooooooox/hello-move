
<a name="0x1_my_module"></a>

# Module `0x1::my_module`



-  [Resource `MyCoin`](#0x1_my_module_MyCoin)
-  [Function `make_sure_non_zero_coin`](#0x1_my_module_make_sure_non_zero_coin)
-  [Function `has_coin`](#0x1_my_module_has_coin)


<pre><code></code></pre>



<a name="0x1_my_module_MyCoin"></a>

## Resource `MyCoin`



<pre><code><b>struct</b> <a href="my_module.md#0x1_my_module_MyCoin">MyCoin</a> <b>has</b> key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>value: u64</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x1_my_module_make_sure_non_zero_coin"></a>

## Function `make_sure_non_zero_coin`



<pre><code><b>public</b> <b>fun</b> <a href="my_module.md#0x1_my_module_make_sure_non_zero_coin">make_sure_non_zero_coin</a>(coin: <a href="my_module.md#0x1_my_module_MyCoin">my_module::MyCoin</a>): <a href="my_module.md#0x1_my_module_MyCoin">my_module::MyCoin</a>
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="my_module.md#0x1_my_module_make_sure_non_zero_coin">make_sure_non_zero_coin</a>(coin: <a href="my_module.md#0x1_my_module_MyCoin">MyCoin</a>): <a href="my_module.md#0x1_my_module_MyCoin">MyCoin</a> {
    <b>assert</b>!(coin.value &gt; 0, 0);
    coin
}
</code></pre>



</details>

<a name="0x1_my_module_has_coin"></a>

## Function `has_coin`



<pre><code><b>public</b> <b>fun</b> <a href="my_module.md#0x1_my_module_has_coin">has_coin</a>(addr: <b>address</b>): bool
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="my_module.md#0x1_my_module_has_coin">has_coin</a>(addr: <b>address</b>): bool {
    <b>exists</b>&lt;<a href="my_module.md#0x1_my_module_MyCoin">MyCoin</a>&gt;(addr)
}
</code></pre>



</details>
