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
    J = [J_v; J_w]
end

