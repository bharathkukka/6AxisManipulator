clc; clear; close all;

a1 = 0.2; a2 = 0.15; a3 = 0.08;
d1 = 0.06; d2 = 0.06; d3 = 0.06; d4 = 0.03;

%  q(theta), d, a, alpha
L(1)= Link([0,d1,0,pi/2],'standard');
L(2)= Link([0,0,a1,0],'standard');
L(3)= Link([0,0,a2,0],'standard');
L(4)= Link([0,d2,a3,pi/2],'standard');
L(5)= Link([0,d3,0,-pi/2],'standard');
L(6)= Link([0,d4,0,0],'standard');

SixAxisManipulator = SerialLink(L,'name','6-AxisManipulator');

q=[0,0,0,0,0,0];

T=SixAxisManipulator.fkine(q);
 % disp(T);
 SixAxisManipulator.plot(q);
 SixAxisManipulator.teach();

  Target = transl(0.02,0.03,0.3)*trotz(pi/4);
  % qsol = SixAxisManipulator.ikine(Target);


 q1 = zeros(1,6);
 q2 = [pi/6 pi/4 -pi/4 pi/3 pi/6 pi/2];
% 
  % qtraj = jtraj(q1, q2, 50);  % Joint trajectory
  % SixAxisManipulator.plot(qtraj);
 % 

