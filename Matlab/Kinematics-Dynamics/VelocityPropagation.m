% Velocity Propagation Model 6 Axis Manipulator
% FK
clear all 
close all 
clc

syms a alpha d theta

syms th1 th2 th3 th4 th5  th6 d1 d2  d3 d4 a1 a2 a3  real

th1 =0; th2=0; th3=0; th4=0; th5=0; th6=0;

N = 6; % no of joints
          % [ ai-1 alphai-1  thetai di]
  DHtable = [ 0,   pi/2,       d1,   th1;
             a1,  0,            0,   th2 ;
             a2,  0,            0,   th3;
             a3,  pi/2,         d2,  th4;
             0,  -pi/2,         d3,  th5 ;
             0,   0,            d4,  th6 ];

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
T01=A{1};
T12=A{2};
T23=A{3};
T34=A{4};
T45= A{5};
T56=A{6};
% transformation matrix base to end
T0E = T;

%position vector
P = simplify(T(1:3,4));

% orientation
% XN AXIS NORMAL VECTOR
n= T(1:3,1);
%YN axis sliding vector
s= T(1:3,2);
% ZN axis approach vector
a= T(1:3,3);

%% Velocity Kinematics
% Individual Rotations and Position vectors
R01 = A{1}(1:3,1:3);
P01 = A{1}(1:3,4);

R12 = A{2}(1:3,1:3);
P12 = A{2}(1:3,4);

R23 = A{3}(1:3,1:3);
P23 = A{3}(1:3,4);

R34 = A{4}(1:3,1:3);
P34 = A{4}(1:3,4);

R45 = A{5}(1:3,1:3);
P45 = A{5}(1:3,4);

R56 = A{6}(1:3,1:3);
P56 = A{6}(1:3,4);

syms th1dot th2dot th3dot th4dot th5dot th6dot real

% Angular Velocity Propagation

w0 = [0;0;0] %3X1
w1 = R01'*(w0)+[0;0;th1dot]
w2 = R12'*(w1)+[0;0;th2dot]
w3 = R23'*(w2)+[0;0;th3dot]
w4 = R34'*(w3)+[0;0;th4dot]
w5 = R45'*(w4)+[0;0;th5dot]
w6 = R56'*(w5)+[0;0;th6dot]

% end effector angular velocities w.r.t base frame

w06 = R01*R12*R23*R34*R45*R56 * w6

%% Linear Velocity 
% Require both , Previous frame Linear velocity , angular velocity and
% position vector ( from FK).
v0 =[0;0;0]
v1 = R01' * (v0+cross(w0,P01))
v2 = R12' * (v1+cross(w1,P12))
v3 = R23' * (v2+cross(w2,P23))
v4 = R34' * (v3+cross(w4,P34))
v5 = R45' * (v4+cross(w5,P45))
v6 = R56' * (v5+cross(w6,P56))
% end effector linear velocity wrt base frame
v06 = simplify(R01*R12*R23*R34*R45*R56*v6)

% Jacobian Matrix
% J = equationsToMatrix(v06,[th1dot;th2dot;th3dot;th4dot;th5dot;th6dot])

Jv = equationsToMatrix(v06, [th1dot;th2dot;th3dot;th4dot;th5dot;th6dot]);
Jw = equationsToMatrix(w06, [th1dot;th2dot;th3dot;th4dot;th5dot;th6dot]);

J = [Jv; Jw] % 6 colums (th1-th6) , 6 rows ( 1-3 Linear velocity(X, Y, Z))
              % (4-6 Angular velocity (ωx, ωy, ωz))








% Method 2 with partial derivatives
% J2 =
% [diff(P(1),th1),diff(P(1),th2),diff(P(1),th3),diff(P(1),th4),diff(P(1),th5),diff(P(1),th6);
%       diff(P(2),th1),diff(P(2),th2),diff(P(2),th3),diff(P(2),th4),diff(P(2),th5),diff(P(2),th6);
%       diff(P(3),th1),diff(P(3),th2),diff(P(3),th3),diff(P(3),th4),diff(P(3),th5),diff(P(3),th6);
%       diff(P(4),th1),diff(P(4),th2),diff(P(4),th3),diff(P(4),th4),diff(P(4),th5),diff(P(4),th6);
%       diff(P(5),th1),diff(P(5),th2),diff(P(5),th3),diff(P(5),th4),diff(P(5),th5),diff(P(5),th6);
%       diff(P(6),th1),diff(P(6),th2),diff(P(6),th3),diff(P(6),th4),diff(P(6),th5),diff(P(6),th6);]
%this  is not correct 

