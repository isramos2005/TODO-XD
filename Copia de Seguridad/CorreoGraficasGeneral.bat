@echo off
setlocal

:: Hacer la solicitud POST usando curl
curl -X POST "https://api.novanetgroup.com/api/Novanet/OrionCorreo/Orion_Correo" -H  "accept: */*" -H  "Content-Type: application/json" -d "[\"erick@miprestadito.com\",\"angel.bautista@miprestadito.com\"]"


endlocal
