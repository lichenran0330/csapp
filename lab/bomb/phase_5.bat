   0x0000000000401062 <+0>:     push   %rbx
   0x0000000000401063 <+1>:     sub    $0x20,%rsp
   0x0000000000401067 <+5>:     mov    %rdi=a1,%rbx 
   0x000000000040106a <+8>:     mov    %fs:0x28,%rax  //金丝雀
   0x0000000000401073 <+17>:    mov    %rax,0x18(%rsp) 
   0x0000000000401078 <+22>:    xor    %eax,%eax 
   0x000000000040107a <+24>:    call   0x40131b <string_length>
   0x000000000040107f <+29>:    cmp    $0x6,%eax
   0x0000000000401082 <+32>:    je     0x4010d2 <phase_5+112>
@REM    0x0000000000401084 <+34>:    call   0x40143a <explode_bomb>
   0x0000000000401089 <+39>:    jmp    0x4010d2 <phase_5+112>
   0x000000000040108b <+41>:    movzbl (%rbx,%rax,1),%ecx cx = *(a1 + ax);
   0x000000000040108f <+45>:    mov    %cl,(%rsp)   *rsp = cx;
   0x0000000000401092 <+48>:    mov    (%rsp),%rdx  dx = *rsp;
   0x0000000000401096 <+52>:    and    $0xf,%edx 
   0x0000000000401099 <+55>:    movzbl 0x4024b0(%rdx),%edx dx = *(dx + 0x4024b0);
   0x00000000004010a0 <+62>:    mov    %dl,0x10(%rsp,%rax,1) *(rsp+ax+0x10)=dx;
   0x00000000004010a4 <+66>:    add    $0x1,%rax    ax ++;
   0x00000000004010a8 <+70>:    cmp    $0x6,%rax    ax != 6  ->  continue;
   0x00000000004010ac <+74>:    jne    0x40108b <phase_5+41>
   0x00000000004010ae <+76>:    movb   $0x0,0x16(%rsp) *(rsp + 0x16) = 0;
   0x00000000004010b3 <+81>:    mov    $0x40245e,%esi=a2  si = 0x40245e; "flyers"
   0x00000000004010b8 <+86>:    lea    0x10(%rsp),%rdi=a1  di = rsp +0x10;
   0x00000000004010bd <+91>:    call   0x401338 <strings_not_equal>
   0x00000000004010c2 <+96>:    test   %eax,%eax
   0x00000000004010c4 <+98>:    je     0x4010d9 <phase_5+119>
@REM    0x00000000004010c6 <+100>:   call   0x40143a <explode_bomb>
   0x00000000004010cb <+105>:   nopl   0x0(%rax,%rax,1)
   0x00000000004010d0 <+110>:   jmp    0x4010d9 <phase_5+119>

   0x00000000004010d2 <+112>:   mov    $0x0,%eax 
   0x00000000004010d7 <+117>:   jmp    0x40108b <phase_5+41>
   0x00000000004010d9 <+119>:   mov    0x18(%rsp),%rax ax = *(rsp + 0x18);
   0x00000000004010de <+124>:   xor    %fs:0x28,%rax    ax |= *(fs:0x28);
   0x00000000004010e7 <+133>:   je     0x4010ee <phase_5+140>
   0x00000000004010e9 <+135>:   call   0x400b30 <__stack_chk_fail@plt>
   0x00000000004010ee <+140>:   add    $0x20,%rsp
   0x00000000004010f2 <+144>:   pop    %rbx
   0x00000000004010f3 <+145>:   ret

   maduiersnfotvbylSo you think you can stop the bomb with ctrl-c, do you?
   01234567890123456789012345678901234567890123456789012345678901234567890
0x4024f8:       "Curses, you've found the secret phase!"
   9 59 67 44 58 37