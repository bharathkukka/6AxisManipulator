clc; clear; close all;
% Robotic System Tool Box
% HomePosition
theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;
theta5 = 0;
theta6 = 0;

% %DH Parameters [a alpha d theta] meters 

(* DHparameters = [
       0      0       0.1       theta1;
      0.04  -pi/2     0        theta2;
      0.06   0        0        theta3;
      0.05   0        0        theta4;
      0.04   3*pi/2   0.03     theta5+3*pi/2;
      0      3*pi/2    0.04     theta6+pi/2;
  ]; *)
 

 DHparameters = [
      0      pi/2         0.06     theta1;
      0.2     0           0        theta2;
      0.15    0           0        theta3;
      0.08   pi/2         0.06     theta4;
      0     -pi/2         0.06     theta5;
      0      0            0.03     theta6;
  ];


% Creating a robot model
Robot = rigidBodyTree("DataFormat", "row", "MaxNumBodies", 6);

% creates a tree-structured robot object. Add rigid bodies to it using addBody.
 % DataFormat Specifies how the joint configurations (angles/positions),
 % velocities, and torques are represented.
 %"row" format means joint states are represented as row vectors.
 %q = [0, pi/4, -pi/2, pi/6, 0, 0];Joint angles in a row vector
 % maximum number of rigid bodies (links) in the robot.


% Base joint
Base = rigidBody('Base');
joint1 = rigidBodyJoint('joint1', 'revolute');

setFixedTransform(joint1, DHparameters(1,:), "dh");

Base.Joint = joint1;
addBody(Robot, Base, 'base');

%addVisual(Base, "Cylinder", [10 25]); % [Radius, Length]


% Shoulder joint
Shoulder = rigidBody('Shoulder');
joint2 = rigidBodyJoint('joint2', 'revolute');

setFixedTransform(joint2, DHparameters(2,:), "dh");

Shoulder.Joint = joint2;
addBody(Robot, Shoulder, 'Base');

%addVisual(Shoulder, "Cylinder", [10 250]); % [Radius, Length]

% Elbow joint
Elbow = rigidBody('Elbow');
joint3 = rigidBodyJoint('joint3', 'revolute');

setFixedTransform(joint3, DHparameters(3,:), "dh");

Elbow.Joint = joint3;
addBody(Robot, Elbow, 'Shoulder');

%addVisual(Elbow, "Cylinder", [10 150]); % [Radius, Length]

% Wrist joint
Wrist = rigidBody('Wrist');
joint4 = rigidBodyJoint('joint4', 'revolute');

setFixedTransform(joint4, DHparameters(4,:), 'dh');

Wrist.Joint = joint4;
addBody(Robot, Wrist, 'Elbow');

%addVisual(Wrist, "Cylinder", [10 50]); % [Radius, Length]


% Wrist 2 (correcting variable name)
Wrist2 = rigidBody('Wrist2');
joint5 = rigidBodyJoint('joint5', 'revolute');

setFixedTransform(joint5, DHparameters(5,:), 'dh');

Wrist2.Joint = joint5;
addBody(Robot, Wrist2, 'Wrist');

% addVisual(Wrist2, "Cylinder", [10 50]); % [Radius, Length]

% End-effector
EndEffector = rigidBody('EndEffector');
joint6 = rigidBodyJoint('joint6', 'revolute');

setFixedTransform(joint6, DHparameters(6,:), 'dh');

EndEffector.Joint = joint6;
addBody(Robot, EndEffector, 'Wrist2');

%addVisual(EndEffector, "Cylinder", [10 50]); % [Radius, Length]

%showdetails(Robot)

%  (;) controls whether the output is displayed in the command window.
% with ;
%Displays the robot visualization in a figure window. Does not print extra information in the MATLAB command window.
% Preferred for cleaner execution without cluttering the command window

% with out ;
% Also prints additional output (like graphics handle information) in the command window.

% Visualization of the robot

figure;
show(Robot)
camzoom(3);
axis([-0.5,0.5,-0.5,0.5,-0.5,0.5])

%axis([Xmin, Xmax, Ymin, Ymax, Zmin, Zmax]) range of x,y,z axis
%ensures the robot remains within a fixed view, improving visualization.

axis off   %Removes the axis lines, ticks, and labels from the plot.
           %This makes the robot visualization cleaner.
view(3); % Set a 3D view
grid on; % Add a grid for better visibility

title("6Axis RoboticArm");
