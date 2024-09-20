%% Robot 3R (planar)

clear all
close all
clc

l1 = 10;
l2 = 10;
l3 = 10;

% Cinemática inversa
Px = 27.071;
Py = 7.071;
beta = deg2rad(45)

%Px = 7.739;
%Py = 22.885;
%beta = deg2rad(95.2)

e = Px - l3*round(cos(beta),4)
c = Py - l3*round(sin(beta),4)
% Theta 2
b = sqrt(e^2+c^2)
cos_theta2 = (b^2-l2^2-l1^2)/(2*l1*l2);
sen_theta2 = sqrt(1-(cos_theta2)^2);
theta2 = atan2(sen_theta2, cos_theta2);
fprintf('theta 2 = %.4f \n',rad2deg(theta2));
% Theta 1
alpha = atan2(c,e);
phi = atan2(l2*sen_theta2, l1+l2*cos_theta2);
theta1 = alpha - phi;
if theta1 <= -pi
    theta1 = (2*pi)+theta1;
end
fprintf('theta 1 = %.4f \n',rad2deg(theta1));
%Theta 3
theta3 = beta - theta1 - theta2;
fprintf('theta 3 = %.4f \n',rad2deg(theta3));
%

q1 = theta1;
q2 = theta2;
q3 = theta3;

R(1) = Link('revolute','d',0,'alpha',0,'a',l1,'offset',0);
R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
R(3) = Link('revolute','d',0,'alpha',0,'a',l3,'offset',0);

Robot = SerialLink(R,'name','Bender')

%Robot.plot([q1,q2,q3],'scale',1.0,'workspace',[-30 30 -30 30 -30 30]);
zlim([-15,30]);
Robot.teach([q1,q2,q3],'scale',1.0,'workspace',[-30 30 -30 30 -30 30],'rpy/zyx');
Robot.fkine([q1,q2,q3])


%% Robot 3R (angular)

clear all
close all
clc

l1 = 10;
l2 = 10;
l3 = 10;

% Cinemática inversa
Px = -9.545;
Py = 7.896;
Pz = 23.192;

e = sqrt(Px^2+Py^2);
c = Pz - l1;
b = sqrt(e^2+c^2);
% Theta 1
theta1 = atan2(Py,Px);
fprintf('theta 1 = %.4f \n',rad2deg(theta1));
% Theta 3
cos_theta3 = (b^2-l2^2-l3^2)/(2*l2*l3);
sen_theta3 = sqrt(1-(cos_theta3)^2);
theta3 = atan2(sen_theta3, cos_theta3);
fprintf('theta 3 = %.4f \n',rad2deg(theta3));
% Theta 2
alpha = atan2(c,e);
phi = atan2(l3*sen_theta3, l2+l3*cos_theta3);
theta2 = alpha - phi;
if theta2 <= -pi
    theta2 = (2*pi)+theta2;
end
fprintf('theta 2 = %.4f \n',rad2deg(theta2));

%

q1 = theta1;
q2 = theta2;
q3 = theta3;

R(1) = Link('revolute','d',l1,'alpha',pi/2,'a',0,'offset',0);
R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
R(3) = Link('revolute','d',0,'alpha',0,'a',l3,'offset',0);

Robot = SerialLink(R,'name','Bender')

%Robot.plot([q1,q2,q3],'scale',1.0,'workspace',[-30 30 -30 30 -30 30]);
zlim([-15,30]);
Robot.teach([q1,q2,q3],'scale',1.0,'workspace',[-30 30 -30 30 -30 30],'rpy/zyx');
Robot.fkine([q1,q2,q3])
