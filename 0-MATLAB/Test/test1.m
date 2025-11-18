myRobot = rigidBodyTree('DataFormat','column');

for i = 1:6
    body = rigidBody(['body' num2str(i)]);
    joint = rigidBodyJoint(['joint' num2str(i)], 'revolute');
    setFixedTransform(joint, dhparams(i,:), 'dh');
    body.Joint = joint;

    if i == 1
        addBody(myRobot, body, myRobot.BaseName);
    else
        addBody(myRobot, body, ['body' num2str(i-1)]);
    end
end

show(myRobot)

smimport(myRobot)
