#Kroger Google Calendar

## Important details

This service is a local one. User details are only stored to the `settings.json` file, and only sent to the website.

[This is the repository with the source for the update service that we're cloning within the dockerfile](https://github.com/kryptn/krogergooglecalendar)

## Steps
* [Install Docker](http://docs.docker.com/engine/installation/)
* run `git clone https://github.com/kryptn/kgc`
* https://console.developers.google.com/flows/enableapi?apiid=calendar with your google account
* Check agree and continue
* Follow next prompt
* Select Service account (was the third prompt at time of writing)
* select `P12` key type
* A p12 file will download, save it as `key.p12` in this directory.
* Edit `settings.json` and change `google_api_email` to the email found on the next page
* Edit `settings.json` and change `kroger_euid` and `kroger_euid_password` to your EUID and password
* Edit `settings.json` and change `gmail_email` to your gmail email address
* Edit `settings.json` and change the location to your store
* Edit `settings.json` and change the timezone to your timezone, list [here](https://developers.google.com/adwords/api/docs/appendix/timezones?hl=en)

## Core command:

    sudo docker run -i -t -v /home/user/abs/path/to/repo:/krogergooglecalendar/data kryptn/kgc python schedule.py