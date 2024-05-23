   @REM 0x00000000004015c4 <+0>:     sub    $0x78,%rsp
   @REM 0x00000000004015c8 <+4>:     mov    %fs:0x28,%rax
   @REM 0x00000000004015d1 <+13>:    mov    %rax,0x68(%rsp)
   @REM 0x00000000004015d6 <+18>:    xor    %eax,%eax
   @REM 0x4015d8 <+20>:    cmpl   $0x6,0x202181(%rip)        # 0x603760 <num_input_strings>
   @REM 0x4015df <+27>:    jne    0x40163f <phase_defused+123> 
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
   0x4015e1 <+29>:    lea    0x10(%rsp),%r8 r8 = sp + 16
   0x4015e6 <+34>:    lea    0xc(%rsp),%rcx  cx = sp +12
   0x4015eb <+39>:    lea    0x8(%rsp),%rdx  dx = sp + 8
   0x4015f0 <+44>:    mov    $0x402619,%esi si = 0x402619 %d %d %s
   0x4015f5 <+49>:    mov    $0x603870,%edi  di = 0x603870  写入char* 0x603870
   0x4015fa <+54>:    call   0x400bf0 <__isoc99_sscanf@plt>
   0x4015ff <+59>:    cmp    $0x3,%eax ax ==3
   0x401602 <+62>:    jne    0x401635 <phase_defused+113>
   0x401604 <+64>:    mov    $0x402622,%esi si = 0x402622   ->"DrEvil"
   0x401609 <+69>:    lea    0x10(%rsp),%rdi di = sp + 16   ->第三个参数
   0x40160e <+74>:    call   0x401338 <strings_not_equal>
   0x401613 <+79>:    test   %eax,%eax
   0x401615 <+81>:    jne    0x401635 <phase_defused+113>
   0x401617 <+83>:    mov    $0x4024f8,%edi di = 0x4024f8
   0x40161c <+88>:    call   0x400b10 <puts@plt>
   0x401621 <+93>:    mov    $0x402520,%edi
   0x401626 <+98>:    call   0x400b10 <puts@plt>
   0x40162b <+103>:   mov    $0x0,%eax
   0x401630 <+108>:   call   0x401242 <secret_phase>
   {
      0x401635 <+113>:   mov    $0x402558,%edi
      0x40163a <+118>:   call   0x400b10 <puts@plt>
   }
   @REM 0x40163f <+123>:   mov    0x68(%rsp),%rax
   @REM 0x401644 <+128>:   xor    %fs:0x28,%rax
   @REM 0x40164d <+137>:   je     0x401654 <phase_defused+144>
   @REM 0x40164f <+139>:   call   0x400b30 <__stack_chk_fail@plt>
   @REM 0x401654 <+144>:   add    $0x78,%rsp
   @REM 0x401658 <+148>:   ret


   @REM 0x401242 <+0>:     push   %rbx 
   0x401243 <+1>:     call   0x40149e <read_line> 
   0x401248 <+6>:     mov    $0xa,%edx dx = 10
   0x40124d <+11>:    mov    $0x0,%esi si = 0
   0x401252 <+16>:    mov    %rax,%rdi di = ax
   0x401255 <+19>:    call   0x400bd0 <strtol@plt>
   0x40125a <+24>:    mov    %rax,%rbx
   0x40125d <+27>:    lea    -0x1(%rax),%eax
   0x401260 <+30>:    cmp    $0x3e8,%eax
   0x401265 <+35>:    jbe    0x40126c <secret_phase+42>
   @REM 0x401267 <+37>:    call   0x40143a <explode_bomb>
   0x40126c <+42>:    mov    %ebx,%esi
   0x40126e <+44>:    mov    $0x6030f0,%edi
   0x401273 <+49>:    call   0x401204 <fun7>
   0x401278 <+54>:    cmp    $0x2,%eax
   0x40127b <+57>:    je     0x401282 <secret_phase+64>
   @REM 0x40127d <+59>:    call   0x40143a <explode_bomb>
   0x401282 <+64>:    mov    $0x402438,%edi
   0x401287 <+69>:    call   0x400b10 <puts@plt>
   0x40128c <+74>:    call   0x4015c4 <phase_defused>
   @REM 0x401291 <+79>:    pop    %rbx
   @REM 0x401292 <+80>:    ret