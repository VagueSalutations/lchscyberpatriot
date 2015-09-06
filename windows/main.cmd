
:: Create badids.txt *FIRST* (if no bad ids, create anyway)
:: Create disableServices.txt *FIRST* (NET START, list services to terminate)

deleteBadIDs.cmd
manageAccounts.cmd              :: auto-calls mangleNetUser.cmd (creates usernames.txt)
disableInternetSettings.cmd
