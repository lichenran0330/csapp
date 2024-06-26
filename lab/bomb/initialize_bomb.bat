rax:通常用于存储函数调用返回值
rsp:栈顶指针,指向栈的顶部
rdi:第一个入参
rsi:第二个入参
rdx:第三个入参
rcx:第四个入参
r8:第五个入参
r9:第六个入参
rbx:数据存储,遵循Callee Save原则
rbp:数据存储,遵循Callee Save原则
r12~r15:数据存储,遵循Callee Save原则
r10~r11:数据存储,遵循Caller Save原则   
   
   0x00000000004013a2 <+0>:     sub    $0x8,%rsp
   0x00000000004013a6 <+4>:     mov    $0x4012a0,%esi
   0x00000000004013ab <+9>:     mov    $0x2,%edi
   0x00000000004013b0 <+14>:    call   0x400b90 <signal@plt>
   0x00000000004013b5 <+19>:    add    $0x8,%rsp
   0x00000000004013b9 <+23>:    ret

   0x0000000000400b90 <+0>:     jmp    *0x2024c2(%rip)        # 0x603058 <signal@got.plt>
   0x0000000000400b96 <+6>:     push   $0xb
   0x0000000000400b9b <+11>:    jmp    0x400ad0

   0x0000000000603058 <+0>:     xchg   %eax,%esi
   0x0000000000603059 <+1>:     or     0x0(%rax),%eax
   0x000000000060305c <+4>:     add    %al,(%rax)
   0x000000000060305e <+6>:     add    %al,(%rax)