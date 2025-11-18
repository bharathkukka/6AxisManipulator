% Home position
theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;
theta5=0;
theta6=0;
%  Define DH Parameters [a alpha d theta]

DHparameters = [
     0   0       100    theta1;
    50  -pi/2     0     theta2;
    60   0        0     theta3;
    50   0        0    theta4;
    40  pi/2      30 theta5-pi/2    ;
    25  pi/2      25 theta6-pi/2
 ];

% Create a robot model
Robot = rigidBodyTree("DataFormat", "row", "MaxNumBodies", 6);

% Add each body and joint based on DH
% Base joint
Base = rigidBody('Base');
joint1 = rigidBodyJoint('joint1', 'revolute');
setFixedTransform(joint1, DHparameters(1,:), "dh");
Base.Joint = joint1;

% Add a thicker visual (cylinder) for the base
addVisual(Base, "Cylinder", [10 25]); % [Radius, Length]
addBody(Robot, Base, 'base');

% Shoulder joint
Shoulder = rigidBody('Shoulder');
joint2 = rigidBodyJoint('joint2', 'revolute');
setFixedTransform(joint2, DHparameters(2,:), "dh");
Shoulder.Joint = joint2;

% Add a thicker visual (cylinder) for the shoulder
addVisual(Shoulder, "Cylinder", [10 250]); % [Radius, Length]
addBody(Robot, Shoulder, 'Base');

% Elbow joint
Elbow = rigidBody('Elbow');
joint3 = rigidBodyJoint('joint3', 'revolute');
setFixedTransform(joint3, DHparameters(3,:), "dh");
Elbow.Joint = joint3;

% Add a thicker visual (cylinder) for the elbow
addVisual(Elbow, "Cylinder", [10 150]); % [Radius, Length]
addBody(Robot, Elbow, 'Shoulder');

% Wrist joint
Wrist = rigidBody('Wrist');
joint4 = rigidBodyJoint('joint4', 'revolute');
setFixedTransform(joint4, DHparameters(4,:), 'dh');
Wrist.Joint = joint4;

addVisual(Wrist, "Cylinder", [10 50]); % [Radius, Length]
addBody(Robot, Wrist, 'Elbow');

 rist = rigidBody('rist');
 joint5 = rigidBodyJoint('joint5', 'revolute');
 setFixedTransform(joint5, DHparameters(5,:), 'dh');
 rist.Joint = joint5;
 
 %Add a thicker visual (cylinder) for the rist
 addVisual(rist, "Cylinder", [10 50]); % [Radius, Length]
addBody(Robot, rist, 'Wrist');

 rist3 = rigidBody('end1');
 joint6 = rigidBodyJoint('joint6', 'revolute');
 setFixedTransform(joint6, DHparameters(6,:), 'dh');
 rist3.Joint = joint6;
 
% Add a thicker visual (cylinder) for the rist3
 addVisual(rist3, "Cylinder", [10 50]); % [Radius, Length]
 addBody(Robot, rist3, 'rist');

% Visualization of the robot
figure;
show(Robot);
title("6aXflexARM - Thicker Links");

