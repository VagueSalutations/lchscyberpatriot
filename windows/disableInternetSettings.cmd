
:: NEEDS TO BE TESTED

FOR /F "delims==" %%G IN (disableServices.txt) DO net stop %%G

:: create disableServices.txt file, include TELNET and "MICROSOFT FTP SERVICE"
