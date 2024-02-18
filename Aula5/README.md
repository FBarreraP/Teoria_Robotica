<h1>Aula 5</h1>

Esta clase consiste en comprender y aplicar el método DH (Denavit-Hartengerg) como solución de la cinemática directa de robots manipuladores seriales.

<h2>Método DH</h2>

El método Denavit Hartenberg (DH) fue propuesto en 1955 por Denavit y Hartenberg, el cual consiste en un método matricial que permite establecer de manera sistemática un sistema coordenado final con respecto al sistema coordenado de referencia. Para aplicar el método DH se deben tener en cuenta los siguientes pasos:

1. Asignar el sistema coordenado para cada articulación del robot
2. Determinar los parámetros DH (𝜃,𝑑,𝛼,𝑎), los cuales se utilizarán en el Toolbox Peter Corke de Matlab 
3. Obtener la siguiente matriz :

$$𝑇_𝑛^(𝑛−1)=𝑇𝑟𝑎𝑛𝑠_(𝑧_(𝑛−1))(𝑑_𝑛)∙𝑅𝑜𝑡_(𝑧_(𝑛−1))(𝜃_𝑛)∙𝑇𝑟𝑎𝑛𝑠_(𝑥_𝑛)(𝑎_𝑛)∙𝑅𝑜𝑡_(𝑥_𝑛)(𝛼_𝑛)$$

