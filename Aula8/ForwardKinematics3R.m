function [MTH] = ForwardKinematics3R(l1,l2,l3,q1,q2,q3)

    R(1) = Link('revolute','d',l1,'alpha',pi/2,'a',0,'offset',0);
    R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
    R(3) = Link('revolute','d',0,'alpha',0,'a',l3,'offset',0);

    Robot = SerialLink(R,'name','Bender');
    
    Robot.plot([q1,q2,q3],'scale',1.0,'workspace',[-30 30 -30 30 -30 30]);
    Robot.teach([q1,q2,q3]);
    MTH = Robot.fkine([q1,q2,q3]);

end