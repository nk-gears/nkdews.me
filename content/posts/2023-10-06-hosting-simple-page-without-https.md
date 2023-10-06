---
title: Hosting a Simple Page without HTTPS for old device
date: '2023-10-06'
draft: false
tags: &1
- nook_reader
- https
categories: *1
slug: hosting-simple-page-without-https-for-old-devices
---

About a decade ago, the majority of websites operated on the HTTP protocol, with only a few financial and banking-related sites utilizing HTTPS. However, starting around 2018, having a non-HTTPS website began to be considered unsafe for visitors, and it would trigger a notification popup.

Regrettably, there are still some older devices that may struggle with HTTPS due to expired server certificates or outdated operating systems that lack support for HTTPS.

I personally encountered this issue with my "Nook Simple Touch" device, which I've been using as a Quote Frame. This device retrieves data from an API, but since it can't access APIs or websites using HTTPS, I embarked on a quest to find a straightforward solution to host a HTTP-only URL. After some searching, I discovered that locating a hosting service supporting HTTP was challenging. Eventually, I settled on using the free version of [Pipedream](https://pipedream.com/) to craft a custom script in Node.js. This script fetches data from the original source and returns the response. An advantage of this platform is that it assigns a unique random URL to each script, which functions seamlessly in both HTTP and HTTPS environments.


```
scriptname : code_1
// To use any npm package on Pipedream, just import it
import axios from "axios"

export default defineComponent({
  async run({ steps, $ }) {
    const { data } = await axios({
      method: "GET",
      url: "https://nook-frame.vercel.app",
    })
    return data
  },
})
```

```
export default defineComponent({
  async run({ steps, $ }) {
    await $.respond({
      status: 200,
      headers: {"Content-Type":"text/html"},
      body: steps.code_1.$return_value,
    })
  },
})
```


With this setup i can access the site in both protocols

```
- https://<random>.m.pipedream.net
- http://<random>.m.pipedream.net

```

Note, I don't see they support this http officially in the documentation. I inadvertently attempted it, and it worked well.