   @REM 0x4010f4 <+0>:    push   %r14
   @REM 0x4010f6 <+2>:    push   %r13
   @REM 0x4010f8 <+4>:    push   %r12
   @REM 0x4010fa <+6>:    push   %rbp
   @REM 0x4010fb <+7>:    push   %rbx
   @REM 0x4010fc <+8>:    sub    $0x50,%rsp

   0x401100 <+12>:   mov    %rsp,%r13  //r13 rsp
   0x401103 <+15>:   mov    %rsp,%rsi
   0x401106 <+18>:   call   0x40145c <read_six_numbers> di si rsp rsp+4  rsp+8 rsp+12 rsp+16 rsp+20
                           ///////////这个是存栈里面的。。。。可恶
   0x40110b <+23>:   mov    %rsp,%r14  //r14 rsp
   0x40110e <+26>:   mov    $0x0,%r12d
      { r13 
         0x401114 <+32>:   mov    %r13,%rbp  bp = r13;
         0x401117 <+35>:   mov    0x0(%r13),%eax   ax = *r13;
         0x40111b <+39>:   sub    $0x1,%eax  
         0x40111e <+42>:   cmp    $0x5,%eax        ax <= 6;
         0x401121 <+45>:   jbe    0x401128 <phase_6+52>
         @REM 0x401123 <+47>:   call   0x40143a <explode_bomb>
         0x401128 <+52>:   add    $0x1,%r12d r12d ++;
         0x40112c <+56>:   cmp    $0x6,%r12d r12d == 6;
         0x401130 <+60>:   je     0x401153 <phase_6+95>   out:
         0x401132 <+62>:   mov    %r12d,%ebx bx = r12d; 1-2-3-4-5
            {  bx = 1-2-3-4-5
               0x401135 <+65>:   movslq %ebx,%rax ax = bx;
               0x401138 <+68>:   mov    (%rsp,%rax,4),%eax  ax = *(sp + ax*4);
               0x40113b <+71>:   cmp    %eax,0x0(%rbp)   *bp != ax;
               0x40113e <+74>:   jne    0x401145 <phase_6+81>
               @REM 0x401140 <+76>:   call   0x40143a <explode_bomb>
               0x401145 <+81>:   add    $0x1,%ebx 
               0x401148 <+84>:   cmp    $0x5,%ebx bx <= 6;
               0x40114b <+87>:   jle    0x401135 <phase_6+65>
            }
         0x40114d <+89>:   add    $0x4,%r13 r13+=4;
         0x401151 <+93>:   jmp    0x401114 <phase_6+32>
      }--> numbers<=6 and 各不相同
      -> r12d = 6 r13=20
   0x401153 <+95>:   lea    0x18(%rsp),%rsi si = rsp + 24
   0x401158 <+100>:  mov    %r14,%rax  ax = r14;
   0x40115b <+103>:  mov    $0x7,%ecx cx = 7;
      {
         0x401160 <+108>:  mov    %ecx,%edx dx = 7
         0x401162 <+110>:  sub    (%rax),%edx dx -= * ax;
         0x401164 <+112>:  mov    %edx,(%rax) *ax = dx;
         0x401166 <+114>:  add    $0x4,%rax  ax += 4;
         0x40116a <+118>:  cmp    %rsi,%rax  ax != si;
         0x40116d <+121>:  jne    0x401160 <phase_6+108>
      } -> numbers = 7 - numbers; 
   0x40116f <+123>:  mov    $0x0,%esi si = 0
   0x401174 <+128>:  jmp    0x401197 <phase_6+163>
      
   {
      0x401176 <+130>:  mov    0x8(%rdx),%rdx dx = *(dx + 8);
      0x40117a <+134>:  add    $0x1,%eax ax ++;
      0x40117d <+137>:  cmp    %ecx,%eax ax != cx;
      0x40117f <+139>:  jne    0x401176 <phase_6+130>
      0x401181 <+141>:  jmp    0x401188 <phase_6+148>
         {
            0x401183 <+143>:  mov    $0x6032d0,%edx dx = 0x6032d0
            0x401188 <+148>:  mov    %rdx,0x20(%rsp,%rsi,2) *(sp + 2*si + 32) = dx;  
                                                               //sp+32 sp+40 sp +48 ...... sp + 72
            0x40118d <+153>:  add    $0x4,%rsi  si +=4;
            0x401191 <+157>:  cmp    $0x18,%rsi si == 24;
            0x401195 <+161>:  je     0x4011ab <phase_6+183>  out:
         in:0x401197 <+163>:  mov    (%rsp,%rsi,1),%ecx cx = *(sp + si);
            0x40119a <+166>:  cmp    $0x1,%ecx cx <= 1;
            0x40119d <+169>:  jle    0x401183 <phase_6+143>
         }
      0x40119f <+171>:  mov    $0x1,%eax ax = 1;
      0x4011a4 <+176>:  mov    $0x6032d0,%edx dx = 0x6032d0;
      0x4011a9 <+181>:  jmp    0x401176 <phase_6+130>
   }
   -> dx = 0,除了6元素,其他均为0,六元素为0x6032d0;
   @REM 6-> 1  0x6032d0 332   
   @REM 5-> 2  0x6032e0 168   
   @REM 4-> 3  0x6032f0 924
   @REM 3-> 4  0x603300 691   
   @REM 2-> 5  0x603310 477
   @REM 1-> 6  0x603320 443
   0x4011ab <+183>:  mov    0x20(%rsp),%rbx  bx = *(sp + 32)
   0x4011b0 <+188>:  lea    0x28(%rsp),%rax  ax = sp + 40
   0x4011b5 <+193>:  lea    0x50(%rsp),%rsi  si = sp + 80
   0x4011ba <+198>:  mov    %rbx,%rcx        cx = bx;
      {
         0x4011bd <+201>:  mov    (%rax),%rdx dx = *ax;
         0x4011c0 <+204>:  mov    %rdx,0x8(%rcx) *(cx + 8) = dx;
         0x4011c4 <+208>:  add    $0x8,%rax  ax += 8;
         0x4011c8 <+212>:  cmp    %rsi,%rax ax == si;
         0x4011cb <+215>:  je     0x4011d2 <phase_6+222> out:
         0x4011cd <+217>:  mov    %rdx,%rcx    cx = *ax
         0x4011d0 <+220>:  jmp    0x4011bd <phase_6+201>
      }
   0x4011d2 <+222>:  movq   $0x0,0x8(%rdx)   *(dx + 8) = 0;
   0x4011da <+230>:  mov    $0x5,%ebp        bp = 5;
      {
         0x4011df <+235>:  mov    0x8(%rbx),%rax ax = *(bx + 8);
         0x4011e3 <+239>:  mov    (%rax),%eax    ax = *ax;
         0x4011e5 <+241>:  cmp    %eax,(%rbx)   *bx >= ax true
         0x4011e7 <+243>:  jge    0x4011ee <phase_6+250>
         @REM 0x4011e9 <+245>:  call   0x40143a <explode_bomb>
         0x4011ee <+250>:  mov    0x8(%rbx),%rbx bx = *(bx + 8)
         0x4011f2 <+254>:  sub    $0x1,%ebp bp --;
         0x4011f5 <+257>:  jne    0x4011df <phase_6+235>
      }

   @REM 0x4011f7 <+259>:  add    $0x50,%rsp
   @REM 0x4011fb <+263>:  pop    %rbx
   @REM 0x4011fc <+264>:  pop    %rbp
   @REM 0x4011fd <+265>:  pop    %r12
   @REM 0x4011ff <+267>:  pop    %r13
   @REM 0x401201 <+269>:  pop    %r14
   @REM 0x401203 <+271>:  ret