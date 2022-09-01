
@Echo off

echo.
echo ################################################
echo Welcome to the Opel TouchFlip debloating script. 
echo.
echo This script will remove unnecessary bloatware  
echo from your device.
echo ################################################
echo.

echo.
echo ################################################
echo Please note it is not possible to completely 
echo remove system apps. The packages removed by this 
echo script will still be on your device, however, 
echo will be effectively removed/unable to interact
echo with your phone, data or operate in any capacity
echo ################################################
echo.

pause

echo.
echo ################################################
echo Detecting ADB devices/restarting ADB connections
echo ################################################
echo.

:start

adb kill-server 

adb devices 

:confirmation

echo Please Confirm this is the correct ADB device, and allow USB debugging on the device. 
echo.
set /P c=[Y] to continue, [N] to detect again, [E] to exit. > CON
if /I "%c%" EQU "Y" GOTO :Continue
if /I "%c%" EQU "" GOTO :confirmation
if /I "%c%" EQU "N" GOTO :Start
if /I "%c%" EQU "E" GOTO :skip4

echo.
echo Invalid input. Try again.
echo.


goto :confirmation



:Continue
echo.
echo ###############################################
echo Remove TouchFlip Mediatek/misc Chinese packages
echo ###############################################
echo.

:chinese

set /P c=Do you want to remove unnecessary Mediatek/misc Chinese packages? [Y] to confirm, [N] to skip. 
if /I "%c%" EQU "Y" GOTO :confirm
if /I "%c%" EQU "" GOTO :chinese
if /I "%c%" EQU "N" GOTO :skip

echo.
echo Invalid input. Try again.
echo.

goto :chinese


:confirm

echo.
echo Removing com.mediatek.gba
adb shell pm uninstall -k --user 0 com.mediatek.gba
echo.
echo Removing com.mediatek.location.lppe.main
adb shell pm uninstall -k --user 0 com.mediatek.location.lppe.main
echo.
echo Removing com.mediatek.ygps
adb shell pm uninstall -k --user 0 com.mediatek.ygps
echo.
echo Removing com.mediatek.simprocessor
adb shell pm uninstall -k --user 0 com.mediatek.simprocessor
echo.
echo Removing com.mediatek.engineermode
adb shell pm uninstall -k --user 0 com.mediatek.engineermode
echo.
echo Removing com.mediatek.omacp
adb shell pm uninstall -k --user 0 com.mediatek.omacp
echo.
echo Removing com.mediatek.emcamera
adb shell pm uninstall -k --user 0 com.mediatek.emcamera
echo.
echo Removing com.mediatek.bluetooth.dtt
adb shell pm uninstall -k --user 0 com.mediatek.bluetooth.dtt
echo.
echo Removing com.mediatek.mdmlsample
adb shell pm uninstall -k --user 0 com.mediatek.mdmlsample
echo.
echo Removing com.mediatek.providers.drm
adb shell pm uninstall -k --user 0 com.mediatek.providers.drm
echo.
echo Removing com.mediatek.batterywarning
adb shell pm uninstall -k --user 0 com.mediatek.batterywarning
echo.
echo Removing com.mediatek
adb shell pm uninstall -k --user 0 com.mediatek
echo.
echo Removing com.mediatek.nlpservice
adb shell pm uninstall -k --user 0 com.mediatek.nlpservice
echo.
echo Removing com.mediatek.thermalmanager
adb shell pm uninstall -k --user 0 com.mediatek.thermalmanager
echo.
echo Removing com.mediatek.callrecorder
adb shell pm uninstall -k --user 0 com.mediatek.callrecorder
echo.
echo Removing com.mediatek.webview
adb shell pm uninstall -k --user 0 com.mediatek.webview
echo.
echo Removing com.mediatek.factorymode
adb shell pm uninstall -k --user 0 com.mediatek.factorymode
echo.
echo Removing com.mediatek.mdmconfig
adb shell pm uninstall -k --user 0 com.mediatek.mdmconfig
echo.
echo Removing com.mediatek.lbs.em2.ui
adb shell pm uninstall -k --user 0 com.mediatek.lbs.em2.ui
echo.
echo Removing com.mediatek.location.mtknlp
adb shell pm uninstall -k --user 0 com.mediatek.location.mtknlp
echo.
echo Removing com.mediatek.filemanager
adb shell pm uninstall -k --user 0 com.mediatek.filemanager
echo.
echo Removing com.mediatek.mtklogger
adb shell pm uninstall -k --user 0 com.mediatek.mtklogger
echo.
echo Removing com.mediatek.sensorhub.ui
adb shell pm uninstall -k --user 0 com.mediatek.sensorhub.ui
echo.
echo Removing com.mediatek.mtklogger.proxy
adb shell pm uninstall -k --user 0 com.mediatek.mtklogger.proxy
echo.
echo Removing com.iflytek.speechcloud
adb shell pm uninstall -k --user 0 com.iflytek.speechcloud

:wifi

echo.
echo Wifi calling is only possible on this device by keeping a Mediatek package.
echo Removing this package will remove this feature from the phone.
echo.
set /P c=Do you want wifi calling? Y/N 
if /I "%c%" EQU "Y" GOTO :skip2
if /I "%c%" EQU "" GOTO :wifi
if /I "%c%" EQU "N" GOTO :confirm2

echo.
echo Invalid input. Try again.
echo.

goto :wifi

:confirm2

echo.
echo Removing com.mediatek.wfo.impl
adb shell pm uninstall -k --user 0 com.mediatek.wfo.impl

:skip2

echo.
echo ###############################################################################
echo Note- com.mediatek.ims will not be removed as its removal will break the system
echo ###############################################################################
echo.

pause

:skip

echo.
echo #############################
echo Remove TouchFlip Facebook app
echo #############################
echo.

:facebook

set /P c=Do you want to remove the Facebook app? [Y] to confirm, [N] to skip. 
if /I "%c%" EQU "Y" GOTO :confirm3
if /I "%c%" EQU "" GOTO :facebook
if /I "%c%" EQU "N" GOTO :skip3

echo.
echo Invalid input. Try again.
echo.

goto :facebook

:confirm3

echo.
echo Removing com.facebook.lite
adb shell pm uninstall -k --user 0 com.facebook.lite
echo.

pause

:skip3

echo.
echo #############################
echo Remove TouchFlip Whatsapp app
echo #############################
echo.

:whatsapp

set /P c=Do you want to remove the Whatsapp app? [Y] to confirm, [N] to skip. 
if /I "%c%" EQU "Y" GOTO :confirm4
if /I "%c%" EQU "" GOTO :whatsapp
if /I "%c%" EQU "N" GOTO :skip4

echo.
echo Invalid input. Try again.
echo.

goto :whatsapp

:confirm4

echo.
echo Removing com.whatsapp
adb shell pm uninstall -k --user 0 com.whatsapp
echo.

pause

:skip4

echo.
echo #################################
echo Remove TouchFlip Android packages
echo #################################
echo.

:android

set /P c=Do you want to remove unnecessary Android packages? [Y] to confirm, [N] to skip. 
if /I "%c%" EQU "Y" GOTO :confirm5
if /I "%c%" EQU "" GOTO :android
if /I "%c%" EQU "N" GOTO :skip5

echo.
echo Invalid input. Try again.
echo.

goto :android

:confirm5

:skip5

echo.
echo Feature not yet available
echo.

pause

echo.
echo #######################################
echo Opel TouchFlip debloat process complete
echo #######################################
echo.

echo Press 'spacebar' to exit command prompt. Your current ADB session will remain active.
echo.
pause

