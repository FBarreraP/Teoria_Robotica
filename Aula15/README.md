<h1>Aula 15</h1>

Esta clase consiste en comprender y analizar los Jacobianos.

<h2>Jacobianos</h2>

Los jacobianos permiten obtener las velocidades de las articulaciones a partir de las velocidades del TCP y viceversa, además, es posible realizar el análisis a través de jacobiano análitico y geométrico.

![Jacobianos](image.png)

<h3>Jacobiano analítico</h3>

Los jacobianos analíticos tanto el directo como el inverso con solucionados a partir de derivadas parciales de las funciones.

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

Teniendo en cuenta las siguientes ecuaciones de la cinemática directa de un robot 2R (aulas 4 y 5):

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

<h4>Ejemplo</h4>

Si el robot 2R tiene las siguientes características: $𝜃_1=𝜋/2, 𝜃_2=𝜋/2, \dot{𝜃}_1=𝜋/6, \dot{𝜃}_2=𝜋/4$, cuáles son las velocidades lineales del TCP?

```matlab
l1 = 5
l2 = 5

theta1 = pi/6
theta2 = pi/4

theta1_dot = pi/2 %rad/s
theta2_dot = pi/2 %rad/s

Jn = [-l2*sin(theta1+theta2)-l1*sin(theta1) -l2*sin(theta1 + theta2);
      l2*cos(theta1+theta2)+l1*cos(theta1)  l2*cos(theta1 + theta2);
      0 0]

Vxyz = Jn*[theta1_dot; theta2_dot]
```