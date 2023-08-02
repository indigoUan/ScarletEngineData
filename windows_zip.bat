@echo off

if exist "DLCs\normalq_banners.uan" (
    del "DLCs\normalq_banners.uan"
)
if exist "DLCs\lowq_banners.uan" (
    del "DLCs\lowq_banners.uan"
)

:: COPIES NORMAL QUALITY STUFF TO A FOLDER FOR THE ZIPPER 
set "sourceFolder=DLCs"
set "targetFolder=DLCs\mome_norm"

if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
)


:: COPIES LOW QUALITY STUFF TO A FOLDER FOR THE ZIPPER 
copy "%sourceFolder%\list.json" "%targetFolder%"
xcopy "%sourceFolder%\banners\*-n.png" "%targetFolder%\" /Y

set "sourceFolder=DLCs"
set "targetFolder=DLCs\mome_lowq"

if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
)

copy "%sourceFolder%\list.json" "%targetFolder%"
xcopy "%sourceFolder%\banners\*-l.png" "%targetFolder%\" /Y


:: ZIP AND RENAME THE NORMAL QUALITY STUFF 
if exist "zipped.uan" (
    del "zipped.uan"
)

uanzip zip "DLCs\mome_norm"
rmdir /s /q "DLCs\mome_norm"

ren "zipped.uan" "normalq_banners.uan"
move "normalq_banners.uan" "DLCs\"

:: ZIP AND RENAME THE LOW QUALITY STUFF 
if exist "zipped.uan" (
    del "zipped.uan"
)

uanzip zip "DLCs\mome_lowq"
rmdir /s /q "DLCs\mome_lowq"

ren "zipped.uan" "lowq_banners.uan"
move "lowq_banners.uan" "DLCs\"
