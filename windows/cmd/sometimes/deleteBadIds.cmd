:: This is a script for deleting all the users in badids.txt
:: Each user is on a single line in this file
:: This must be scripted, not typed directly onto command
:: prompt, If you want to type directly onto command prompt then 
:: replace both %%G with %G

FOR /F "delims==" %%G IN (badids.txt) DO net user %%G /del