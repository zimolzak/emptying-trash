Emptying the trash
========

Estimate the time to completion on a long "empty the trash" operation.

I Have a macOS Time Machine backup disk that refused to work on a big
backup because it's too full (even though it's set to delete old
backups as necessary). So I deleted a bunch of old backup sets from
`Backups.backupdb`, which went fast, as expected. Then I emptied the
trash, which is going slowly, as expected. *But how slowly?*

I'm logging (using `watch df -m`) how much free space is on my
external HDD, as a function of time of day. I want to know when it
will get to 250 GB of free space.

Also it's fun to watch the used versus free inodes and to take the
log-base-2 of the total inode capacity, but that is kind of out of
scope.
