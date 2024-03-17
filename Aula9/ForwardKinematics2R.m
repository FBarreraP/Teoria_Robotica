function [MTH] = ForwardKinematics(l1,l2,q1,q2)

    R(1) = Link('revolute','d',0,'alpha',0,'a',l1,'offset',0);
    R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);

    Robot = SerialLink(R,'name','Bender')

    Robot.plot([q1,q2],'scale',1.0,'workspace',[-30 30 -30 30 -30 30]);
    zlim([-15,30]);
    Robot.teach([q1,q2]);
    Robot.fkine([q1,q2])

end