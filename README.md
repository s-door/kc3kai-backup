# kc3kai-backup
Back up the data of KC3kai, a chrome extension.

This script was created referring to this issue "https://github.com/KC3Kai/KC3Kai/issues/2164#issuecomment-322659010".

# Install
```bash
git clone https://github.com/s-door/kc3kai-backup.git
chmod a+x kc3kai-backup/backup.bash
(crontab -l; echo "8 * * * * ~/kc3kai-backup/backup.bash") | crontab -
```
This is an example of running hourly, but of course you can run it manually.
