---
title: 'Streaming OpenAI API Response from NodeJS to browser client running on nginx-proxy'
author: Nirmal
date: '2024-01-26'
path: '/streaming-openai-api-response-from-nodejs'
template: post
categories:
  - api
  - openai
tags:
  - docker
  - nginx-proxy
  - http-stream
---

![](https://cdn-images-1.medium.com/max/2400/1*Z6K1SXEx-U2jSnUsRl1FuA.png)


ChatGPT from OpenAI has created a major impact in each of our Lives to increase the Productivity. Majority of the industries has already leveraging the Power of AI in their applications through the API’s. Let’s see how to use streaming api feature in the backend to provide a good experience to the user.

As you may noticed that when you ask something to ChatGPT from the official UI, the responses are streamed (text are printed character by character slowly). This is not an animated one but the as soon the data is processed by the AI Server, the responses are streamed back immediately.

In the Traditional API Integration, the requests are sent to the server and the responses are sent in one single output to the client. But in this case the user has to wait until the server processes the request. Sometimes this may also end up with connection timeout if the backend takes long time. In that case webhooks comes to rescue the async based operations to notify an endpoint when the process is completed.

 ```javascript
    // server-side code - nodejs
    //...express api route /api/get-response
    res.writeHead(200, {
      "Content-Type": "text/plain; charset=utf-8",
    });
    
    
    const config: ChatCompletionCreateParamsStreaming = {
              ......
              .......
              stream: true, // This is the key to request stream from openai api
              messages: [
                {
                  "role": "system",
                  "content": '.....'
                },
                {
                  "role": "user",
                  "content": '....'
                }
              ],
            };
    
    // send a call to the openAI
    const completion = await openai.chat.completions.create(config);
    
    // read chunk by chunk from api and send it to the client chunck by chunk
    for await (const chunk of completion) {
      const [choice] = chunk.choices;
      const { content } = choice.delta;
      const finalContent = content ? content : '';
      res.write(finalContent);
    }
    res.write(contentText);
    res.end();

 ```

 ```javascript
    // client-side
      const response = await fetch('/api/get-response', {
        headers,
        method: 'POST',
        body: JSON.stringify(payload)
      });
    
      const reader = response?.body?.getReader()
      while (true) {
        const { done, value: chunk } = await reader.read()
        if (done) break
        const decodedValue = decoder.decode(chunk)
        div.innerHTML=div.innerHTML + decodedValue
        // render the value to UI
      }
 ```      

Sometimes the streaming the text from the backend maynot work as expected if the backend is served through a proxy (upstream app). This happens because the proxy server will wait for the response from the upstream app and buffer all the data then it finally sends the response to the client.

To solve this the proxy settings needs to be changes like this in the nginx-proxy. `proxy_buffering` is the key element to intimate the proxy server not to buffer the data and instantly send that to the requesting client. The other properties `proxy_connect_timeout` is used to resolve the 504 Gateway timeout error’s incase the OpenAI API takes more time to get the response.

 ```javascript
      proxy_connect_timeout       600;
      proxy_send_timeout          600;
      proxy_read_timeout          600;
      send_timeout                600;
      proxy_set_header Keep-Alive "timeout=600, max=1000";
      proxy_buffering off;
 ```    
    
