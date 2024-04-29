<h1>Aula 14</h1>

Esta clase consiste en comprender la cinemática directa e inversa de la plataforma omnidireccional de 3 ruedas y aplicarlas en análisis de recorridos por transiciones y por trayectorias.

<h2>Plataforma omnidireccional de 3 ruedas</h2>

Una plataforma omnidireccional (holonómica) no tiene restricciones de movimientos, es decir, puede desplazarse hacia cualquier dirección y sentido sin girar.

![Omnidireccional 3 ruedas](image.png)

Fuente: Introduction to Autonomous Mobile Robots. Roland Siegwart and Illah R. Nourbakhsh. 2004

$$ \begin{bmatrix}
𝑉_𝑝𝑥\\ 
𝑉_𝑝𝑦\\ 
𝜔_𝑝\\ 
\end{bmatrix} = \begin{bmatrix}
-1 & 1/2 & 1/2\\ 
0 & -\sqrt(3/2) & \sqrt(3/2)\\ 
1/d & 1/d & 1/d \\ 
\end{bmatrix} \cdot \begin{bmatrix}
𝑉_1\\ 
𝑉_2\\ 
V_3\\ 
\end{bmatrix}$$
