#Kroger Google Calendar

## Steps

* https://console.developers.google.com/flows/enableapi?apiid=calendar with your google account
* Check agree and continue
* Follow next prompt
* Select Service account (was the third prompt at time of writing)
* select `P12` key type
* A p12 file will download, save it as p12 in this directory.
* Put the email address on the next page into the `settings.json` page key `GSERVEMAIL`
* Enter kroger EUID and Password into `settings.json`
* Enter gmail email address into `settings.json` email field

Instructions/defaults to follow

### Core command:

    sudo docker run -i -t -v /home/user/abs/path/to/repo:/krogergooglecalendar/data kryptn/kgc python schedule.py