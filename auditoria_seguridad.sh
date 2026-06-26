#!/bin/bash
# Script de auditoría básica de seguridad

REPORTE="reporte_auditoria.txt"
FECHA=$(date "+%d/%m/%Y %H:%M:%S")

echo "=======================================" > $REPORTE
echo " REPORTE DE AUDITORÍA DE SEGURIDAD"    >> $REPORTE
echo " Fecha: $FECHA"                         >> $REPORTE
echo "=======================================" >> $REPORTE
echo ""                                        >> $REPORTE

# --- BLOQUE 1: Usuarios sin contraseña ---
echo "[1] USUARIOS SIN CONTRASEÑA:" >> $REPORTE
usuarios_sin_pass=$(awk -F: '($2 == "" || $2 == "!") {print $1}' /etc/shadow 2>/dev/null)
if [ -z "$usuarios_sin_pass" ]; then
    echo "OK - No se encontraron usuarios sin contraseña." >> $REPORTE
else
    echo "ALERTA - Usuarios sin contraseña: $usuarios_sin_pass" >> $REPORTE
fi
echo "" >> $REPORTE

# --- BLOQUE 2: Permisos de archivos críticos ---
echo "[2] PERMISOS DE ARCHIVOS CRÍTICOS:" >> $REPORTE
perms_passwd=$(stat -c "%a" /etc/passwd)
if [ "$perms_passwd" = "644" ]; then
    echo "OK - /etc/passwd tiene permisos correctos (644)" >> $REPORTE
else
    echo "ALERTA - /etc/passwd tiene permisos: $perms_passwd (esperado: 644)" >> $REPORTE
fi

perms_shadow=$(stat -c "%a" /etc/shadow)
if [ "$perms_shadow" = "640" ] || [ "$perms_shadow" = "000" ]; then
    echo "OK - /etc/shadow tiene permisos correctos ($perms_shadow)" >> $REPORTE
else
    echo "ALERTA - /etc/shadow tiene permisos: $perms_shadow (esperado: 640)" >> $REPORTE
fi
echo "" >> $REPORTE

# --- BLOQUE 3: Intentos de login fallidos ---
echo "[3] ÚLTIMOS INTENTOS DE LOGIN FALLIDOS:" >> $REPORTE
if [ -f /var/log/auth.log ]; then
    intentos=$(grep "Failed password" /var/log/auth.log | tail -5)
    if [ -z "$intentos" ]; then
        echo "OK - No se encontraron intentos fallidos recientes." >> $REPORTE
    else
        echo "$intentos" >> $REPORTE
    fi
else
    echo "INFO - Archivo auth.log no encontrado en este entorno." >> $REPORTE
fi
echo "" >> $REPORTE

echo "=======================================" >> $REPORTE
echo " Auditoría finalizada."                  >> $REPORTE
echo "=======================================" >> $REPORTE

echo ""
echo "Auditoría completada. Ver: $REPORTE"