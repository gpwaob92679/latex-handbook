@echo off
for /R ./src %%f in (*.tex) do (
echo Now compiling %%f...
echo.
pause
cd %%~dpf
xelatex.exe %%f -synctex=1 -interaction=nonstopmode --shell-escape --enable-8bit-chars -recorder
pause
)
