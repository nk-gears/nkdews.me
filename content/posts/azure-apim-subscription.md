---

title: Creating a Azure APIM Subscription Programmatically
date: '2021-07-24'
author: Nirmal
template: post
draft: false
tags: &1
- azure
- azure
categories: *1

---



#### Introduction

I have been searching for a way to create subscrition accounts for Azure APIM programmatically using NodeJS. I hardly find any example as most of them are in Powershell based scripts. In this post i would like share the snippet for the same.

#### Challenge

Then i was experimenting with the azure-sdk-for-js and browsed through the library to understand the implementation and tried but it failed due to auth related issues.

Azure Supports Multiple Methods to Authorize Access to the Services via API. Some Platforms use Personal Tokens, Service Account and Username/Password. In Azure, Its not called as Service Accounts, Instead its named as Service Principal.

I don't want to deal with any complex oauth flows or redirect Uris. It's just a internal application to create azure apim subscrition based on user who have signed up. I could have used the APIM developer portal for this but i preferred to keep this behind any UI.

#### Solution

- Created a Azure App Registration (Internal Use Only)
- Created ClientID and Client Secret
- Used the azure-sdk-for-js Library to interact with the Service

```javascript
const { ClientSecretCredential } = require("@azure/identity");
const client1 = require("@azure/arm-apimanagement");

```



```javascript

const resourceGroupName = "rg-apim-prod";
const serviceName = "apim-svc";
const subscriptionId = "6d9cbd55-........a";

//App Registration - TenantId, Application ClientId/Service PrincipalID, Secret Token
const creds = new ClientSecretCredential(
  "850c242.....................",
  "d809a39.....................",
  "HP2e8jN.....................",
);

(async ()=>{

  const client = new client1.ApiManagementClient(creds, subscriptionId);
  console.log("ass");
	const scope = "Tenant";
	const lsItems=await client.subscription.list(resourceGroupName, serviceName);
	
  const props={scope: "/subscriptions/-8141-44608e35-397ebcfca2da/resourceGroups/rg-apim-prod/providers/Microsoft.ApiManagement/service/apim-svc/apis/service-api",
  displayName: "Simple1",
  state: "active",
  allowTracing: true
  };
  
  //add New Subscription
	const newSubscription=await 						   client.subscription.createOrUpdate(resourceGroupName,serviceName,subscriptionId,props);
	console.log(newSubscription);
})();

```



