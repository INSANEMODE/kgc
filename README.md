#Kroger Google Calendar

## Important details

This service is a local one. User details are only stored to the `settings.json` file, and only sent to the website.

[This is the repository with the source for the update service that we're cloning within the dockerfile](https://github.com/kryptn/krogergooglecalendar)

## Steps
* Install Docker
  * [Install Docker](http://docs.docker.com/engine/installation/)
  * [Install Docker Compose](https://docs.docker.com/compose/install/)
* run `git clone https://github.com/kryptn/kgc`
* Set up the Google API with your account
  * https://console.developers.google.com/flows/enableapi?apiid=calendar with your google account
  * Check agree and continue
  * Follow next prompt
  * Select Service account (was the third prompt at time of writing)
  * select `P12` key type
  * A p12 file will download, save it as `key.p12` in this directory.
* Edit `settings.json`:
  * Change `google_api_email` to the email found on the next page
  * Change `kroger_euid` and `kroger_euid_password` to your EUID and password
  * Change `gmail_email` to your gmail email address
  * Change the location to your store
  * Change the timezone to your timezone, list [here](https://developers.google.com/adwords/api/docs/appendix/timezones?hl=en)

## Core command:

    sudo docker-compose run worker

## Scheduled updating service

It is possible to schedule an update with cron and docker. My configs are below:

update.sh

    /usr/local/bin/docker-compose -f /home/user/kgc/docker-compose.yml run worker | awk '{print strftime("%c: %"), $0; fflush();}'


Crontab:

    0 12 * * 5 /bin/bash /home/user/kgc/update.sh > /home/user/kgc/kgc.log 2>&1
