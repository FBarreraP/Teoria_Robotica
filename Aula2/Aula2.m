%% 
clear all
close all
clc

%Traslación 1
p = [6; -3; 8]
r = [-2; 7; 3]
pr = p + r

%Traslación 2
r = [4; 4; 11]
p = [6; -3; 8]
rp = r + p

%Rotación 1
Rz = RotarZ(-pi/2)
r = [4; 8; 12]
Rzr = Rz * r

%Matrices de rotación con 0 grados
alfa = 0
RotarX(alfa)
RotarY(alfa)
RotarZ(alfa)


a = round(RotarZ(pi/2)*RotarY(pi/2))
b = round(RotarY(pi/2)*RotarZ(pi/2))

c = round(RotarX(pi/2)*RotarX(pi))
d = round(RotarX(pi)*RotarX(pi/2))
e = round(RotarX(pi+pi/2))



