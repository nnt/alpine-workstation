<#
If you get this error:
"... cannot be loaded because running scripts is disabled on this system. For more information, see about_Execution_Policies ..."

Run this in a privileged PowerShell session:
set-executionpolicy remotesigned

References:
https://www.faqforge.com/windows/windows-powershell-running-scripts-is-disabled-on-this-system/
https://www.robertborges.us/2014/07/virtualization/export-a-running-virtual-machine-using-powershell/
https://www.vagrantup.com/docs/hyperv/boxes.html#packaging-the-box
#>

$VM_NAME = Get-Content -Path $PSScriptRoot\..\configs\vmname
$BACKUP_DIR = "$env:USERPROFILE\Documents\Vagrant-backups"
$EXPORT_DATE = Get-Date -Format 'yyyyMMddTHHmmssffffZ'
$EXPORT_PATH = "$BACKUP_DIR\$($VM_NAME)_$EXPORT_DATE"
$BOX_NAME = "$($VM_NAME)_$EXPORT_DATE.box" 

Export-VM -Name $VM_NAME -Path $EXPORT_PATH
rm $EXPORT_PATH\$VM_NAME\Snapshots
cp $PSScriptRoot\..\configs\metadata.json $EXPORT_PATH\$VM_NAME\
cd $EXPORT_PATH\$VM_NAME\
tar cvzf $BOX_NAME *
mv $BOX_NAME $BACKUP_DIR\
cd $BACKUP_DIR
rm $EXPORT_PATH -Recurse -Confirm:$false