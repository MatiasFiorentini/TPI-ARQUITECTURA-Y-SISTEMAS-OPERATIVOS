# TP Integrador Seguridad en Linux

## Auditoría Básica de Seguridad en Linux mediante Script Bash

**Descripción del proyecto:** Script desarrollado en lenguaje Bash que automatiza una auditoría básica de seguridad en sistemas operativos Linux. El script verifica si existen usuarios sin contraseña en el sistema, comprueba que los archivos críticos /etc/passwd y /etc/shadow tengan los permisos correctos, y analiza el log de autenticación en busca de intentos de login fallidos. Al finalizar genera un reporte en texto plano con los resultados de cada verificación.

## Datos de la Universidad y la cátedra

* Universidad: Universidad Tecnológica Nacional (UTN)
* Carrera: Tecnicatura Universitaria en Programación a Distancia
* Materia: Arquitectura y Sistemas Operativos
* Datos del profesor: Gustavo Sturtz

## Integrante

* Matías Fiorentini (trabajo realizado de forma individual)
* Comisión: 13

## Instrucciones de ejecución

* Requisito: Sistema operativo Linux o entorno Linux online (se utilizó Ubuntu 25 mediante DistroSea: https://distrosea.com)
* git clone https://github.com/MatiasFiorentini/TPI-ARQUITECTURA-Y-SISTEMAS-OPERATIVOS.git
* cd TPI-ARQUITECTURA-Y-SISTEMAS-OPERATIVOS
* chmod +x auditoria_seguridad.sh
* sudo ./auditoria_seguridad.sh
* cat reporte_auditoria.txt

## Archivos del repositorio

* auditoria_seguridad.sh — Script principal de auditoría
* TP_Auditoria_Seguridad_Linux.pdf — Informe completo del trabajo

## Links a video y repositorio GitHub

* Repositorio: https://github.com/MatiasFiorentini/TPI-ARQUITECTURA-Y-SISTEMAS-OPERATIVOS
* Video explicativo: https://www.youtube.com/watch?v=hVXBnw7wg00
