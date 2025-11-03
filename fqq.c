#ifndef FQQ
#define FQQ
#define P(a,b) a b
#define P3(a,b,c) a b c
#define P4(a,b,c,d) a b c d
#define G(a,b) a##b
#define G3(a,b,c) a##b##c
#define G4(a,b,c,d) a##b##c##d
#define CCCP argc
#define VVVP argv
P3(extern,int,printf)();/**/P3(extern,int,scanf)();
P3(extern,int,strcmp)();/**/P3(extern,char,*strcpy)();
P3(extern,double,pow)();/**/P3(extern,int,atoi)();
P(int,main)(P(int,argc),P(char,**argv)){
P(int,x)=0;P(int,y)=0;
P(double,s)=0;
P(char,op[32]);
if(CCCP==4){
P3(x,=,atoi(VVVP[1]));
strcpy(op,VVVP[2]);
y=atoi(VVVP[3]);
}P(else,if)(CCCP>4){
G(pri,ntf)("argc%cerror.\n",32);
}P(else,if)(CCCP<4){
G(pri,ntf)("Xyz\nX?%c",32);
G(sca,nf)("%d",&x);
G(pri,ntf)("%d%cY%cz\nY?%c",x,32,32,32);
G(sca,nf)(" %s",op);
G(pri,ntf)("%d%c%s%cZ\nZ?%c",x,32,op,32,32);
G(sca,nf)("%d",&y);}
if(strcmp(op,"+")==0){s=x+y;}
P(else,if)(strcmp(op,"-")==0){s=x-y;}
P(else,if)(strcmp(op,"*")==0/**/||/**/G(str,cmp)(op,"x")==0){s=x*y;}
P(else,if)(strcmp(op,"/")==0) {if(y==0) {G(pri,ntf)("fqq>%cfuck%cyou\n",32,32);P(return,420);}s=x/y;}
P(else,if)(strcmp(op,"^")==0){s=pow(x,y);}
G(pri,ntf)("%d%s%d=%f\n",x,op,y,s);
P(return,(int)s);}
#endif

