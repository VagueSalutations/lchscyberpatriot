
:: NEEDS TO BE TESTED

FOR /F "delims==" %%G IN (disableServices.txt) DO net stop %%G
FOR /F "delims==" %%G IN (disableServices.txt) DO sc config %%G start= disabled ::not working
:: create disableServices.txt file, include TELNET and "MICROSOFT FTP SERVICE"
