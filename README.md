# Dynosaur

Administer your Heroku app using SMS.

## What?

You're in the pub with your pals and you get an email from your boss saying your webapp is inexplicably on the front page of news.yc and your puny dual dyno setup is falling over. F$#@! What do you do?

Easy, send a text

<pre>dynos +10</pre>

__BOSH!__ Put your phone back in your pocket and get yourself a well earned drink my son.

## ZOMG I want this!

Cool

- Clone the repo
- `cp config.yaml.example config.yaml`
- Enter your Twilio and Heroku credentials into the config file
- Add it to your repo, commit it
- Create new Heroku app and push to Heroku
- Buy a number from Twilio and set the "friendly name" of the number to the name of your Heroku app.
- Set the SMS URL and SMS Fallback URL to the URL of the new heroku app.
- You're done

You can now what you would to your Heroku app using the CLI but instead by texting the number, just omit the 'heroku' you would usually type on the CLI. Dynosaur works out which app to apply the command to by the friendly name of the Twilio number.


