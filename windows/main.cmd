
:: Create badids.txt *FIRST* (if no bad ids, create anyway)
:: Create disableServices.txt *FIRST* (NET START, list services to terminate)
:: Create usernames.txt *FIRST* (lists all usernames)

deleteBadIDs.cmd
manageAccounts.cmd              :: auto-calls mangleNetUser.cmd (dependency on usernames.txt)
disableInternetSettings.cmd
