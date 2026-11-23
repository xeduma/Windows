# =================================================================
# Configuration
# =================================================================
$PrinterName = "manuel_NTEPRN010_local"
$PrinterIP   = "10.172.58.154"
$DriverPath  = "C:\Users\$user\Downloads\iPF770Series-Drv-Win64-491\64bit\Driver"
$DriverINF   = "6WW77JM.inf"
$PrinterDriver = "Canon iPF770"

$PortName    = "NTEPRN010_IP_$PrinterIP"

# =================================================================
# Installation du pilote
# =================================================================

Write-Host "======================================" -ForegroundColor Green
Write-Host "Installation du pilote " -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Green

$user = Read-Host "-------Entrez le nom d'utilisateur, sur lequel vous voulez installer l'imprimante-------"
Write-Host "Nom d'utilisateur : $user"



Set-Location $DriverPath

pnputil /add-driver $DriverINF /install
Add-PrinterDriver -Name $PrinterDriver


# =================================================================
# Recherche du pilote installé
# =================================================================

$DriverName = Get-PrinterDriver |
Where-Object {
    $_.Name -match $PrinterDriver
} |
Select-Object -First 1 -ExpandProperty Name

if (-not $DriverName)
{
    Write-Host "ERREUR : Pilote $PrinterDriver introuvable." -ForegroundColor Red

    Write-Host "Pilotes détectés :" -ForegroundColor Yellow
    Get-PrinterDriver | Where-Object Name -match $PrinterDriver

    exit 1
}

Write-Host "Pilote détecté : $DriverName" -ForegroundColor Green

# =================================================================
# Suppression de l'imprimante existante
# =================================================================

$ExistingPrinter = Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue

if ($ExistingPrinter)
{
    Write-Host "L'imprimante existe déjà. Suppression..." -ForegroundColor Yellow

    Remove-Printer -Name $PrinterName

    Start-Sleep -Seconds 3
}
else
{
    Write-Host "Aucune imprimante existante trouvée." -ForegroundColor DarkGray
}

# =================================================================
# Suppression du port existant
# =================================================================

$ExistingPort = Get-PrinterPort -Name $PortName -ErrorAction SilentlyContinue

if ($ExistingPort)
{
    Write-Host "Le port existe déjà. Suppression..." -ForegroundColor Yellow

    Remove-PrinterPort -Name $PortName

    Start-Sleep -Seconds 3
}
else
{
    Write-Host "Aucun port existant trouvé." -ForegroundColor DarkGray
}

# =================================================================
# Création du port TCP/IP
# =================================================================

Write-Host "Création du port $PortName ..." -ForegroundColor Cyan

Add-PrinterPort `
    -Name $PortName `
    -PrinterHostAddress $PrinterIP

# =================================================================
# Création de l'imprimante
# =================================================================

Write-Host "Création de l'imprimante..." -ForegroundColor Cyan

Add-Printer `
    -Name $PrinterName `
    -DriverName $DriverName `
    -PortName $PortName

# =================================================================
# Vérification finale
# =================================================================

$PrinterCheck = Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue

if ($PrinterCheck)
{
    Write-Host "======================================" -ForegroundColor Green
    Write-Host "Imprimante ajoutée avec succès" -ForegroundColor Green
    Write-Host "Nom      : $PrinterName" -ForegroundColor White
    Write-Host "IP        : $PrinterIP" -ForegroundColor White
    Write-Host "Port      : $PortName" -ForegroundColor White
    Write-Host "Pilote    : $DriverName" -ForegroundColor White
    Write-Host "======================================" -ForegroundColor Green
}
else
{
    Write-Host "ERREUR : L'imprimante n'a pas pu être créée." -ForegroundColor Red
    exit 1
}

Set-Location "$env:USERPROFILE\Downloads"
