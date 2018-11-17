$savename = "Island of Steeve"

$sourceRoot = "C:\Users\Darkrai\AppData\Roaming\saves\" + $savename
$destinationRoot = "C:\Users\Darkrai\Backup\Game Backups\Minecraft Backups"
$newdestinationRoot = $destinationRoot + "\" + $savename
# $newdestname = $destinationRoot + "\" + $savename + "_" + $(get-date -f yyyy_MM_dd_hh_mm_ss)
$newdestname = $destinationRoot + "\" + $savename

if(Test-Path $sourceRoot)
{
  if(Test-Path $newdestinationRoot)
  {
    $shell = New-Object -ComObject 'Shell.Application'
    $shell.NameSpace(0).ParseName($newdestinationRoot).InvokeVerb('delete') # sends to Recycle bin instead of deleting
    # Remove-Item $newdestinationRoot -Recurse # permanently deletes
  }

  if(Test-Path $destinationRoot)
  {
    Write-Host "Please wait, Minekwaft saves are copying now.  The console window will close when finished." -ForegroundColor Cyan
    Copy-Item -Path $sourceRoot -Recurse -Destination $destinationRoot -Container
    # Rename-Item $newdestinationRoot $newdestname # because some little DERPBOB doesn't want his folders to be date stamped!
  }
  else
  {
    Write-Host "The destination " $destinationRoot "does not exist!  Cannot make Minecraft backup!" -ForegroundColor Red
    Read-Host "Please press enter to quit"
  }
}
else
{
  Write-Host "The source folder does not exist!  Cannot make a copy of" $sourceRoot -ForegroundColor Red
  Read-Host "Please press enter to quit"
}