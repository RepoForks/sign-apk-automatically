@echo off
set mypath=%~dp0
set /p apk=Enter apk name (in this folder, with the .apk extension) :
set apkpath=%mypath%%apk%
set /p alias=Enter APK alias :

REM !!!REPLACE THIS PATH WITH THE PATH TO YOUR KEYTOOL!!!
cd C:\Program Files\Java\jdk1.8.0_65\jre\bin
keytool -genkey -v -keystore %alias%.keystore -alias %alias% -keyalg RSA -keysize 2048 -validity 10000
move %alias%.keystore %mypath%
set keypath=%mypath%%alias%.keystore

REM !!!REPLACE THIS PATH WITH THE PATH TO YOUR JARSIGNER!!!
cd C:\Program Files\Java\jdk1.8.0_65\bin
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %keypath% %apkpath% %alias%

REM !!!REPLACE THIS PATH WITH THE PATH TO YOUR ZIPALIGN TOOL!!!
cd C:\Users\linus_000\AppData\Local\Android\sdk\build-tools\26.0.0
zipalign -v 4 %apkpath% %mypath%%alias%-signed.apk
pause