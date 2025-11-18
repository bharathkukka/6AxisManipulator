clc; clear; close all;

% Robot Parameters
a1 = 0.2;
a2 = 0.15;
a3 = 0.08;
d1 = 0.06;
d2 = 0.06;
d3 = 0.06;
d4 = 0.03;

% Number of samples
num_samples = 5000;

% Storing end-effector positions
positions = zeros(num_samples, 3);

for i = 1:num_samples
    % Generating random joint angles between -pi to pi
    q = (2*pi)*rand(6,1) - pi;

    % forward kinematics
    T = eye(4);
    
    DH_params = [  0,    pi/2, d1, q(1);
                 a1,      0,   0,  q(2);
                 a2,      0,   0,  q(3);
                 a3,   pi/2,  d2,  q(4);
                  0,  -pi/2,  d3,  q(5);
                  0,      0,  d4,  q(6)];

    for j = 1:6
        a = DH_params(j,1);
        alpha = DH_params(j,2);
        d = DH_params(j,3);
        theta = DH_params(j,4);

        A = [cos(theta), -sin(theta), 0, a;
             sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -sin(alpha)*d;
             sin(theta)*sin(alpha), cos(theta)*sin(alpha), cos(alpha), cos(alpha)*d;
             0, 0, 0, 1];

        T = T * A;
    end

    % Extracting the positions
    positions(i,:) = T(1:3,4)';
end

% Ploting the workspace
figure;
scatter3(positions(:,1), positions(:,2), positions(:,3), 5, 'filled');
xlabel('X [m]'); ylabel('Y [m]'); zlabel('Z [m]');
title('6DOF Robot Reachable Workspace');
grid on;
axis equal;
view(3);
