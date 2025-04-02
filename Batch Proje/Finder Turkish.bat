@echo off
chcp 65001 > nul
title Arama Scripti

:menu
cls

echo [!] Hangi Scripti Çalıştırmak İstersiniz.
echo [1] Ara ve Bulunanın Sayısını Bildir. (DAHA AYRINTILI)
echo [2] Sadece Ara ve Tüm Bulunanları Saymadan Listele. (DAHA HIZLI)
echo [E] Çıkış
set /p secim="Seçimizi Yapın (1/2/E): "

if "%secim%"=="1" goto ayrintili_ara
if "%secim%"=="2" goto hizli_ara
if "%secim%"=="E" exit
goto menu



::DETAYLI ARAMA YAPMAK İÇİN GEREKEN KODLAR:

:ayrintili_ara


@echo off
cls

set /p d="Arama İçin Disk Seçin (C, D vb.): "
set /p a="Aramak İstediğinizi Girin: "

echo Arama baslatiliyor...

:: Dosyaları bul ve çıktıyı ekrana yazdırırken aynı anda say.
set count=0
for /f "delims=" %%i in ('dir /s /b %d%:\ ^| findstr /i "%a%"') do (
    echo %%i
    set /a count+=1
)

:: Dosya sayısını ekrana yazdır
if %count% gtr 0 (
    echo.
    echo ============================
    echo [✓] Toplam %count% dosya bulundu.
    echo ============================
) else (
    echo [X] "%a%" kelimesi iceren dosya bulunamadi.
)
pause
goto ayrintili_ara



::HIZLI ARAMA YAPMAK İÇİN GEREKEN KODLAR:

:hizli_ara


@echo off
cls

set /p d="Arama İçin Disk Seçin (C, D vb.): "
set /p a="Aramak İstediğinizi Girin: "

echo Arama baslatiliyor...
dir /s %d%:\ | findstr /s /i "%a%" 

if %errorlevel% neq 0 (
    echo "%a%" kelimesi bulunamadi.
)

pause
goto hizli_ara




