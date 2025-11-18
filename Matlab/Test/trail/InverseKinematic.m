clc; clear; close all;

n = 6; % DOF

% Robot dimensions
 a1 = 0.2; a2 = 0.15; a3 = 0.08;
 d1 = 0.06; d2 = 0.06; d3 = 0.06; d4 = 0.03;


% Desired pose
P_desired = [0.15; 0.0131;-0.004];
R_desired = eye(3); 

% Initial joint guess
q = zeros(n,1); 

% Convergence settings
tol = 0.43;
max_iters = 10;
i = 0;

while i < max_iters
    [P_current, R_current, J, joint_positions] = forwardKinematicsAndJacobian(q, d1,a1,a2,a3,d2,d3,d4);
    
    e_p = P_desired - P_current;

    e_o = 0.5 * (cross(R_current(:,1), R_desired(:,1)) + ...
                 cross(R_current(:,2), R_desired(:,2)) + ...
                 cross(R_current(:,3), R_desired(:,3)));
    
    error = [e_p; e_o];
    
    if norm(error) < tol
        disp('Converged!');
        break;
    end
    
    delta_q = pinv(J) * error;
    q = q + delta_q;
    i = i + 1;
    
    % Visualization at each step
    plotRobot(joint_positions, P_desired);
end

if i == max_iters
    disp('Max iterations reached without convergence.');
end

%% Forward Kinematics and Jacobian
function [P, R, J, joint_positions] = forwardKinematicsAndJacobian(q, d1,a1,a2,a3,d2,d3,d4)
    DH_params = [ 0,   pi/2,  d1, q(1);
                 a1,    0,    0, q(2);
                 a2,    0,    0, q(3);
                 a3,  pi/2,  d2, q(4);
                 0,  -pi/2,  d3, q(5);
                 0,     0,  d4, q(6)];
    
    T = eye(4);
    J_v = zeros(3,6);
    J_w = zeros(3,6);
    z = [0; 0; 1];
    p = [0; 0; 0];

    joint_positions = zeros(3, 7);
    joint_positions(:,1) = p;

    for j = 1:6
        a = DH_params(j,1);
        alpha = DH_params(j,2);
        d = DH_params(j,3);
        theta = DH_params(j,4);

        A_j = [cos(theta), -sin(theta), 0, a;
               sin(theta)*cos(alpha), cos(theta)*cos(alpha), -sin(alpha), -sin(alpha)*d;
               sin(theta)*sin(alpha), cos(theta)*sin(alpha),  cos(alpha),  cos(alpha)*d;
               0, 0, 0, 1];

        T = T * A_j;

        R = T(1:3,1:3);
        P = T(1:3,4);
        joint_positions(:,j+1) = P;

        J_v(:,j) = cross(R(:,3), (P - p));
        J_w(:,j) = R(:,3);

        p = P;
    end

    P = T(1:3,4);
    R = T(1:3,1:3);
    J = [J_v; J_w];
end

%% Visualization
function plotRobot(joint_positions, P_desired)
    figure(1); clf;
    hold on;
    grid on;
    axis equal;
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title('6-Axis Manipulator Visualization');
    
    plot3(0, 0, 0, 'ks', 'MarkerSize', 20, 'MarkerFaceColor', 'k');

    plot3(joint_positions(1,:), joint_positions(2,:), joint_positions(3,:), '-bo', 'LineWidth', 7);
    plot3(P_desired(1), P_desired(2), P_desired(3), 'r*', 'MarkerSize', 30, 'LineWidth', 2);
    
    axis([-1 1 -3 1 0 1]);
    pause(1);
    view(3);
    hold off;
end
