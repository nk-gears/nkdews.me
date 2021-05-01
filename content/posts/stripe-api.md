---
title: 'Stripe API'
draft: true
author: Nirmal
date: '2020-04-25'
path: '/streaming-youtube-live-apps-script.md'
template: post
cover:
    image:  '/thumbnails/YouTube-Live.jpg'
categories:
  - Google AppsScript
  - Popular
tags:
  - livestream
  - youtube
  - obs
---

# Stripe Payment API Integration Concepts



PK => Publishable Key : can be exposed to Public
SK => Secret Key : Should be kept secret

Charges => Old API. Only for CARD
PaymentIntent => New API Supports Multiple Sources 

Use Latest API to support PCI Compliance



Charges API

Token : 

- Create Card Token
- Attach a Token to Customer by Creating a New Source

Source



**





const** stripeClient1 = **await** stripeSvc.getStripeClient();

​    **const** expMonth="10"; 

​    **const** expYear="2021";

​    **const** cvc="177";

​    

​    **let** cardInfo=createCardObject(cardNumber, expMonth, expYear, cvc);



 **let** tokenInfo=**await** stripeSvc.createCardToken(cardInfo); 



 console.log(tokenInfo);





const source = await stripeClient1.customers.createSource(

  'cus_JFJiPVcHuGeftH',

  {

​    source: tokenInfo.id,

  }

);



console.log(source);





  customer: 'cus_JFJiPVcHuGeftH',

  trial_end:1618826616,

  default_payment_method:source.id,

  items: [

​    {price: 'price_1IVzVSL1S0Xm5D06AT0JhcDE'},

  ],

});



console.log(subscription);



/*

const charges1=await stripeClient1.charges.create({amount: 50,

​        currency: 'usd',

​        description: "NkTest1",

​        source:source.id,

​        customer: "cus_JFJiPVcHuGeftH"});



console.log(charges1);





const cards = await stripeClient1.customers.listSources(

  'cus_JFJiPVcHuGeftH',

  {object: 'card', limit: 10}

);*/



//console.log(cards);

/*