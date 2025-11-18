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
