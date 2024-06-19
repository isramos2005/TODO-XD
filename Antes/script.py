import os

url = f"https://orion.novanetgroup.com/Reportes/ReportesClientesFinalesInstaladosGlobalPDFExportart?EnviarCorreo=1"

os.system(f'start chrome.exe "{url}"')
