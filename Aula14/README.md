<h1>Aula 14</h1>

Esta clase consiste en comprender y analizar los Jacobianos.

<h2>Jacobianos</h2>

Los jacobianos directo e inverso permiten obtener las velocidades del TCP a partir de las velocidades de las articulaciones y viceversa, respectivamente; además, es posible realizar el análisis a través de jacobiano análitico y geométrico.

1. Calcular las velocidades del TCP y/o articulaciones
2. Calcular la cinemática inversa
3. Calcular trayectorias

<h3>Jacobiano directo</h3>

El Jacobiano directo permite determinar las velocidades del efector final a partir de las velocidades de las articulaciones.

![Jacobiano directo](image-2.png)

<h3>Jacobiano analítico directo</h3>

El Jacobiano analítico directo consiste en calcular la matriz Jacobiana, la cual se compone de las derivadas parciales de las funciones del efector final con respecto a los movimientos de las articulaciones.

$$
\begin{bmatrix}
\dot{x} \\ 
\dot{y} \\ 
\dot{z} \\
\dot{R}_x \\
\dot{R}_y \\
\dot{R}_z \\ 
\end{bmatrix} = 𝐽 \cdot \begin{bmatrix}
\dot{q}_1 \\ 
⋮ \\ 
\dot{q}_n \\ 
\end{bmatrix}
$$

Siendo $𝐽$ la matriz Jacobiana, expresada por:

$$
𝐽 = \begin{bmatrix}
\frac{𝑑𝑓_𝑥}{𝑑𝑞_1} & ⋯ & \frac{𝑑𝑓_𝑥}{𝑑𝑞_𝑛} \\ 
⋮ & ⋱ & ⋮ \\ 
\frac{𝑑𝑓_{𝑅_𝑧}}{𝑑𝑞_1} & ⋯ & \frac{𝑑𝑓_{𝑅_𝑧}}{𝑑𝑞_𝑛}\\ 
\end{bmatrix} 
$$

<h3>Robot 2R (planar)</h3>

![2R 2D y 3D](image-1.png)

Teniendo en cuenta las siguientes ecuaciones de la cinemática directa de un robot 2R:

$$𝑥=𝑙_1cos⁡(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2)$$

$$𝑦=𝑙_1sen⁡(𝜃_1)+𝑙_2sen⁡(𝜃_1+𝜃_2)$$

$$𝑧=ℎ_1−ℎ_2$$

Derivando cada función con respecto a las dos articulaciones, se obtiene la siguiente matriz Jacobiana:

$$
𝐽 = \begin{bmatrix}
\frac{𝑑𝑓_𝑥}{𝑑𝜃_1} & \frac{𝑑𝑓_𝑥}{𝑑𝜃_2} \\ 
\frac{𝑑𝑓_y}{𝑑𝜃_1} & \frac{𝑑𝑓_y}{𝑑𝜃_2} \\ 
\frac{𝑑𝑓_z}{𝑑𝜃_1} & \frac{𝑑𝑓_z}{𝑑𝜃_2} \\ 
\end{bmatrix} = \begin{bmatrix}
-𝑙_1sen⁡(𝜃_1)-𝑙_2sen⁡(𝜃_1+𝜃_2) & -𝑙_2sen(𝜃_1+𝜃_2) \\ 
𝑙_1cos(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2) & 𝑙_2cos⁡(𝜃_1+𝜃_2)\\ 
0 & 0\\ 
\end{bmatrix} 
$$

```matlab
clear all
close all
clc

syms l1 l2 h1 h2 theta1 theta2

x = l1*cos(theta1)+l2*cos(theta1+theta2)
y = l1*sin(theta1)+l2*sin(theta1+theta2)
z = h1 - h2

Js = [diff(x,theta1) diff(x,theta2);
      diff(y,theta1) diff(y,theta2);
      diff(z,theta1) diff(z,theta2);]
```

<h3>Jacobiano geométrico directo</h3>

El Jacobiano geométrico directo consiste en aplicar la generalidad para cada articulación.

<h4>Articulación prismática</h4>

$$R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}$$

$$\begin{bmatrix}
0 \\ 
0 \\ 
0 \\
\end{bmatrix}$$

<h4>Articulación rotacional</h4>

$$R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\times(d_k^0-d_{i-1}^0)$$

$$R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}$$

Donde: 

i = articulación actual<br>
k = número de articulaciones

Siendo $J_{m \times n}$ la matriz Jacobiana, donde, n = número de articulaciones y m = número de velocidades del TCP

$$J = \begin{bmatrix}
R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\times(d_k^0-d_{i-1}^0) & R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\times(d_k^0-d_{i-1}^0) \\ 
R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix} & R_{i-1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\\ 
\end{bmatrix}
$$

<h3>Robot 2R (planar)</h3>

![2R 2D y 3D](image-1.png)

Teniendo en cuenta las siguientes ecuaciones de la cinemática directa de un robot 2R:

$$𝑥=𝑙_1cos⁡(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2)$$

$$𝑦=𝑙_1sen⁡(𝜃_1)+𝑙_2sen⁡(𝜃_1+𝜃_2)$$

$$𝑧=ℎ_1−ℎ_2$$

La primera y la segunda columna son equivalentes a la primera articulación y segunda articulación, respectivamente.

$$J = \begin{bmatrix}
R_{0}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\times(d_2^0-d_{0}^0) & R_{1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\times(d_2^0-d_{1}^0) \\ 
R_{0}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix} & R_{1}^{0} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\\ 
\end{bmatrix}
$$

Las MTHs de la primera y segunda articulación son:

$$ 𝑇_2^1 = 𝑇_1^0 = \begin{bmatrix}
cos⁡(𝜃_1) & -sen⁡(𝜃_1) & 0 & 𝑙_1 \cdot cos⁡(𝜃_1)\\ 
sen⁡(𝜃_1) & cos⁡(𝜃_1) & 0 & 𝑙_1 \cdot sen⁡(𝜃_1)\\ 
0 & 0 & 1 & 0\\ 
0 & 0 & 0 & 1
\end{bmatrix}$$

$$𝑇_3^2 = 𝑇_2^1 = \begin{bmatrix}
cos⁡(𝜃_2) & -sen⁡(𝜃_2) & 0 & 𝑙_2 \cdot cos⁡(𝜃_2)\\ 
sen⁡(𝜃_2) & cos⁡(𝜃_2) & 0 & 𝑙_2 \cdot sen⁡(𝜃_2)\\ 
0 & 0 & 1 & 0\\ 
0 & 0 & 0 & 1
\end{bmatrix}$$

$$𝑇_3^1 = 𝑇_2^0 = \begin{bmatrix}
cos⁡(𝜃_1+𝜃_2) & -sen⁡(𝜃_1+𝜃_2) & 0 & 𝑙_1 \cdot cos(𝜃_1) + 𝑙_2 \cdot cos⁡(𝜃_1+𝜃_2)\\ 
sen⁡(𝜃_1+𝜃_2) & cos⁡(𝜃_1+𝜃_2) & 0 & 𝑙_1 \cdot sen(𝜃_1) + 𝑙_2 \cdot sen⁡(𝜃_1+𝜃_2)\\ 
0 & 0 & 1 & 0\\ 
0 & 0 & 0 & 1
\end{bmatrix}$$

Por tanto, la matriz Jacobiana es:

$$J = \begin{bmatrix}
\begin{bmatrix}
1 & 0 & 0 \\ 
0 & 1 & 0\\ 
0 & 0 & 1 \\
\end{bmatrix} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix} \times \left( \begin{bmatrix}
𝑙_1 \cdot cos(𝜃_1) + 𝑙_2 \cdot cos⁡(𝜃_1+𝜃_2) \\ 
𝑙_1 \cdot sen(𝜃_1) + 𝑙_2 \cdot sen(𝜃_1+𝜃_2) \\ 
0 \\
\end{bmatrix}-\begin{bmatrix}
0 \\ 
0 \\ 
0 \\
\end{bmatrix} \right) & \begin{bmatrix}
cos⁡(𝜃_1) & -sen⁡(𝜃_1) & 0 \\ 
sen⁡(𝜃_1) & cos⁡(𝜃_1) & 0 \\ 
0 & 0 & 1 \\
\end{bmatrix} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix} \times \left( \begin{bmatrix}
𝑙_1 \cdot cos(𝜃_1) + 𝑙_2 \cdot cos⁡(𝜃_1+𝜃_2) \\ 
𝑙_1 \cdot sen(𝜃_1) + 𝑙_2 \cdot sen(𝜃_1+𝜃_2) \\ 
0 \\
\end{bmatrix}-\begin{bmatrix}
𝑙_1 \cdot cos(𝜃_1) \\ 
𝑙_1 \cdot sen(𝜃_1) \\ 
0 \\
\end{bmatrix} \right) \\ 
\begin{bmatrix}
1 & 0 & 0 \\ 
0 & 1 & 0\\ 
0 & 0 & 1 \\
\end{bmatrix} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix} & \begin{bmatrix}
cos⁡(𝜃_1) & -sen⁡(𝜃_1) & 0 \\ 
sen⁡(𝜃_1) & cos⁡(𝜃_1) & 0 \\ 
0 & 0 & 1 \\
\end{bmatrix} \cdot \begin{bmatrix}
0 \\ 
0 \\ 
1 \\
\end{bmatrix}\\ 
\end{bmatrix}
$$

$$
𝐽 = \begin{bmatrix}
-𝑙_1sen⁡(𝜃_1)-𝑙_2sen⁡(𝜃_1+𝜃_2) & -𝑙_2sen(𝜃_1+𝜃_2) \\ 
𝑙_1cos(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2) & 𝑙_2cos⁡(𝜃_1+𝜃_2)\\ 
0 & 0\\ 
0 & 0\\ 
0 & 0\\ 
1 & 1\\ 
\end{bmatrix} 
$$

```matlab
%% SIMBÓLICO

clc
clear all
close all

syms theta1 theta2 l1 l2

R00 = eye(3,3)
d00 = zeros(3,1)

%Matriz (DH) 
% MTH T12
TZ0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
RZ0 = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 0; 0 0 0 1]
TX1 = [1 0 0 l1; 0 1 0 0; 0 0 1 0; 0 0 0 1]
RZ1 = [1 0 0 0; 0 cos(0) -sin(0) 0; 0 sin(0) cos(0) 0; 0 0 0 1]
%T01 =  TZ0*RZ0*TX1*RZ1
T01 =  RZ0*TZ0*TX1*RZ1

% MTH T23
TZ1 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
RZ1 = [cos(theta2) -sin(theta2) 0 0; sin(theta2) cos(theta2) 0 0; 0 0 1 0; 0 0 0 1]
TX2 = [1 0 0 l2; 0 1 0 0; 0 0 1 0; 0 0 0 1]
RZ2 = [1 0 0 0; 0 cos(0) -sin(0) 0; 0 sin(0) cos(0) 0; 0 0 0 1]
% T12 =  TZ1*RZ1*TX2*RZ2
T12 =  RZ1*TZ1*TX2*RZ2

T02 = simplify(T01*T12)
d02 = T02(1:3,4)

R01 = RotarZ(theta1)
d01 = T01(1:3,4)

% Jacobianos con las 6 velocidades (vx, vy, vz, wx, wy y wz)
j11 = cross((R00*[0;0;1]),(d02-d00))
j21 = R00*[0;0;1]
j12 = cross((R01*[0;0;1]),(d02-d01))
j22 = R01*[0;0;1]
j = [j11 j12; j21 j22]
```

<h4>Ejemplo</h4>

Si el robot 2R tiene las siguientes características: $l_1=l_2=5cm, 𝜃_1=𝜋/6, 𝜃_2=𝜋/4, \dot{𝜃}_1=𝜋/2, \dot{𝜃}_2=𝜋/2$, cuáles son las velocidades lineales y rotacionales del TCP?

$$
\begin{bmatrix}
\dot{x} \\ 
\dot{y} \\ 
\dot{z} \\
\dot{R}_x \\
\dot{R}_y \\
\dot{R}_z \\ 
\end{bmatrix} = \begin{bmatrix}
-𝑙_1sen⁡(𝜋/6)-𝑙_2sen⁡(5𝜋/12) & -𝑙_2sen(5𝜋/12) \\ 
𝑙_1cos(𝜋/6)+𝑙_2cos⁡(5𝜋/12) & 𝑙_2cos⁡(5𝜋/12)\\ 
0 & 0\\ 
0 & 0\\
0 & 0\\
1 & 1\\ 
\end{bmatrix} \cdot \begin{bmatrix}
𝜋/2 \\ 
𝜋/2 \\ 
\end{bmatrix}
$$

$$
\begin{bmatrix}
\dot{x} \\ 
\dot{y} \\ 
\dot{z} \\
\dot{R}_x \\
\dot{R}_y \\
\dot{R}_z \\ 
\end{bmatrix} = \begin{bmatrix}
-7.3296 & -4.8296 \\ 
5.6242 & 1.2941 \\ 
0 & 0\\
0 & 0\\
0 & 0\\
1 & 1\\ 
\end{bmatrix} \cdot \begin{bmatrix}
1.5708 \\ 
1.5708 \\ 
\end{bmatrix} = \begin{bmatrix}
-19.0997 \\ 
10.8673 \\ 
0 \\
0 \\
0 \\
3.1416 \\
\end{bmatrix}
$$

```matlab
l1 = 5
l2 = 5

theta1 = pi/6
theta2 = pi/4

theta1_dot = pi/2 %rad/s
theta2_dot = pi/2 %rad/s

Jn = [-l2*sin(theta1+theta2)-l1*sin(theta1) -l2*sin(theta1 + theta2);
      l2*cos(theta1+theta2)+l1*cos(theta1)  l2*cos(theta1 + theta2);
      0 0
      0 0
      0 0
      1 1]

Vxyz = Jn*[theta1_dot; theta2_dot]
```

<h3>Jacobiano inverso</h3>

El Jacobiano inverso permite determinar las velocidades de las articulaciones a partir de las velocidades del efector final.

![Jacobiano inverso](image.png)

<h3>Jacobiano analítico inverso</h3>

El Jacobiano analítico inverso consiste en calcular la matriz inversa Jacobiana, la cual se compone de las derivadas parciales de las funciones de los movimientos de las articulaciones con respecto a las variables del efector final.

$$𝐽{^-1} \cdot \begin{bmatrix}
\dot{x} \\ 
\dot{y} \\ 
\dot{z} \\
\dot{R}_x \\
\dot{R}_y \\
\dot{R}_z \\ 
\end{bmatrix} = \begin{bmatrix}
\dot{q}_1 \\ 
⋮ \\ 
\dot{q}_n \\ 
\end{bmatrix}
$$

<!-- 1. A partir de la matriz inversa del Jacobiano analítico directo, sin embargo, se debe tener en cuenta que la matriz $J$ debe ser cuadradada.

$$
𝐽^{-1} = \begin{bmatrix}
\frac{cos⁡(𝜃_1+𝜃_2)}{l_1sen⁡(𝜃_2)} & \frac{sen(𝜃_1+𝜃_2)}{l_1sen⁡(𝜃_2)} \\ 
\frac{l_2cos⁡(𝜃_1+𝜃_2)+l1cos⁡(𝜃_1)}{l_1l_2sen⁡(𝜃_2)} & \frac{l_2sen(𝜃_1+𝜃_2)+l1sen⁡(𝜃_1)}{l_1l_2sen⁡(𝜃_2)} \\  
\end{bmatrix}
$$

```matlab
Js_1 = simplify(inv(Js))
``` -->

Siendo $J^{-1}$ la matriz inversa Jacobiana, expresada por:

$$𝐽^{-1} = \begin{bmatrix}
\frac{𝑑𝑓_{𝑞_1}}{𝑑f_𝑥} & ⋯ & \frac{𝑑𝑓_{𝑞_1}}{𝑑f_{R_z}} \\ 
⋮ & ⋱ & ⋮ \\ 
\frac{𝑑𝑓_{𝑞_n}}{𝑑f_x} & ⋯ & \frac{𝑑𝑓_{𝑞_𝑛}}{𝑑f_{R_𝑧}}\\ 
\end{bmatrix} 
$$

<h3>Robot 2R (planar)</h3>

![2R 2D y 3D](image-1.png)

Teniendo en cuenta las siguientes ecuaciones de la cinemática directa de un robot 2R:

$$𝑥=𝑙_1cos⁡(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2)$$

$$𝑦=𝑙_1sen⁡(𝜃_1)+𝑙_2sen⁡(𝜃_1+𝜃_2)$$

$$𝑧=ℎ_1−ℎ_2$$

Teniendo en cuenta la siguiente matriz Jacobiana directa es posible calcular la matriz Jacobiana inversa:

$$𝐽 = \begin{bmatrix}
-𝑙_1sen⁡(𝜃_1)-𝑙_2sen⁡(𝜃_1+𝜃_2) & -𝑙_2sen(𝜃_1+𝜃_2) \\ 
𝑙_1cos(𝜃_1)+𝑙_2cos⁡(𝜃_1+𝜃_2) & 𝑙_2cos⁡(𝜃_1+𝜃_2)\\ 
\end{bmatrix} 
$$

$$𝐽^{-1} = \begin{bmatrix}
\frac{cos(𝜃_1+𝜃_2)}{l1 \cdot sen(𝜃_2)} & \frac{sen(𝜃_1+𝜃_2)}{l1 \cdot sen(𝜃_2)} \\ 
-\frac{l2 \cdot cos(𝜃_1+𝜃_2) + 𝑙_1 \cdot cos(𝜃_1)}{l1 \cdot l2 \cdot sen(𝜃_2)} & -\frac{l2 \cdot sen(𝜃_1+𝜃_2) + 𝑙_1 \cdot sen(𝜃_1)}{l1 \cdot l2 \cdot sen(𝜃_2)}\\ 
\end{bmatrix} 
$$

```matlab
syms q1 q2 l1 l2

J = [-l2*sin(q1+q2)-l1*sin(q1) -l2*sin(q1+q2);
     l2*cos(q1+q2)+l1*cos(q1) l2*cos(q1+q2)]
J_1 = simplify(inv(J))
```

<h4>Ejemplo</h4>

Si el robot 2R tiene las siguientes características: $l_1=l_2=5cm, 𝜃_1=𝜋/6, 𝜃_2=𝜋/4, \dot{x}=-19.0997 m/s, \dot{y}=10.8673 m/s$, cuáles son las velocidades rotacionales de las articulaciones?

$$\begin{bmatrix}
\frac{cos(5𝜋/12)}{l1 \cdot sen(𝜋/4)} & \frac{sen(5𝜋/12)}{l1 \cdot sen(𝜋/4)} \\ 
-\frac{l2 \cdot cos(5𝜋/12) + 𝑙_1 \cdot cos(𝜋/6)}{l1 \cdot l2 \cdot sen(𝜋/4)} & -\frac{l2 \cdot sen(5𝜋/12) + 𝑙_1 \cdot sen(𝜋/6)}{l1 \cdot l2 \cdot sen(𝜋/4)} \\
\end{bmatrix} \cdot \begin{bmatrix}
-19.0997 \\ 
10.8673 \\ 
\end{bmatrix} = \begin{bmatrix}
\dot{q}_1 \\ 
\dot{q}_2 \\ 
\end{bmatrix}$$

$$\begin{bmatrix}
\dot{q}_1 \\ 
\dot{q}_2 \\  
\end{bmatrix} = \begin{bmatrix}
0.0732 & 0.2732 \\ 
-0.3182 & -0.4146\\
\end{bmatrix} \cdot \begin{bmatrix}
-19.0997 \\ 
10.8673 \\ 
\end{bmatrix} = \begin{bmatrix}
1.5708 \\ 
1.5708 \\ 
\end{bmatrix}$$

```matlab
clear all 
close all
clc

l1 = 5
l2 = 5

theta1 = pi/6
theta2 = pi/4

x_dot = -19.0997
y_dot = 10.8673

J_1 = [(cos(theta1+theta2))/(l1*sin(theta2)) (sin(theta1+theta2))/(l1*sin(theta2));
      -(l2*cos(theta1+theta2)+l1*cos(theta1))/(l1*l2*sin(theta2)) -(l2*sin(theta1+theta2)+l1*sin(theta1))/(l1*l2*sin(theta2))]

Vq = J_1*[x_dot; y_dot]
```

<h3>Trayectorias</h3>

A partir de los Jacobianos es posible calcular las trayectorias del robot, en este caso hasta que las articulaciones lleguen al límite de movimiento.

```matlab
clc
clear all
close all

l1 = 5
l2 = 5

%PeterCorke
R(1) = Link('revolute','d',0,'alpha',0,'a',l1,'offset',0);
R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
Robot = SerialLink(R,'name','Bender')

% Jacobiano
m = 2%Número de velocidades del TCP(vx, vy, vz, wx, wy y wz)
n = 2%Número de articulaciones
J = zeros(m,n)
dt = 10e-2%10ms
Vx = 0;%Vx
Vy = 1;%Vy

i = 1 
q1d(i,1) = 0
q2d(i,1) = 90

q1r(i,1) = deg2rad(q1d(i,1))
q2r(i,1) = deg2rad(q2d(i,1))

while q1d(i,1) <= 180.0 && q1d(i,1) >= 0.0 && q2d(i,1) <= 180.0 && q2d(i,1) >= 0.0

    Robot.teach([q1r(i,1),q2r(i,1)],'scale',1.0,'workspace',[-10 10 -10 10 -10 10]);
%     zlim([-15,30]);
    MTH = Robot.fkine([q1r(i,1),q2r(i,1)]);
    hold on
    plot3(MTH.t(1),MTH.t(2),MTH.t(3),'.r')
    
    J(1,1) = -l2*sin(q1r(i,1)+q2r(i,1))-l1*sin(q1r(i,1));
    J(2,1) = l2*cos(q1r(i,1)+q2r(i,1))+l1*cos(q1r(i,1));
    J(1,2) = -l2*sin(q1r(i,1)+q2r(i,1));
    J(2,2) = l2*cos(q1r(i,1)+q2r(i,1));
    
    J_1 = inv(J);
       
    Vq = J_1*[Vx; Vy];%J/[x_dot; y_dot]
    Vq1(i,1) = Vq(1,1);
    Vq2(i,1) = Vq(2,1);
    
    %Posición angular (Integración)
    q1_increment(i,1) = Vq1(i,1)*dt;
    q2_increment(i,1) = Vq2(i,1)*dt;
    
    q1r(i+1,1) = q1r(i,1) + q1_increment(i,1);
    q2r(i+1,1) = q2r(i,1) + q2_increment(i,1);
    
    q1d(i+1,1) = rad2deg(q1r(i+1,1));
    q2d(i+1,1) = rad2deg(q2r(i+1,1));
    
    i = i + 1;
%     pause(dt)
end
```

De igual manera, es posible realizar la trayectoria durante un tiempo específico

```matlab
clc
clear all
close all

l1 = 5
l2 = 5

%PeterCorke
R(1) = Link('revolute','d',0,'alpha',0,'a',l1,'offset',0);
R(2) = Link('revolute','d',0,'alpha',0,'a',l2,'offset',0);
Robot = SerialLink(R,'name','Bender')

% Jacobiano
m = 2%Número de velocidades del TCP(vx, vy, vz, wx, wy y wz)
n = 2%Número de articulaciones
J = zeros(m,n)
dt = 10e-2%10ms
Vx = 1;%Vx
Vy = 0;%Vy

i = 1 
q1d(i,1) = 0
q2d(i,1) = 90

q1r(i,1) = deg2rad(q1d(i,1))
q2r(i,1) = deg2rad(q2d(i,1))

d = 3%cm
V = sqrt(Vx^2+Vy^2)%cm/s
t = d/V

T = 0;
while T<=t+dt

    Robot.teach([q1r(i,1),q2r(i,1)],'scale',1.0,'workspace',[-10 10 -10 10 -10 10]);
%     zlim([-15,30]);
    MTH = Robot.fkine([q1r(i,1),q2r(i,1)]);
    hold on
    plot3(MTH.t(1),MTH.t(2),MTH.t(3),'.r')
    
    J(1,1) = -l2*sin(q1r(i,1)+q2r(i,1))-l1*sin(q1r(i,1));
    J(2,1) = l2*cos(q1r(i,1)+q2r(i,1))+l1*cos(q1r(i,1));
    J(1,2) = -l2*sin(q1r(i,1)+q2r(i,1));
    J(2,2) = l2*cos(q1r(i,1)+q2r(i,1));
    
    J_1 = inv(J);
       
    Vq = J_1*[Vx; Vy];%J/[x_dot; y_dot]
    Vq1(i,1) = Vq(1,1);
    Vq2(i,1) = Vq(2,1);
    
    %Posición angular (Integración)
    q1_increment(i,1) = Vq1(i,1)*dt;
    q2_increment(i,1) = Vq2(i,1)*dt;
    
    q1r(i+1,1) = q1r(i,1) + q1_increment(i,1);
    q2r(i+1,1) = q2r(i,1) + q2_increment(i,1);
    
    q1d(i+1,1) = rad2deg(q1r(i+1,1));
    q2d(i+1,1) = rad2deg(q2r(i+1,1));
    
    i = i + 1;
    T = T + dt; 
%     pause(dt)
end
```