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
