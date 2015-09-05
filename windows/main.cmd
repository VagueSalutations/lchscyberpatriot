
:: Create badids.txt *FIRST*
:: Create disableServices.txt *FIRST*

deleteBadIDs.cmd
manageAccounts.cmd              :: auto-calls mangleNetUser.cmd
disableInternetSettings.cmd
