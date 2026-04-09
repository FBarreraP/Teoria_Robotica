%% Trayectoria de perfil de velocidad trapezoidal 3R (MoveJ)

% clear all
% close all
% clc

l1 = 10;
l2 = 10;
l3 = 10;

R(1) = Link('revolute','d',l1,'alpha',pi/2,'a',0,'offset',0);
R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
R(3) = Link('revolute','d',0,'alpha',0,'a',l3,'offset',0);

Robot = SerialLink(R,'name','Bender')

%Trayectoria 1 - perfil trapezoidal
t0 = 0
tf = 10
t = linspace(t0,tf,20);

% v1 = [1 0.9]
% v2 = [2 1.8]

% Punto 1
P1x = 2.456;
P1y = 0.31;
P1z = 26.933;

[theta1_P1, theta2_P1, theta3_P1] = InverseKinematics3R(l1,l2,l3,P1x,P1y,P1z);

% Punto 2
P2x = -9.804;
P2y = 11.851;
P2z = 20.723;

[theta1_P2, theta2_P2, theta3_P2] = InverseKinematics3R(l1,l2,l3,P2x,P2y,P2z);

[q1, dq1, ddq1] = TraTra(theta1_P1,theta1_P2,t)
[q2, dq2, ddq2] = TraTra(theta2_P1,theta2_P2,t)
[q3, dq3, ddq3] = TraTra(theta3_P1,theta3_P2,t)

% AT = qf - q0
% dq_max = AT*(2/(1.5*tf))*1.2 %Velocidad de la articulación

figure(4)
title('Articulación 1')
figA = subplot(3,1,1);
%axis([t0 tf -Inf Inf])
grid on
hold on
title('Posición angular')
xlabel('tiempo (s)')
ylabel('ángulo (grados)')

figB = subplot(3,1,2);
%axis([t0 tf -Inf Inf])
grid on
hold on
title('Velocidad angular')
xlabel('tiempo (s)')
ylabel('velocidad (rad/s)')

figC = subplot(3,1,3);
%axis([t0 tf -Inf Inf])
grid on
hold on
title('Aceleración angular')
xlabel('tiempo (s)')
ylabel('aceleración (rad/s^2)')


for i=1:length(q1)
    t_(i,1) = t(i);
    % Gráfica de posición
    q1_(i,1) = rad2deg(q1(i))
    plot(figA,t_(:),q1_(:,1),'-b')
    q2_(i,1) = rad2deg(q2(i))
    plot(figA,t_(:),q2_(:,1),'-g')
    q3_(i,1) = rad2deg(q3(i))
    plot(figA,t_(:),q3_(:,1),'-r')
    % Gráfica de velocidad
    dq1_(i,1) = dq1(i)
    plot(figB,t_(:),dq1_(:,1),'-b')
    dq2_(i,1) = dq2(i)
    plot(figB,t_(:),dq2_(:,1),'-g')
    dq3_(i,1) = dq3(i)
    plot(figB,t_(:),dq3_(:,1),'-r')
    % Gráfica de aceleración
    ddq1_(i,1) = ddq1(i)
    plot(figC,t_(:),ddq1_(:,1),'-b')
    ddq2_(i,1) = ddq2(i)
    plot(figC,t_(:),ddq2_(:,1),'-g')
    ddq3_(i,1) = ddq3(i)
    plot(figC,t_(:),ddq3_(:,1),'-r')
    
    figure(1)
    Robot.teach([q1(i),q2(i),q3(i)],'scale',1.0,'workspace',[-30 30 -30 30 -30 30]);
%     zlim([-15,30]);
    MTH = Robot.fkine([q1(i),q2(i),q3(i)])
    hold on
    plot3(MTH.t(1),MTH.t(2),MTH.t(3),'.g')
end

legend(figA,'q1','q2','q3','Location','northwest')
legend(figB,'dq1','dq2','dq3','Location','southeast')
legend(figC,'d2q1','d2q2','d2q3','Location','northeast')