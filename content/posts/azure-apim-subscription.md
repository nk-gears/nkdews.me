---
title: Creating a Azure APIM Subscription Programmatically,
author: Nirmal
date:  2021-07-24,
path: '/azure-apim-subscription.md'
template: post
categories:
  - Cloud
tags:
  - azure
  - apim
  
---


Azure Supports Multiple Methods to Authorize Access to the Services via API. Some Platforms use Personal Tokens, Service Account and Username/Password.

In Azure, Its not called as Service Accounts, Instead its named as Service Principal.

```javascript

const { ClientSecretCredential } = require("@azure/identity");
const client1 = require("@azure/arm-apimanagement");

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
const newSubscription=await client.subscription.createOrUpdate(resourceGroupName,serviceName,subscriptionId,props);
console.log(newSubscription);
})();

```



