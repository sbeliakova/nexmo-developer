---
title: Troubleshooting
navigation_weight: 1
---

# Troubleshooting

## Version control

Please make sure you are using the latest version of our SDK. Check for more details here: 
JavaScript: https://developer.nexmo.com/client-sdk/sdk-documentation/javascript/release-notes
iOS: https://developer.nexmo.com/client-sdk/sdk-documentation/ios/release-notes
Android: https://developer.nexmo.com/client-sdk/sdk-documentation/android/release-notes

## Working with the Nexmo CLI

### Nexmo Application setup

Since you can create multiple Nexmo applications, the commands you run refer to the application that was set up. For example, when you create a user, you must make sure to create it on the application you intended.

* Check the app your CLI refers to by running:

``` sh
cat .nexmo-app
```

* If you need to change the setup application, run: 
    
``` sh
nexmo app:setup YOU_APPLICATION_ID YOUR_PRIVATE_KEY_FILE
```

For example:

``` sh
nexmo app:setup abababa-ababa-123123-123123-abababa private.key
```

### No response to commands

It you run a command and don't get a response:
    
* Try making sure that all the JSON objects in you command are closed objects, and not missing any `}` or `'` for example.

## JWTs

> Remember that a JWT is per user per Nexmo Application.

### Invalid Token Error

* [Decode your JWT](https://jwt.io/)

* Make sure the `"application_id"` claim is correct.

* Make sure the `“sub”` is correct. Meaning, a user with this user name exists in your Nexmo Application.

* Make sure the JWT hasn't expired:

    * You can find the expiration date on `“exp”`, in Unix time, which is seconds since Jan 01 1970(UTC).
    
    * You can [convert it to human time](https://www.epochconverter.com/).
    
    * Make sure the expiration time is the future, meaning the JWT hasn't expired yet.

### Connection error or Connection Timeout 

Getting Connection error or Connection Timeout while trying to login to the SDK:

* Check the internet connection on your device.

* Then `JWT` might be valid on JWT standards, however to have some claims might be incorrect per Nexmo requirements. Try generating a new `JWT`, while ensuring the correctness of your the Nexmo specific claims.

### Errors while generating to JWT

* Make sure the private key file exists. It is generated on the machine you created the application on.
    
* In our docs, while using the CLI, we suggest using the path `./private.key`.
    
* Make sure your private key exists on the machine you are generating the JWT with, and that the path is correct.
    
* If you need an new private key:
    
    * You can obtain one from the [Dashboard](https://dashboard.nexmo.com/voice/your-applications). On the left hand side menu select Voice → Your Applications → select the application → Edit. On the bottom click on `Generate public / private key pair`. Remember to click `Save changes`.

    * Save the file on you machine, and update the path to it when generating the JWT.

## Push notifications

* Make sure you’ve uploaded the certificate to Nexmo's server.

* Make sure that you've enabled push notifications, and that the method `client.enablePushNotifications()` was successful. You can also put a log call or a break point to ensure that the call was successful.

* You need to have a valid admin `JWT`, meaning a `JWT` without "sub" claim. You can [Decode your JWT](https://jwt.io/) to make sure.

## Application settings

Check that your application set up properly using this guide https://developer.nexmo.com/conversation/guides/application-setup

Check that you have a valid answer_url linked to the application. 

## Country specific restrictions 

Please make sure you have checked Voice country specific restrictions https://help.nexmo.com/hc/en-us/sections/200637656-Country-Specific-Features-and-Restrictions which will give you more details if there are any specific details which you need to take into account when building your NCCO. 

# Have more Questions?

Should you have any further questions, issues or feedback, please contact us on `ea.support@nexmo.com` or at [Nexmo community Slack](https://developer.nexmo.com/community/slack).
