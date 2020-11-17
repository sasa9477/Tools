
@@echo off

rem パス値
set settingsDirectoryPath=c:\users\sota\appdata\local\microsoft\visualstudio\16.0_8308d89f\settings\
set currentSettingFileName=CurrentSettings.vssettings
set darkColorSettingFileName=DarkColorSettings.vssettings
set whiteColorSettingFileName=WhiteColorSettings.vssettings
set currentModeFile=CurrentMode.txt

rem 変数
set darkThemeName=DarkTheme
set whiteThemeName=WhiteTheme
set currentMode=

call :VerifyVisualStudioRunning

if %ERRORLEVEL% neq 0 (
    exit /b
)

call :ReadCurrentModeFile

set hour=%time:~0,2%

if %hour% lss 6 (
    call :ChangeDarkColorTheme
) else if %hour% gtr 17 (
    call :ChangeDarkColorTheme
) else (
    call :ChangeWhiteColorTheme
)

exit /b

rem VisualStudioが起動中か確認
:VerifyVisualStudioRunning
set visualStudioImageName=devenv.exe
set taskName=

for /f %%i in ('tasklist /fi "imagename eq %visualStudioImageName%"') do @set taskName=%%i

if %taskName% == %visualStudioImageName% (
    call :Log "Operation cancelled. Visual Studio is Running. ImageName is %taskName%."
    exit 1 /b
)
exit /b

rem VisualStudio 環境設定をダークカラーテーマに変更
:ChangeDarkColorTheme
if %currentMode% == %whiteThemeName% (
    copy /Y %settingsDirectoryPath%%currentSettingFileName% %settingsDirectoryPath%%whiteColorSettingFileName%
    call :Log "Escape current setting to white color setting file."
)
if not %currentMode% == %darkThemeName% (
    copy /Y %settingsDirectoryPath%%darkColorSettingFileName% %settingsDirectoryPath%%currentSettingFileName%
    call :Log "Change dark color theme."

    set currentMode=%darkThemeName%
    call :WriteCurrentModeFile
)
exit /b

rem VisualStudio 環境設定をホワイトカラーテーマに変更
:ChangeWhiteColorTheme
if %currentMode% == %darkThemeName% (
    copy /Y %settingsDirectoryPath%%currentSettingFileName% %settingsDirectoryPath%%darkColorSettingFileName%
    call :Log "Escape current setting to dark color setting file."
)
if not %currentMode% == %whiteThemeName% (
    copy /Y %settingsDirectoryPath%%whiteColorSettingFileName% %settingsDirectoryPath%%currentSettingFileName%
    call :Log "Change white color theme."

    set currentMode=%whiteThemeName%
    call :WriteCurrentModeFile
)
exit /b

rem ファイル読み込み
:ReadCurrentModeFile
FOR /F "tokens=*" %%i IN (%settingsDirectoryPath%%currentModeFile%) DO @set currentMode=%%i&goto :Exit_FOR
:Exit_FOR
exit /b

rem ファイル書き込み
:WriteCurrentModeFile
echo %currentMode% > %settingsDirectoryPath%%currentModeFile%
exit /b

rem ログ出力
:Log
set logPath=C:\Users\sota\Documents\ChangeColorThemeSetting.log
echo %date%%time% %~1 >> %logPath%
exit /b
