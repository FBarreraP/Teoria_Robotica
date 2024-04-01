<h1>Aula 15</h1>

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

Siendo $𝐽$ la matriz Jacobiana, expresada por:

$$
𝐽 = \begin{bmatrix}
\frac{𝑑𝑓_𝑥}{𝑑𝑞_1} & ⋯ & \frac{𝑑𝑓_𝑥}{𝑑𝑞_𝑛} \\ 
⋮ & ⋱ & ⋮ \\ 
\frac{𝑑𝑓_{𝑅_𝑧}}{𝑑𝑞_1} & ⋯ & \frac{𝑑𝑓_{𝑅_𝑧}}{𝑑𝑞_𝑛}\\ 
\end{bmatrix} 
$$

<h3>Ejemplo 2R</h3>

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

