@echo off	
set mypath=%~dp0
set /p apk=Enter apk name (in this folder, with the .apk extension) :
set /p keystore=Enter keystore name (in this folder, with .keystore extension) :
set apkpath=%mypath%%apk%
set keystorepath=%mypath%%keystore%
set /p alias=Enter APK alias :

REM !!!REPLACE THIS PATH WITH THE PATH TO YOUR JARSIGNER!!!
cd C:\Program Files\Java\jdk1.8.0_65\bin
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %keystorepath% %apkpath% %alias%

REM !!!REPLACE THIS PATH WITH THE PATH TO YOUR ZIPALIGN TOOL!!!
cd C:\Users\linus_000\AppData\Local\Android\sdk\build-tools\26.0.0
zipalign -v 4 %apkpath% %mypath%%alias%-signed.apk
pause