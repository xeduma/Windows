# Liaison AD
https://teams.microsoft.com/l/message/19:79edd6a0-f62f-4a52-ad34-a2bf2d880cff_be4f91e6-e032-4fbc-a537-c84192da4b0d@unq.gbl.spaces/1727332822238?context=%7B%22contextType%22%3A%22chat%22%7D

## si la cession et ouverte
déconnecter internet    (wifi et câble)
connecter le compte normalement              cession déjà ouverte
anydesk, VNC
powershell en admin
```
Test-ComputerSecureChannel
```

### si false    connexion ne fonctionne pas
```
Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
```


##  avec USB
créer une usb de boot windows media tools

sinon : faire windows > redémarre + MAJ
dépannage > Invité de commande 

```
C:
Cd Windows\Systeme32
Copy Utilman.exe Utilman.exe.old
Copy cmd.exe Utilman.exe                                   OUI
```

Continuer > L’ordinateur redémarre

```
Net user sam s@m123456789 /add
Net localgroup Administrateurs sam /add
```

```
Del Utilman.exe
Ren Utilman.exe.old Utilman.exe
```


## windows 11
```
Manage-bde -unlock C : -RecoveryPassword 4564-4564-4564-4564
C:
Cd Windows\Systeme32
Copy Narrator.exe Narrator.exe.old
copy cmd.exe Narrator.exe
```
