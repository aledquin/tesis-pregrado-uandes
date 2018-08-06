# README
Archivos utilizados para el desarrollo de la tesis de pregrado de Alvaro Quintana en la Universidad de Los Andes de Chile para obtener el titulo de Ingeniero civil Electrico.

El archivo Dispositivo.ino es el código a utilizar en el Arduino Uno R3. Uno puede modificar como se guarda la información. Evitar modificar el resto del código.
El archivo Lyaprosen.m posee el código para calcular el exponente de Lyapunov y LLE de una curva. No tocar este código. Lector es un código que revisa y reconoce cada recorrido por los estandares entregados en el archivo de Dispositivo.ino
En Lector modificar solo el nombre y ubicación de la base de datos.
En la carpeta de entrenamiento (Training) se encuentra la red neuronal ya preparada. El código de la red neuronal no es necesario.
Se pueden realizar pruebas utilizando el archivo de predict_data.py Este archivo solo modificar los parámetros de la persona. Este debe tener un tamaño de 114 datos. 
