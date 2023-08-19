# pwntools

##### context
```python
from pwn import *

context(arch='i386', os='linux')
or
context(arch='amd64', os='linux')
context.log_level = 'DEBUG'
```

##### elf and libc
```python
elf = context.binary = ELF('./binary')
libc = elf.libc
conn = process()
```

##### save libc_base_addr and use
```python
# save libc_base_addr
libc.address = puts_leak - libc.sym['puts']
# how to use about libc_base_addr
libc.sym['system']
next(libc.search(b'/bin/sh\x00'))
```


##### save libc_base_addr and use
```python
system_offset = libc.sym["system"]
system_addr = libc_base + system_offset
system_addr = libc_base + system_offset
```
