clear all
close all
clc
syms a alpha d theta

syms th1 th2 th3 th4 th5  th6 d1 d2  d3  a1 a2 a3   a4 real

% th1 =0; th2=0; th3=0; th4=0; th5=0; th6=0;

N = 6; % no of joints
          % [ ai-1 alphai-1  thetai di]
 DHtable = [ 0,   0,       d1, th1;
            a1,  -pi/2,    0,  th2 ;
            a2,  0,        0,  th3;
            a3,  0,        0,  th4;
            a4,  3*pi/2,   d2, th5+(3*(pi/2)) ;
            0,   3*pi/2,     d3, th6+(3*(pi/2))]

% general DHTH

TDH=[cos(theta),            -sin(theta),             0,            a;
     sin(theta)*cos(alpha), cos(theta)*cos(alpha),  -sin(alpha),   -sin(alpha)*d;
     sin(theta)*sin(alpha), cos(theta)*sin(alpha),  cos(alpha),    cos(alpha)*d;
     0,                    0,                      0,              1];

A = cell(1,N);
for i = 1:N
    a= DHtable(i,1);
    alpha = DHtable(i,2);
    d = DHtable(i,3);
    theta = DHtable(i,4);
    A{i} = subs(TDH);
end


disp('FK of the Manipulator')
disp(['no of joint N=', num2str(N)])

T = eye(4); % identy matrix 4X4

for i =1:N
    T = T*A{i};
    T = simplify(T);

end

% individual transformation matrices

T01=A{1}
T12=A{2}
T23=A{3}
T34=A{4}
T45 = A{5}
T56 =A{6}

% transformation matrix base to end

T0E = T

%position vector

P = simplify(T(1:3,4))

% orientation
% XN AXIS NORMAL VECTOR

n= T(1:3,1)

%YN axis sliding vector

s= T(1:3,2)

% ZN axis approach vector

a= T(1:3,3)


