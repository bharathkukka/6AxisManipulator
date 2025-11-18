

th1 =0; th2=0; th3=0; th4=0; th5=0; th6=0;
 a1 = 0.2; a2 = 0.15; a3 = 0.08;
 d1 = 0.06; d2 = 0.06; d3 = 0.06; d4 = 0.03;

dhparams = [  0     pi/2   d1   th1;
             a1     0      0   th2;
             a2     0      0   th3;
             a3     pi/2   d2  th4;
             0     -pi/2   d3  th5;
             0      0      d4  th6];

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
