<h1>Aula 15/h1>

Esta clase consiste en comprender y analizar los Jacobianos.

<h2>Jacobianos</h2>

Los jacobianos permiten obtener las velocidades de las articulaciones a partir de las velocidades del TCP y viceversa, además, es posible realizar el análisis a través de jacobiano geométrico y análitico.

![Jacobianos](image.png)

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

$$
\begin{bmatrix}
[𝐶𝜃_3 & -𝑆𝜃_3 & 0 \\ 
𝑆𝜃_3 & 𝐶𝜃_3 & 0 \\ 
0 & 0 & 1]\\ 
\end{bmatrix} 
$$