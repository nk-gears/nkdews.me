---
title: Power Automate - Custom Connector Independent Publisher - My Development Workflow
date: '2021-09-30'
author: Nirmal
template: post
draft: false
tags: &1
- custom-connector
- power-automate
categories: *1
slug: power-automate-custom-connector-independent-publisher-my-development-workflow

---

Recently the Power Automate Open Source Team Introduced the Independent Publisher Program. Being working with custom connector for more than a year, i was excited with this announcement and started developing some of the connectors based on my experience with some of the popular API Services like Xero, FreeAgent,Neto (Maropost), ITGlue etc.

Here my Development Workflow

#### Workflow Expectations :

- There should be one branch in the forked repository where i can add any number of connectors without any restrictions, purey for the Local Development Purposes.
- Unlike other repo, these repositories contains different conectors contributed by the community and organized in separate folders. We should not modify/change someone's connector
- Once the development is done, we need to submit a PR only for the respective connector where the development is done. 

#### Implementation

Here the repository which i will be using in this workflow

Source Repository : https://github.com/microsoft/PowerPlatformConnectors

Forked Repository. : https://github.com/nk-gears/PowerPlatformConnectors/

My Local Setup contains 2 separate Cloned Folders of the Same Repository. I can also maintain a single repo clone and hav achieved the same result. But i don't want to mess up when sending a PR as it delays the review and approval process if there are any issues.

***Cloned Repo In Folder 1 :  ~/repos/for-dev/PowerPlatformConnectors***

A New Branch is created with a name "nk-dev" which is purely for local development purposes and this will not be used to send any PR's.

This branch Contains Multiple Connectors in different folders under the subfolder of independent-publisher-connectors

- FreeAgent
- Deputy
- Maropost
- ITGlue

All my Developments goes to this Branch and I can Edit them whenever needed. Once the changes are validated and stabilized, i use a script to push them to another branch named with the respective connector name. This commit will be used to send a PR to the Source Repository.

***Cloned Repo In Folder 2 : ~/repos/for-pub/PowerPlatformConnectors***

This folder specifically created for Publishing the connector. That is, the final build files are pushed to this branch and committed back to the repo. Then a PR is raised to the Source Repo.

As mentioned earlier, the script will ensure a new branch is created and the code is committed and pushed to the branch

I use a standard convention for these branches like

- freeagent-dev
- deputy-dev
- maropost-dev

Here a quick glimpse of the script

```
#!/bin/bash
cp api*.json ~/repos/for-pub/PowerPlatformConnectors
cp README.md ~/repos/for-pub/PowerPlatformConnectors
echo "Enter Commit message to Push to Connector Pub Repo"
read commit_msg
git add .
git commit -m "${commit_msg}"
git push
```

The above workflow has helped me to avoid any mistakes when developing and submitting multiple connectors at the same time.

Hope it's useful for someone working on independent publisher program.

Happy Coding and Connector Development.

