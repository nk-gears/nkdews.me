---
title: 'Software related Challenges and Solutions'
author: Nirmal
date: '2023-10-15'
path: '/software-challenges-proposed-solution'
categories: [solution]
---
I am tracking all my software related challenges here and proposed solution in short form. For some challenges i already arrived solution and most of them are based on google apps script.

Later this can be used for generating new ideas.

Note : 👍 denotes the solution which i have arrived at. Most 


> Creating Content with Regular Work Schedule

It's been a long time challenge for me to create content during the work hours. How to allocate dedicate hours for creating content.

**Solution**

- Set a day in a week - Every Saturday or Every Wednesday
- Use a separate laptop/user-profile for work and content creation to keep the focus on respective areas.
- Save the ideas incubation list



> Ask Alexa - Run Custom Scripts

It's disappointing that none of the voice assistant provides a simple way to execute custom scripts based on voice without going through the hassle of app creation and deployment.

Proposed Solution

- For simple audio playlist, alexa provides University and Spiritual Talks Blueprint Template. This supports pls and rss audio feed (not podcast format though).
- But these blueprints are not work with context. This means we can't skip to next or last.
- For full control, we need to use the ask cli and create a app with custom commands and deploy on Lambda. Still it can be used only for private use and for public usage this needs to be published to alexa store.


> Challenge - A Simple External Logging

Web Developers often use console logging for troubleshooting at the frontend side. Sometime we may need to log to external service without depending on external service and track review easily with a spreadsheet.

**Solution**

- Create a Web App in AppScript
- Log the Incoming data to a Google Sheet.
- Note : This works only for he payload. Google Script doesn't provide an option to read request headers. For temporary usage, checkout webhook.site but that will expire after few hours.


> **Challenge - Universal Copy Paste without App**

Everytime we switch devices we may need to push data to copy data between these devices. Installing app in all these devices always a challenge due to the version cmompatability or the service failed to work after few months. Recently the Clipt service has been shutdown.

**Proposed Solution**

- Instead of thinking as Copy Paste, think as a service which saves data and returns on demand with just a URL
- It should support both long text and short text
- This can be also used for multiple purposes using a concept of key pair values
- To Save
  - /api/save-key/image
  - /api/save-key/text
  - /api/save-key/url
  - /api/save-key/yt-url
  - /api/save-key/yt-id
  - /api/save-key/cmd
  - /api/save-key/curl
  - /api/save-key/code
  - Similarly for getting the data we can create api for the same
  - How to make this as a service via google sheet ?
  - Hosting in google sheet is not a big deal but accessing them on demand is a challenge due to a long url. Instead shall we use a gg.gg comand with a custom link ?. Yes, but who knows when they will close this service ?
- How it can given as a service for each user?
- Sign In as user
- Provide them a key with support for API
- Give them how to save and access
  - kv.appdews.com/username/get
    - UI Page to see the current text,url and other values based on password.
  - kv.appdews.com/username/set
    - UI Page to set the current text,url and other values based on password.
    -

> **Challenge - Reading SMS** 👍

Looking for the phone for every time to check the OTP received through SMS is distracting and sometimes i may not near the phone.

**Solution**

- Forward SMS to External Storage like Google Sheet
- Use the Incoming SMS Forwarded Android APK from GitHub
- ```javascript

  function doPost(request = {}) {
      try {
          const {
              parameter,
              postData: {
                  contents
              } = {}
          } = request;
          const {
              source
          } = parameter;

          const jsonData = JSON.parse(contents);
          saveSMS(contents);

          return ContentService.createTextOutput({}).setMimeType(ContentService.MimeType.JSON);

      } catch (error) {

          Logger.log(error.message);
      }


  }


  function saveSMS(smsContent) {
      const ss = SpreadsheetApp.getActiveSpreadsheet();
      const sheet = ss.getSheetByName("SMS");
      const rowNo = sheet.getLastRow();
      const ts = new Date();
      sheet.appendRow([rowNo, smsContent, ts]);
  }

  ```
