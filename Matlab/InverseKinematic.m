% Newton-Raphson Iterative Method

clc; clear; close all;

% clc; → Clears the command window.
% clear; → Clears all variables from the workspace.
% close all; → Closes all open figures.

n = 6; % Number of Axis (Joints) DOF

% Joint Angles (Initial Guess)

q = zeros(n,1); % Initializes a 6×1 column vector of zeros for joint angles.

%  Desired End-Effector Position and Orientation

P_desired = [0.5; 0.3; 0.7];  %  Defines the target position (x, y, z).
R_desired = eye(3); % Target orientation (rotation matrix) is set to an identity matrix, meaning no rotation.

% Tolerance and Maximum Iterations

tol = 1e-6; % Tolerance for convergence , Stops iteration when the error is very small.
max_iters = 100; % Maximum iterations , Limits the number of iterations to 100 to avoid infinite loops.
i = 0; % Iteration counter ,Iteration counter starts from zero.

%  Iterate Until Convergence or Max Iterations

while i < max_iters % until the error is below tol or it reaches max_iters.

%  Compute Forward Kinematics and Jacobian

[P_current, R_current, J] = forwardKinematicsAndJacobian(q);

% function calculates- End-effector position (P_current), End-effector orientation (R_current), Jacobian matrix (J).

e_p = P_desired - P_current;

e_o = 0.5 * (cross(R_current(:,1), R_desired(:,1)) +
             cross(R_current(:,2), R_desired(:,2)) + 
             cross(R_current(:,3), R_desired(:,3)));

% Orientation error using the axis-angle approach:
%Computes the difference between the column vectors of R_current and R_desired.
%Takes the cross product to find the rotational difference.

error = [e_p; e_o]; %Combines position and orientation errors into a single 6×1 vector.

if norm(error) < tol % If the norm (magnitude) of the error is below tolerance, it stops iterating.
    disp('Converged!');
    break;
end

%  Δq using the Jacobian

delta_q = pinv(J) * error;

%Uses the pseudo-inverse pinv(J) (to avoid singularities) to solve:
%J⋅Δq=e
%for joint angle update (delta_q).

%Update Joint Angles
q = q + delta_q; % Updates the joint angles incrementally.

i = i + 1; % Increments iteration counter.

if i == max_iters
    disp('Max iterations reached without convergence.');
end


%  Compute Forward Kinematics and Jacobian

function [P, R, J] = forwardKinematicsAndJacobian(q)
%Function takes q (joint angles) as input.
%Computes: P → Position, R → Rotation matrix, J → Jacobian matrix.

DH_params = [q(1), 0.3, 0.1, pi/2;
             q(2), 0, 0.4, 0;
             q(3), 0, 0.3, 0;
             q(4), 0.2, 0, pi/2;
             q(5), 0, 0, -pi/2;
             q(6), 0.1, 0, 0];

T = eye(4); % Initializes homogeneous transformation matrix.
J_v = zeros(3,6);
J_w = zeros(3,6);

% Linear and angular Jacobian matrices (size 3×6).
z = [0; 0; 1]; % Initial z-axis.
p = [0; 0; 0]; % Initial position.

for j = 1:6
theta = DH_params(j,1);
d = DH_params(j,2);
a = DH_params(j,3);
alpha = DH_params(j,4);
% Extracts DH parameters.

A_j = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
       sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
       0, sin(alpha), cos(alpha), d;
       0, 0, 0, 1];
       %Computes the transformation matrix A_j for the current joint.
T = T * A_j; % Updates the cumulative transformation matrix.

R = T(1:3, 1:3);
P = T(1:3, 4);
% Extracts rotation matrix and position vector.
J_v(:, j) = cross(R(:,3), (P - p));
J_w(:, j) = R(:,3);
% Computes the linear (J_v) and angular (J_w) Jacobian columns.
p = P; % Updates previous position.
J = [J_v; J_w];
 
