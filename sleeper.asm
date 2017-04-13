
_sleeper:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"


int main(int argc,char *argv[])

{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 20             	sub    $0x20,%esp
  12:	89 cb                	mov    %ecx,%ebx
int i,t,d,f;
t = *argv[1] - 48;
  14:	8b 43 04             	mov    0x4(%ebx),%eax
  17:	83 c0 04             	add    $0x4,%eax
  1a:	8b 00                	mov    (%eax),%eax
  1c:	0f b6 00             	movzbl (%eax),%eax
  1f:	0f be c0             	movsbl %al,%eax
  22:	83 e8 30             	sub    $0x30,%eax
  25:	89 45 f0             	mov    %eax,-0x10(%ebp)
d = *(argv[1]+1) - 48;
  28:	8b 43 04             	mov    0x4(%ebx),%eax
  2b:	83 c0 04             	add    $0x4,%eax
  2e:	8b 00                	mov    (%eax),%eax
  30:	83 c0 01             	add    $0x1,%eax
  33:	0f b6 00             	movzbl (%eax),%eax
  36:	0f be c0             	movsbl %al,%eax
  39:	83 e8 30             	sub    $0x30,%eax
  3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
f = (10*t +d)*(40.35);
  3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  42:	89 d0                	mov    %edx,%eax
  44:	c1 e0 02             	shl    $0x2,%eax
  47:	01 d0                	add    %edx,%eax
  49:	01 c0                	add    %eax,%eax
  4b:	89 c2                	mov    %eax,%edx
  4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  50:	01 d0                	add    %edx,%eax
  52:	89 45 e0             	mov    %eax,-0x20(%ebp)
  55:	db 45 e0             	fildl  -0x20(%ebp)
  58:	dd 05 90 08 00 00    	fldl   0x890
  5e:	de c9                	fmulp  %st,%st(1)
  60:	d9 7d e6             	fnstcw -0x1a(%ebp)
  63:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  67:	b4 0c                	mov    $0xc,%ah
  69:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  6d:	d9 6d e4             	fldcw  -0x1c(%ebp)
  70:	db 5d e8             	fistpl -0x18(%ebp)
  73:	d9 6d e6             	fldcw  -0x1a(%ebp)
printf(1,"%d %d %d \n",t,d,f);
  76:	83 ec 0c             	sub    $0xc,%esp
  79:	ff 75 e8             	pushl  -0x18(%ebp)
  7c:	ff 75 ec             	pushl  -0x14(%ebp)
  7f:	ff 75 f0             	pushl  -0x10(%ebp)
  82:	68 78 08 00 00       	push   $0x878
  87:	6a 01                	push   $0x1
  89:	e8 30 04 00 00       	call   4be <printf>
  8e:	83 c4 20             	add    $0x20,%esp
sleep(f);  // Let child exit before parent.
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	ff 75 e8             	pushl  -0x18(%ebp)
  97:	e8 3b 03 00 00       	call   3d7 <sleep>
  9c:	83 c4 10             	add    $0x10,%esp
for(i = 1; i < argc; i++)
  9f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  a6:	eb 3c                	jmp    e4 <main+0xe4>
printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  ab:	83 c0 01             	add    $0x1,%eax
  ae:	3b 03                	cmp    (%ebx),%eax
  b0:	7d 07                	jge    b9 <main+0xb9>
  b2:	ba 83 08 00 00       	mov    $0x883,%edx
  b7:	eb 05                	jmp    be <main+0xbe>
  b9:	ba 85 08 00 00       	mov    $0x885,%edx
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  c8:	8b 43 04             	mov    0x4(%ebx),%eax
  cb:	01 c8                	add    %ecx,%eax
  cd:	8b 00                	mov    (%eax),%eax
  cf:	52                   	push   %edx
  d0:	50                   	push   %eax
  d1:	68 87 08 00 00       	push   $0x887
  d6:	6a 01                	push   $0x1
  d8:	e8 e1 03 00 00       	call   4be <printf>
  dd:	83 c4 10             	add    $0x10,%esp
t = *argv[1] - 48;
d = *(argv[1]+1) - 48;
f = (10*t +d)*(40.35);
printf(1,"%d %d %d \n",t,d,f);
sleep(f);  // Let child exit before parent.
for(i = 1; i < argc; i++)
  e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  e7:	3b 03                	cmp    (%ebx),%eax
  e9:	7c bd                	jl     a8 <main+0xa8>
printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");


exit();
  eb:	e8 57 02 00 00       	call   347 <exit>

000000f0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f8:	8b 55 10             	mov    0x10(%ebp),%edx
  fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  fe:	89 cb                	mov    %ecx,%ebx
 100:	89 df                	mov    %ebx,%edi
 102:	89 d1                	mov    %edx,%ecx
 104:	fc                   	cld    
 105:	f3 aa                	rep stos %al,%es:(%edi)
 107:	89 ca                	mov    %ecx,%edx
 109:	89 fb                	mov    %edi,%ebx
 10b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 10e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 111:	90                   	nop
 112:	5b                   	pop    %ebx
 113:	5f                   	pop    %edi
 114:	5d                   	pop    %ebp
 115:	c3                   	ret    

00000116 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 116:	55                   	push   %ebp
 117:	89 e5                	mov    %esp,%ebp
 119:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 122:	90                   	nop
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	8d 50 01             	lea    0x1(%eax),%edx
 129:	89 55 08             	mov    %edx,0x8(%ebp)
 12c:	8b 55 0c             	mov    0xc(%ebp),%edx
 12f:	8d 4a 01             	lea    0x1(%edx),%ecx
 132:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 135:	0f b6 12             	movzbl (%edx),%edx
 138:	88 10                	mov    %dl,(%eax)
 13a:	0f b6 00             	movzbl (%eax),%eax
 13d:	84 c0                	test   %al,%al
 13f:	75 e2                	jne    123 <strcpy+0xd>
    ;
  return os;
 141:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 149:	eb 08                	jmp    153 <strcmp+0xd>
    p++, q++;
 14b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 14f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 00             	movzbl (%eax),%eax
 159:	84 c0                	test   %al,%al
 15b:	74 10                	je     16d <strcmp+0x27>
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 10             	movzbl (%eax),%edx
 163:	8b 45 0c             	mov    0xc(%ebp),%eax
 166:	0f b6 00             	movzbl (%eax),%eax
 169:	38 c2                	cmp    %al,%dl
 16b:	74 de                	je     14b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	0f b6 d0             	movzbl %al,%edx
 176:	8b 45 0c             	mov    0xc(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	0f b6 c0             	movzbl %al,%eax
 17f:	29 c2                	sub    %eax,%edx
 181:	89 d0                	mov    %edx,%eax
}
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    

00000185 <strlen>:

uint
strlen(char *s)
{
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 18b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 192:	eb 04                	jmp    198 <strlen+0x13>
 194:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 198:	8b 55 fc             	mov    -0x4(%ebp),%edx
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	01 d0                	add    %edx,%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	75 ed                	jne    194 <strlen+0xf>
    ;
  return n;
 1a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1af:	8b 45 10             	mov    0x10(%ebp),%eax
 1b2:	50                   	push   %eax
 1b3:	ff 75 0c             	pushl  0xc(%ebp)
 1b6:	ff 75 08             	pushl  0x8(%ebp)
 1b9:	e8 32 ff ff ff       	call   f0 <stosb>
 1be:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <strchr>:

char*
strchr(const char *s, char c)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	83 ec 04             	sub    $0x4,%esp
 1cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cf:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1d2:	eb 14                	jmp    1e8 <strchr+0x22>
    if(*s == c)
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	0f b6 00             	movzbl (%eax),%eax
 1da:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1dd:	75 05                	jne    1e4 <strchr+0x1e>
      return (char*)s;
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	eb 13                	jmp    1f7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1e4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	0f b6 00             	movzbl (%eax),%eax
 1ee:	84 c0                	test   %al,%al
 1f0:	75 e2                	jne    1d4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <gets>:

char*
gets(char *buf, int max)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 206:	eb 42                	jmp    24a <gets+0x51>
    cc = read(0, &c, 1);
 208:	83 ec 04             	sub    $0x4,%esp
 20b:	6a 01                	push   $0x1
 20d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 210:	50                   	push   %eax
 211:	6a 00                	push   $0x0
 213:	e8 47 01 00 00       	call   35f <read>
 218:	83 c4 10             	add    $0x10,%esp
 21b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 21e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 222:	7e 33                	jle    257 <gets+0x5e>
      break;
    buf[i++] = c;
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	8d 50 01             	lea    0x1(%eax),%edx
 22a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 22d:	89 c2                	mov    %eax,%edx
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	01 c2                	add    %eax,%edx
 234:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 238:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 23a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23e:	3c 0a                	cmp    $0xa,%al
 240:	74 16                	je     258 <gets+0x5f>
 242:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 246:	3c 0d                	cmp    $0xd,%al
 248:	74 0e                	je     258 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24d:	83 c0 01             	add    $0x1,%eax
 250:	3b 45 0c             	cmp    0xc(%ebp),%eax
 253:	7c b3                	jl     208 <gets+0xf>
 255:	eb 01                	jmp    258 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 257:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 258:	8b 55 f4             	mov    -0xc(%ebp),%edx
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	01 d0                	add    %edx,%eax
 260:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 263:	8b 45 08             	mov    0x8(%ebp),%eax
}
 266:	c9                   	leave  
 267:	c3                   	ret    

00000268 <stat>:

int
stat(char *n, struct stat *st)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26e:	83 ec 08             	sub    $0x8,%esp
 271:	6a 00                	push   $0x0
 273:	ff 75 08             	pushl  0x8(%ebp)
 276:	e8 0c 01 00 00       	call   387 <open>
 27b:	83 c4 10             	add    $0x10,%esp
 27e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 281:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 285:	79 07                	jns    28e <stat+0x26>
    return -1;
 287:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 28c:	eb 25                	jmp    2b3 <stat+0x4b>
  r = fstat(fd, st);
 28e:	83 ec 08             	sub    $0x8,%esp
 291:	ff 75 0c             	pushl  0xc(%ebp)
 294:	ff 75 f4             	pushl  -0xc(%ebp)
 297:	e8 03 01 00 00       	call   39f <fstat>
 29c:	83 c4 10             	add    $0x10,%esp
 29f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2a2:	83 ec 0c             	sub    $0xc,%esp
 2a5:	ff 75 f4             	pushl  -0xc(%ebp)
 2a8:	e8 c2 00 00 00       	call   36f <close>
 2ad:	83 c4 10             	add    $0x10,%esp
  return r;
 2b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <atoi>:

int
atoi(const char *s)
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2bb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2c2:	eb 25                	jmp    2e9 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2c7:	89 d0                	mov    %edx,%eax
 2c9:	c1 e0 02             	shl    $0x2,%eax
 2cc:	01 d0                	add    %edx,%eax
 2ce:	01 c0                	add    %eax,%eax
 2d0:	89 c1                	mov    %eax,%ecx
 2d2:	8b 45 08             	mov    0x8(%ebp),%eax
 2d5:	8d 50 01             	lea    0x1(%eax),%edx
 2d8:	89 55 08             	mov    %edx,0x8(%ebp)
 2db:	0f b6 00             	movzbl (%eax),%eax
 2de:	0f be c0             	movsbl %al,%eax
 2e1:	01 c8                	add    %ecx,%eax
 2e3:	83 e8 30             	sub    $0x30,%eax
 2e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	0f b6 00             	movzbl (%eax),%eax
 2ef:	3c 2f                	cmp    $0x2f,%al
 2f1:	7e 0a                	jle    2fd <atoi+0x48>
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 00             	movzbl (%eax),%eax
 2f9:	3c 39                	cmp    $0x39,%al
 2fb:	7e c7                	jle    2c4 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 300:	c9                   	leave  
 301:	c3                   	ret    

00000302 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 30e:	8b 45 0c             	mov    0xc(%ebp),%eax
 311:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 314:	eb 17                	jmp    32d <memmove+0x2b>
    *dst++ = *src++;
 316:	8b 45 fc             	mov    -0x4(%ebp),%eax
 319:	8d 50 01             	lea    0x1(%eax),%edx
 31c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 31f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 322:	8d 4a 01             	lea    0x1(%edx),%ecx
 325:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 328:	0f b6 12             	movzbl (%edx),%edx
 32b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32d:	8b 45 10             	mov    0x10(%ebp),%eax
 330:	8d 50 ff             	lea    -0x1(%eax),%edx
 333:	89 55 10             	mov    %edx,0x10(%ebp)
 336:	85 c0                	test   %eax,%eax
 338:	7f dc                	jg     316 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33d:	c9                   	leave  
 33e:	c3                   	ret    

0000033f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33f:	b8 01 00 00 00       	mov    $0x1,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <exit>:
SYSCALL(exit)
 347:	b8 02 00 00 00       	mov    $0x2,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <wait>:
SYSCALL(wait)
 34f:	b8 03 00 00 00       	mov    $0x3,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <pipe>:
SYSCALL(pipe)
 357:	b8 04 00 00 00       	mov    $0x4,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <read>:
SYSCALL(read)
 35f:	b8 05 00 00 00       	mov    $0x5,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <write>:
SYSCALL(write)
 367:	b8 10 00 00 00       	mov    $0x10,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <close>:
SYSCALL(close)
 36f:	b8 15 00 00 00       	mov    $0x15,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <kill>:
SYSCALL(kill)
 377:	b8 06 00 00 00       	mov    $0x6,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <exec>:
SYSCALL(exec)
 37f:	b8 07 00 00 00       	mov    $0x7,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <open>:
SYSCALL(open)
 387:	b8 0f 00 00 00       	mov    $0xf,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <mknod>:
SYSCALL(mknod)
 38f:	b8 11 00 00 00       	mov    $0x11,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <unlink>:
SYSCALL(unlink)
 397:	b8 12 00 00 00       	mov    $0x12,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <fstat>:
SYSCALL(fstat)
 39f:	b8 08 00 00 00       	mov    $0x8,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <link>:
SYSCALL(link)
 3a7:	b8 13 00 00 00       	mov    $0x13,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <mkdir>:
SYSCALL(mkdir)
 3af:	b8 14 00 00 00       	mov    $0x14,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <chdir>:
SYSCALL(chdir)
 3b7:	b8 09 00 00 00       	mov    $0x9,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <dup>:
SYSCALL(dup)
 3bf:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <getpid>:
SYSCALL(getpid)
 3c7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <sbrk>:
SYSCALL(sbrk)
 3cf:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <sleep>:
SYSCALL(sleep)
 3d7:	b8 0d 00 00 00       	mov    $0xd,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <uptime>:
SYSCALL(uptime)
 3df:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e7:	55                   	push   %ebp
 3e8:	89 e5                	mov    %esp,%ebp
 3ea:	83 ec 18             	sub    $0x18,%esp
 3ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3f3:	83 ec 04             	sub    $0x4,%esp
 3f6:	6a 01                	push   $0x1
 3f8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3fb:	50                   	push   %eax
 3fc:	ff 75 08             	pushl  0x8(%ebp)
 3ff:	e8 63 ff ff ff       	call   367 <write>
 404:	83 c4 10             	add    $0x10,%esp
}
 407:	90                   	nop
 408:	c9                   	leave  
 409:	c3                   	ret    

0000040a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	53                   	push   %ebx
 40e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 411:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 418:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 41c:	74 17                	je     435 <printint+0x2b>
 41e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 422:	79 11                	jns    435 <printint+0x2b>
    neg = 1;
 424:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 42b:	8b 45 0c             	mov    0xc(%ebp),%eax
 42e:	f7 d8                	neg    %eax
 430:	89 45 ec             	mov    %eax,-0x14(%ebp)
 433:	eb 06                	jmp    43b <printint+0x31>
  } else {
    x = xx;
 435:	8b 45 0c             	mov    0xc(%ebp),%eax
 438:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 43b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 442:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 445:	8d 41 01             	lea    0x1(%ecx),%eax
 448:	89 45 f4             	mov    %eax,-0xc(%ebp)
 44b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 44e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 451:	ba 00 00 00 00       	mov    $0x0,%edx
 456:	f7 f3                	div    %ebx
 458:	89 d0                	mov    %edx,%eax
 45a:	0f b6 80 ec 0a 00 00 	movzbl 0xaec(%eax),%eax
 461:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 465:	8b 5d 10             	mov    0x10(%ebp),%ebx
 468:	8b 45 ec             	mov    -0x14(%ebp),%eax
 46b:	ba 00 00 00 00       	mov    $0x0,%edx
 470:	f7 f3                	div    %ebx
 472:	89 45 ec             	mov    %eax,-0x14(%ebp)
 475:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 479:	75 c7                	jne    442 <printint+0x38>
  if(neg)
 47b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 47f:	74 2d                	je     4ae <printint+0xa4>
    buf[i++] = '-';
 481:	8b 45 f4             	mov    -0xc(%ebp),%eax
 484:	8d 50 01             	lea    0x1(%eax),%edx
 487:	89 55 f4             	mov    %edx,-0xc(%ebp)
 48a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 48f:	eb 1d                	jmp    4ae <printint+0xa4>
    putc(fd, buf[i]);
 491:	8d 55 dc             	lea    -0x24(%ebp),%edx
 494:	8b 45 f4             	mov    -0xc(%ebp),%eax
 497:	01 d0                	add    %edx,%eax
 499:	0f b6 00             	movzbl (%eax),%eax
 49c:	0f be c0             	movsbl %al,%eax
 49f:	83 ec 08             	sub    $0x8,%esp
 4a2:	50                   	push   %eax
 4a3:	ff 75 08             	pushl  0x8(%ebp)
 4a6:	e8 3c ff ff ff       	call   3e7 <putc>
 4ab:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ae:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4b6:	79 d9                	jns    491 <printint+0x87>
    putc(fd, buf[i]);
}
 4b8:	90                   	nop
 4b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4bc:	c9                   	leave  
 4bd:	c3                   	ret    

000004be <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4cb:	8d 45 0c             	lea    0xc(%ebp),%eax
 4ce:	83 c0 04             	add    $0x4,%eax
 4d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4db:	e9 59 01 00 00       	jmp    639 <printf+0x17b>
    c = fmt[i] & 0xff;
 4e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 4e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4e6:	01 d0                	add    %edx,%eax
 4e8:	0f b6 00             	movzbl (%eax),%eax
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	25 ff 00 00 00       	and    $0xff,%eax
 4f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4fa:	75 2c                	jne    528 <printf+0x6a>
      if(c == '%'){
 4fc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 500:	75 0c                	jne    50e <printf+0x50>
        state = '%';
 502:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 509:	e9 27 01 00 00       	jmp    635 <printf+0x177>
      } else {
        putc(fd, c);
 50e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 511:	0f be c0             	movsbl %al,%eax
 514:	83 ec 08             	sub    $0x8,%esp
 517:	50                   	push   %eax
 518:	ff 75 08             	pushl  0x8(%ebp)
 51b:	e8 c7 fe ff ff       	call   3e7 <putc>
 520:	83 c4 10             	add    $0x10,%esp
 523:	e9 0d 01 00 00       	jmp    635 <printf+0x177>
      }
    } else if(state == '%'){
 528:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 52c:	0f 85 03 01 00 00    	jne    635 <printf+0x177>
      if(c == 'd'){
 532:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 536:	75 1e                	jne    556 <printf+0x98>
        printint(fd, *ap, 10, 1);
 538:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53b:	8b 00                	mov    (%eax),%eax
 53d:	6a 01                	push   $0x1
 53f:	6a 0a                	push   $0xa
 541:	50                   	push   %eax
 542:	ff 75 08             	pushl  0x8(%ebp)
 545:	e8 c0 fe ff ff       	call   40a <printint>
 54a:	83 c4 10             	add    $0x10,%esp
        ap++;
 54d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 551:	e9 d8 00 00 00       	jmp    62e <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 556:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 55a:	74 06                	je     562 <printf+0xa4>
 55c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 560:	75 1e                	jne    580 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 562:	8b 45 e8             	mov    -0x18(%ebp),%eax
 565:	8b 00                	mov    (%eax),%eax
 567:	6a 00                	push   $0x0
 569:	6a 10                	push   $0x10
 56b:	50                   	push   %eax
 56c:	ff 75 08             	pushl  0x8(%ebp)
 56f:	e8 96 fe ff ff       	call   40a <printint>
 574:	83 c4 10             	add    $0x10,%esp
        ap++;
 577:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57b:	e9 ae 00 00 00       	jmp    62e <printf+0x170>
      } else if(c == 's'){
 580:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 584:	75 43                	jne    5c9 <printf+0x10b>
        s = (char*)*ap;
 586:	8b 45 e8             	mov    -0x18(%ebp),%eax
 589:	8b 00                	mov    (%eax),%eax
 58b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 58e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 592:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 596:	75 25                	jne    5bd <printf+0xff>
          s = "(null)";
 598:	c7 45 f4 98 08 00 00 	movl   $0x898,-0xc(%ebp)
        while(*s != 0){
 59f:	eb 1c                	jmp    5bd <printf+0xff>
          putc(fd, *s);
 5a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a4:	0f b6 00             	movzbl (%eax),%eax
 5a7:	0f be c0             	movsbl %al,%eax
 5aa:	83 ec 08             	sub    $0x8,%esp
 5ad:	50                   	push   %eax
 5ae:	ff 75 08             	pushl  0x8(%ebp)
 5b1:	e8 31 fe ff ff       	call   3e7 <putc>
 5b6:	83 c4 10             	add    $0x10,%esp
          s++;
 5b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c0:	0f b6 00             	movzbl (%eax),%eax
 5c3:	84 c0                	test   %al,%al
 5c5:	75 da                	jne    5a1 <printf+0xe3>
 5c7:	eb 65                	jmp    62e <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5cd:	75 1d                	jne    5ec <printf+0x12e>
        putc(fd, *ap);
 5cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d2:	8b 00                	mov    (%eax),%eax
 5d4:	0f be c0             	movsbl %al,%eax
 5d7:	83 ec 08             	sub    $0x8,%esp
 5da:	50                   	push   %eax
 5db:	ff 75 08             	pushl  0x8(%ebp)
 5de:	e8 04 fe ff ff       	call   3e7 <putc>
 5e3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5e6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ea:	eb 42                	jmp    62e <printf+0x170>
      } else if(c == '%'){
 5ec:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5f0:	75 17                	jne    609 <printf+0x14b>
        putc(fd, c);
 5f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f5:	0f be c0             	movsbl %al,%eax
 5f8:	83 ec 08             	sub    $0x8,%esp
 5fb:	50                   	push   %eax
 5fc:	ff 75 08             	pushl  0x8(%ebp)
 5ff:	e8 e3 fd ff ff       	call   3e7 <putc>
 604:	83 c4 10             	add    $0x10,%esp
 607:	eb 25                	jmp    62e <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 609:	83 ec 08             	sub    $0x8,%esp
 60c:	6a 25                	push   $0x25
 60e:	ff 75 08             	pushl  0x8(%ebp)
 611:	e8 d1 fd ff ff       	call   3e7 <putc>
 616:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 619:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61c:	0f be c0             	movsbl %al,%eax
 61f:	83 ec 08             	sub    $0x8,%esp
 622:	50                   	push   %eax
 623:	ff 75 08             	pushl  0x8(%ebp)
 626:	e8 bc fd ff ff       	call   3e7 <putc>
 62b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 62e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 635:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 639:	8b 55 0c             	mov    0xc(%ebp),%edx
 63c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 63f:	01 d0                	add    %edx,%eax
 641:	0f b6 00             	movzbl (%eax),%eax
 644:	84 c0                	test   %al,%al
 646:	0f 85 94 fe ff ff    	jne    4e0 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 64c:	90                   	nop
 64d:	c9                   	leave  
 64e:	c3                   	ret    

0000064f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 64f:	55                   	push   %ebp
 650:	89 e5                	mov    %esp,%ebp
 652:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	83 e8 08             	sub    $0x8,%eax
 65b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65e:	a1 08 0b 00 00       	mov    0xb08,%eax
 663:	89 45 fc             	mov    %eax,-0x4(%ebp)
 666:	eb 24                	jmp    68c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 668:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 670:	77 12                	ja     684 <free+0x35>
 672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 675:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 678:	77 24                	ja     69e <free+0x4f>
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	8b 00                	mov    (%eax),%eax
 67f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 682:	77 1a                	ja     69e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 692:	76 d4                	jbe    668 <free+0x19>
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 69c:	76 ca                	jbe    668 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 69e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a1:	8b 40 04             	mov    0x4(%eax),%eax
 6a4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	01 c2                	add    %eax,%edx
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 00                	mov    (%eax),%eax
 6b5:	39 c2                	cmp    %eax,%edx
 6b7:	75 24                	jne    6dd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bc:	8b 50 04             	mov    0x4(%eax),%edx
 6bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	8b 40 04             	mov    0x4(%eax),%eax
 6c7:	01 c2                	add    %eax,%edx
 6c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cc:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	8b 00                	mov    (%eax),%eax
 6d4:	8b 10                	mov    (%eax),%edx
 6d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d9:	89 10                	mov    %edx,(%eax)
 6db:	eb 0a                	jmp    6e7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 10                	mov    (%eax),%edx
 6e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 40 04             	mov    0x4(%eax),%eax
 6ed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f7:	01 d0                	add    %edx,%eax
 6f9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fc:	75 20                	jne    71e <free+0xcf>
    p->s.size += bp->s.size;
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 50 04             	mov    0x4(%eax),%edx
 704:	8b 45 f8             	mov    -0x8(%ebp),%eax
 707:	8b 40 04             	mov    0x4(%eax),%eax
 70a:	01 c2                	add    %eax,%edx
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	8b 10                	mov    (%eax),%edx
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	89 10                	mov    %edx,(%eax)
 71c:	eb 08                	jmp    726 <free+0xd7>
  } else
    p->s.ptr = bp;
 71e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 721:	8b 55 f8             	mov    -0x8(%ebp),%edx
 724:	89 10                	mov    %edx,(%eax)
  freep = p;
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	a3 08 0b 00 00       	mov    %eax,0xb08
}
 72e:	90                   	nop
 72f:	c9                   	leave  
 730:	c3                   	ret    

00000731 <morecore>:

static Header*
morecore(uint nu)
{
 731:	55                   	push   %ebp
 732:	89 e5                	mov    %esp,%ebp
 734:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 737:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 73e:	77 07                	ja     747 <morecore+0x16>
    nu = 4096;
 740:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	c1 e0 03             	shl    $0x3,%eax
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	50                   	push   %eax
 751:	e8 79 fc ff ff       	call   3cf <sbrk>
 756:	83 c4 10             	add    $0x10,%esp
 759:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 75c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 760:	75 07                	jne    769 <morecore+0x38>
    return 0;
 762:	b8 00 00 00 00       	mov    $0x0,%eax
 767:	eb 26                	jmp    78f <morecore+0x5e>
  hp = (Header*)p;
 769:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 76f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 772:	8b 55 08             	mov    0x8(%ebp),%edx
 775:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 778:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77b:	83 c0 08             	add    $0x8,%eax
 77e:	83 ec 0c             	sub    $0xc,%esp
 781:	50                   	push   %eax
 782:	e8 c8 fe ff ff       	call   64f <free>
 787:	83 c4 10             	add    $0x10,%esp
  return freep;
 78a:	a1 08 0b 00 00       	mov    0xb08,%eax
}
 78f:	c9                   	leave  
 790:	c3                   	ret    

00000791 <malloc>:

void*
malloc(uint nbytes)
{
 791:	55                   	push   %ebp
 792:	89 e5                	mov    %esp,%ebp
 794:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	83 c0 07             	add    $0x7,%eax
 79d:	c1 e8 03             	shr    $0x3,%eax
 7a0:	83 c0 01             	add    $0x1,%eax
 7a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7a6:	a1 08 0b 00 00       	mov    0xb08,%eax
 7ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7b2:	75 23                	jne    7d7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7b4:	c7 45 f0 00 0b 00 00 	movl   $0xb00,-0x10(%ebp)
 7bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7be:	a3 08 0b 00 00       	mov    %eax,0xb08
 7c3:	a1 08 0b 00 00       	mov    0xb08,%eax
 7c8:	a3 00 0b 00 00       	mov    %eax,0xb00
    base.s.size = 0;
 7cd:	c7 05 04 0b 00 00 00 	movl   $0x0,0xb04
 7d4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e8:	72 4d                	jb     837 <malloc+0xa6>
      if(p->s.size == nunits)
 7ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ed:	8b 40 04             	mov    0x4(%eax),%eax
 7f0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7f3:	75 0c                	jne    801 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 10                	mov    (%eax),%edx
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	89 10                	mov    %edx,(%eax)
 7ff:	eb 26                	jmp    827 <malloc+0x96>
      else {
        p->s.size -= nunits;
 801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804:	8b 40 04             	mov    0x4(%eax),%eax
 807:	2b 45 ec             	sub    -0x14(%ebp),%eax
 80a:	89 c2                	mov    %eax,%edx
 80c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 812:	8b 45 f4             	mov    -0xc(%ebp),%eax
 815:	8b 40 04             	mov    0x4(%eax),%eax
 818:	c1 e0 03             	shl    $0x3,%eax
 81b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 821:	8b 55 ec             	mov    -0x14(%ebp),%edx
 824:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 827:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82a:	a3 08 0b 00 00       	mov    %eax,0xb08
      return (void*)(p + 1);
 82f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 832:	83 c0 08             	add    $0x8,%eax
 835:	eb 3b                	jmp    872 <malloc+0xe1>
    }
    if(p == freep)
 837:	a1 08 0b 00 00       	mov    0xb08,%eax
 83c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 83f:	75 1e                	jne    85f <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 841:	83 ec 0c             	sub    $0xc,%esp
 844:	ff 75 ec             	pushl  -0x14(%ebp)
 847:	e8 e5 fe ff ff       	call   731 <morecore>
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 852:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 856:	75 07                	jne    85f <malloc+0xce>
        return 0;
 858:	b8 00 00 00 00       	mov    $0x0,%eax
 85d:	eb 13                	jmp    872 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	89 45 f0             	mov    %eax,-0x10(%ebp)
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	8b 00                	mov    (%eax),%eax
 86a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 86d:	e9 6d ff ff ff       	jmp    7df <malloc+0x4e>
}
 872:	c9                   	leave  
 873:	c3                   	ret    
