@echo off
set "search=%~1"
set "replace=%~2"
set "textfile=%~3"
set "newfile=%temp%\tmpFile.txt"
set Src="%temp%\TempVBS.vbs"
(  echo Set oFSO = CreateObject("Scripting.FileSystemObject"^)
   echo Set oInput = oFSO.OpenTextFile(WScript.Arguments(0^), 1^)
   echo sData = Replace(oInput.ReadAll, "%search%", "%replace%"^)
   echo Set oOutput = oFSO.CreateTextFile(WScript.Arguments(1^), True^)
   echo oOutput.Write sData
   echo oInput.Close
   echo oOutput.Close) > %Src%
cscript //nologo %Src% %textfile% %newfile%
move /Y %newfile% %textfile%
