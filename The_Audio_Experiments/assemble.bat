@echo off
REM SIMPLE COMMAND.COM SCRIPT TO ASSEMBLE GAMEBOY FILES

cp theoutputfile.asm gameboydemo.asm
if exist %1.gb del %1.gb
REM IF THERE ARE SETTINGS WHICH NEED TO BE DONE ONLY ONCE, PUT THEM BELOW
rem if not %ASSEMBLE%1 == 1 goto begin
rem path=%path%;c:\gameboy\assembler\
rem doskey UNNECESSARY ON DESKTOP --- DOSKEY ALREADY INSTALLED
rem set dir=c:\gameboy\curren~1\

:begin
set assemble=1
echo assembling...
rgbasm -E -o%1.obj %1.asm
if errorlevel 1 goto end
echo linking...
rgblink -o%1.gb -n gameboydemo.sym %1.obj
if errorlevel 1 goto end
echo fixing...
rgbfix -p0 -v %1.gb

:end
rem del *.obj
