<#
.SYNOPSIS
   Deinstallation von IP-Druckern
 
.DESCRIPTION
   Dieses Script dient der Entfernung von IP-Druckern, die über das Script
   "Install-IPPrinter.ps1" installiert wurden.
   ---
   Installationsbefehl in Intune (Parameter entsprechend befüllen):
   powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File Remove-IPPrinter.ps1 -PortIPAddress "" -PrinterName ""
 
.EXAMPLE
   Remove-IPPrinter.ps1 -PortIPAddress "192.168.1.10" -PrinterName "HP Drucker Grossraumbüro"
 
.PARAMETER PortIPAddress
   Die IP-Adresse des Druckers.

.PARAMETER PrinterName
   Der Name des zu entfernenden Druckers.

.NOTES
  Version:        1.0
  Author:         Simon
  Creation Date:  2023-10-15
  Purpose/Change: Creation
#>

#################
#---Parameter---#
#################
Param(
    [Parameter(Mandatory=$True)]
    [string]$PortIPAddress,

    [Parameter(Mandatory=$True)]
    [string]$PrinterName
)

#################
#---Execution---#
#################

#Drucker entfernen
Remove-Printer $PrinterName

#abwarten, bevor der Port entfernt wird
Start-Sleep -Seconds 180

#Port entfernen
Remove-PrinterPort -Name "IP_$PortIPAddress"
