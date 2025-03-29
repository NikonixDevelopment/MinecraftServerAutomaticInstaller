@echo off
echo **********************************************************************
echo **********************************************************************
echo Starting Minecraft Server...
echo **********************************************************************
echo **********************************************************************

:: Ask for the amount of memory to allocate to the server (in MB)
set /p memory="Enter the amount of memory to allocate (in MB): "

:: Validate memory input
if not "%memory%"=="" (
    if "%memory%" lss 1024 (
        echo You must allocate at least 1024MB (1GB) of memory. Please try again.
        echo **********************************************************************
        exit /b
    )
) else (
    echo Invalid input. Please enter a valid number for memory allocation.
    echo **********************************************************************
    exit /b
)

:: Define the path to your Minecraft server
set server_path=%USERPROFILE%\MinecraftServer\%1

:: Check if the server folder exists
if not exist "%server_path%" (
    echo The folder "%server_path%" does not exist. Please check the folder name.
    echo **********************************************************************
    exit /b
)

:: Change to the Minecraft server directory
cd /d "%server_path%"

:: Check if server.jar exists in the directory
if not exist "server.jar" (
    echo server.jar not found in "%server_path%. Please ensure the server JAR file is present.
    echo **********************************************************************
    exit /b
)

:: Start the Minecraft server with user-specified memory
echo Running Minecraft server with %memory%MB of RAM...
java -Xmx%memory%M -Xms%memory%M -jar server.jar nogui

echo **********************************************************************
echo **********************************************************************
echo Server stopped or crashed. Restarting...
echo **********************************************************************
pause
