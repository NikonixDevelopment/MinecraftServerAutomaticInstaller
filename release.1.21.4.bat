@echo off
echo **********************************************************************
echo **********************************************************************
echo Minecraft Server Automatic Installer for Windows by NikonixDevelopment
echo **********************************************************************
echo **********************************************************************
timeout /t 1 /nobreak
echo *
echo Enter the name of the folder. Remember: Letters and Numbers only. No special signs or spaces.
:: Ask for the server name input
set /p server_name="Folder Name: "
echo **********************************************************************
echo **********************************************************************
echo Updating Java to the latest version...
timeout /t 1 /nobreak

:: Download Java installer (always update to the latest version/version for this software)
set java_url=https://javadl.sun.com/webapps/download/AutoDL?BundleId=107944
set java_installer=%USERPROFILE%\Downloads\jdk-installer.exe

echo Downloading Java installer to %java_installer%...
bitsadmin /transfer "DownloadJava" %java_url% %java_installer%

:: Check if the download was successful
if exist "%java_installer%" (
    echo **********************************************************************
    echo Java installer downloaded. Running installer...
    echo **********************************************************************
    
    :: Run the Java installer
    start /wait %java_installer%

    echo **********************************************************************
    echo Java installation complete!
    echo **********************************************************************
) else (
    echo **********************************************************************
    echo Failed to download Java installer. Please try again.
    echo **********************************************************************
    exit /b
)

timeout /t 1 /nobreak
echo Downloading server.jar...
timeout /t 1 /nobreak
echo Downloading server.jar..
timeout /t 1 /nobreak
echo Downloading server.jar...
timeout /t 3 /nobreak
:: Define the download URL for the Minecraft server jar
set download_url=https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar

:: Define the destination path in the user folder
set dest_path=%USERPROFILE%\MinecraftServer\%server_name%

:: Create necessary folders if they don't exist
if not exist "%dest_path%" (
    echo Creating directory: %dest_path%
    mkdir "%dest_path%"
)

:: Define the output file path
set output_file=%dest_path%\server.jar

:: Show the process and prevent clearing history
echo Downloading server.jar to %output_file%...
bitsadmin /transfer "DownloadMinecraftServer" %download_url% %output_file%

:: Check if the download was successful
if exist "%output_file%" (
    echo **********************************************************************
    echo **********************************************************************
    echo Download complete!
    echo **********************************************************************
    echo **********************************************************************

    :: Run the Minecraft server
    echo Running Minecraft server...
    cd /d "%dest_path%"
    java -Xmx1024M -Xms1024M -jar server.jar nogui

    echo **********************************************************************
    echo **********************************************************************
    echo INSTALLATION IS COMPLETE
    echo **********************************************************************
    echo **********************************************************************
) else (
    echo **********************************************************************
    echo **********************************************************************
    echo Download failed. Please try again.
    echo **********************************************************************
    echo **********************************************************************
)

:: Keep the script running to allow visibility
pause
