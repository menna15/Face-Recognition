c1=imresize(double(rgb2gray(imread('test1_1.jpg'))),[120 80]);
c2=imresize(double(rgb2gray(imread('test1_2.jpg'))),[120 80]);
c3=imresize(double(rgb2gray(imread('test1_3.jpg'))),[120 80]);
c4=imresize(double(rgb2gray(imread('test1_4.jpg'))),[120 80]);
c5=imresize(double(rgb2gray(imread('test1_5.jpg'))),[120 80]);
 
e1=imresize(double(rgb2gray(imread('test2_00000001.jpg'))),[120 80]);
e2=imresize(double(rgb2gray(imread('test2_00000002.jpg'))),[120 80]);
e3=imresize(double(rgb2gray(imread('test2_00000003.jpg'))),[120 80]);
e4=imresize(double(rgb2gray(imread('test2_00000004.jpg'))),[120 80]);
e5=imresize(double(rgb2gray(imread('test2_00000005.jpg'))),[120 80]);
 
u1=imresize(double(rgb2gray(imread('test3_00000001.jpg'))),[120 80]);
u2=imresize(double(rgb2gray(imread('test3_00000002.jpg'))),[120 80]);
u3=imresize(double(rgb2gray(imread('test3_00000003.jpg'))),[120 80]);
u4=imresize(double(rgb2gray(imread('test3_00000004.jpg'))),[120 80]);
u5=imresize(double(rgb2gray(imread('test3_00000005.jpg'))),[120 80]);
 
n1=imresize(double(rgb2gray(imread('test4_00000001.jpg'))),[120 80]);
n2=imresize(double(rgb2gray(imread('test4_00000002.jpg'))),[120 80]);
n3=imresize(double(rgb2gray(imread('test4_00000003.jpg'))),[120 80]);
n4=imresize(double(rgb2gray(imread('test4_00000004.jpg'))),[120 80]);
n5=imresize(double(rgb2gray(imread('test4_00000005.jpg'))),[120 80]);
 
 
z1=imresize(double(rgb2gray(imread('test5_1.jpg'))),[120 80]);
z2=imresize(double(rgb2gray(imread('test5_2.jpg'))),[120 80]);
z3=imresize(double(rgb2gray(imread('test5_3.jpg'))),[120 80]);
z4=imresize(double(rgb2gray(imread('test5_4.jpg'))),[120 80]);
z5=imresize(double(rgb2gray(imread('test5_5.jpg'))),[120 80]);
 
T=[reshape(c1,1,120*80)
   reshape(c2,1,120*80)
   reshape(c3,1,120*80)
   reshape(c4,1,120*80)
   reshape(c5,1,120*80)
   
   reshape(e1,1,120*80)
   reshape(e2,1,120*80)
   reshape(e3,1,120*80)
   reshape(e4,1,120*80)
   reshape(e5,1,120*80)
    
   reshape(u1,1,120*80)
   reshape(u2,1,120*80)
   reshape(u3,1,120*80)
   
   reshape(u4,1,120*80)
   reshape(u5,1,120*80)
   
   reshape(n1,1,120*80)
   reshape(n2,1,120*80)
   reshape(n3,1,120*80)
   reshape(n4,1,120*80)
   reshape(n5,1,120*80)
   
   reshape(z1,1,120*80)
   reshape(z2,1,120*80)
   reshape(z3,1,120*80)
 
   reshape(z4,1,120*80)
   reshape(z5,1,120*80)]
   
  Avec=(c1+c2+c3+c4+c5)/5;
Avee=(e1+e2+e3+e4+e5)/5;
Avez=(u1+u2+u3+u4+u5)/5;
Aveu=(n1+n2+n3+n4+n5)/5;
Aven=(z1+z2+z3+z4+z5)/5;
 
 
vecc =reshape(Avec,1,120*80);
vece =reshape(Avee,1,120*80);
vecz =reshape(Avez,1,120*80);
vecu =reshape(Aveu,1,120*80);
vecn =reshape(Aven,1,120*80);
 
M=[vecc;vecc;vecc;vecc;vecc;vece;vece;vece;vece;vece;vecz;vecz;vecz;vecz;vecz;vecu;vecu;vecu;vecu;vecu;vecn;vecn;vecn;vecn;vecn];
train=T-M;
 
A=(T')*(T);
[v,d]=eigs(A,25,'lm');
 
TRIAN=train*v;
 
T1=imresize(double(rgb2gray(imread('0002_5.jpg'))),[120 80]);
T2=imresize(double(rgb2gray(imread('0000_00000001.jpg'))),[120 80]);
T3=imresize(double(rgb2gray(imread('0001_00000001.jpg'))),[120 80]);
T4=imresize(double(rgb2gray(imread('0003_00000001.jpg'))),[120 80]);
 
 
 
vec1 =  reshape(T1,1,120*80);
vec2 =  reshape(T2,1,120*80);
vec3 =  reshape(T3,1,120*80);
vec4 =  reshape(T4,1,120*80);
 
E=[vec1;vec2;vec3;vec4];
meantest=[vecc;vece;vecu;vecn];
test=E-meantest;
TEST=test*v;
 
 Trainlabel=['c';'c';'c';'c';'c';'e';'e';'e';'e';'e';'u';'u';'u';'u';'u';'n';'n';'n';'n';'n';'z';'z';'z';'z';'z'];
 Testlabel=['c';'e';'u';'n'];
class=knnclassify(TEST,TRIAN,Trainlabel,3);
TT=vec2;
TT2=TT*v;
class1=knnclassify(TT2,TRIAN,Trainlabel,3);
if(class1=='e')
    imshow('0000_00000001.jpg');title('Ahmed');
elseif(class1=='c')
    imshow('0000_00000001.jpg');title('menna');
elseif(class1=='u')
    imshow('0000_00000001.jpg');title('Adham');
elseif(class1=='n')
    imshow('0000_00000001.jpg');title('seif');
elseif(class1=='z')
    imshow('0000_00000001.jpg');title('manar');
end;
