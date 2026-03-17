@echo off
setlocal
echo ========================================
echo   Push SU Space Booking to GitHub
echo ========================================
echo.

:: Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo Please download and install Git from: https://git-scm.com/downloads
    echo After installing, restart this script.
    pause
    exit /b
)

:: Get GitHub Repo URL
set /p REPO_URL="Enter your GitHub Repository URL (e.g., https://github.com/user/repo.git): "

if "%REPO_URL%"=="" (
    echo [ERROR] Repository URL cannot be empty.
    pause
    exit /b
)

echo.
echo [1/5] Initializing Git...
git init

echo.
echo [2/5] Adding files...
git add .

echo.
echo [3/5] Committing changes...
git commit -m "initial commit for render deployment"

echo.
echo [4/5] Setting up remote...
git branch -M main
git remote add origin %REPO_URL%

echo.
echo [5/5] Pushing to GitHub...
echo (You may be asked to log in to GitHub in a popup window)
git push -u origin main

echo.
echo ========================================
echo   DONE! Now go to Render.com to deploy.
echo ========================================
pause
