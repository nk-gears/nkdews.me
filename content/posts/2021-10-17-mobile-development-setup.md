# Mobile Development Setup - Pitfalls/Challenges

Mobile app development may not be that much complex today as we have enough tools targeting multiple platform and devices. But the setting up the environment has been still frustrating considering the ever growing dependencies.

I have done some mobile apps in the past and I have not seen this much complexity

This post I am sharing what I have experienced in setting up the environment.this is not to discourage any new beginners to the mobile development but the frustrations I had with these tools and platform.

The following are the most common languages, tools & softwares which are used in mobile development.


## iDe
- Android Studio or IntelliJ 
- XCode
- VS Code


## Programming Languages & Tools
- React Native - JavaScript Based, expo
- Flutter - Dart With pub packages
- Native iOS 
  - Objective-C with cocoapods
  - Swift - 1.0 - 4.0 with cocoapods,swift packages
- Native Android 
  - Java
  - Kotlin



All these tools and platforms needs to be compatible with each other otherwise you will end up with frustration Of downloading these large files.

Be prepared that after installing these tools, your hdd/ssd may already taken 40 GB of storage.



### XCode :

When you download a Xcode which comes around 10GB file and extracted it will come around 20GB, then when you try to run you will realise that the version you downloaded may not work with other tools like Flutter. I have tested this on a i5 Intel MacBook Pro With 500 GB SSD, which literally takes more than 30 minutes to unzip the Xcode file. Apple, Does the Xcode needs to be this much complexity to setup and run. The next annoying thing is after installing all these, it will prompt you to install additional components to proceed to debug and develop which will take another 30 minutes.


the giant tool and most annoying with multiple versions.
I don't understand why Apple enforces developers to have latest OS BigSur for Xcode 13. Why they can't support Catalina which has been released couple of years ago ?. As a  Mac user, I don't want to upgrade immediately due to variety of reasons. 

Once you setup everything and get started to develop something and try to download a sample code, you will notice that the current setup may not be compatible enough to run that code. Either it may be outdated in just few months or years.this may be due to variety of reasons like software dependencies and language upgrades and ide compatability


What I liked to see :
- Keep the backwards compatibility at least for 5 years.



### objective C & Swift :

As Apple keeps updating the swift language, your current Xcode version will throw annoying errors. I came across an error in Xcode which said this code seems to be using swift x version, to migrate please use Xcode 9. 

When I used objective c in the past I focused of the time in the business logics and application ui. Now I need to read ton's of documentation on the support and compatibility of these swift versions and sometimes the tutorials, package dependencies creates an hell of errors.


### Android Studio :

Android Studio is far better than XCode In terms of size and system memory usage.But it still compute intensive.

NPM Modules are not the one which takes long time to install  but this grade will also take to download the maven packages which you may not know whether the system got hanged. Have tried killing the terminal multiple times and realised its not the system issue, the gradle build will take much time even on the high configuration systems.


Then comes the emulators which behind the scene uses a VM which slows down the rest of the system s it memory hungry with high computational power. i tried few emulators but none of them worked as expected. Even paid ones claims its light weight but it may crash anytime and we need to Setu this again.


what I like to see
- Have the packages download as archive and use some cache mechanism when running multiple projects similar to NPM
- reduce the build time of gradle
- a light weight emulator


what i have understood is that learning a programming language definitely helps to understand the concepts and the thought process behind each language which they developed.
I learned Java, Kotlin & Swift multiple versions. But practically when you try to develop it should feel comfortable for the developers. 

### Java & Kotlin :

The language seems to be good but the way it way implemented for the mobile programming is dreadful. The official documentation has ton of documentation with multiple ways of implementing things and makes me feel lost in the ocean of things. And they keep increasing the complexity in the name of patterns, dependency injections, dapper, hilt and the list goes on. These concepts may help in the long run for building apps which are extremely big and complex but when someone looks at the code it's really tough to understand the dots behind and how it's connected together. In the past I have used XML based ui development like wpf which is not so user friendly and we need to switch the context between the business logic and the xml parts. I see the same thing of placing the xml layout components separately. For others, this may seems to be comfortable but for me it's completely blinds me when I try to switch these and I hate it.

The transition of have to Kotlin helps developers to use the modern syntax but again it's been a another learning curve and I ended up fighting with the syntax errors and language errors.

### react native & expo :
I tried few apps with react native and expo and it worked to some extent. They are some issues as the final app size is bigger than the native one and also it lags in the performance. React-native doesn't support all he features of a native. To implement again you need to do plumbing with the Java or Kotlin library and use that as a bridge to communicate from the react native. then I dropped this as well.

### Flutter with Dart:

After multiple failures with these rabbit hole of setting up and compatibility issues, I ended up to put this mobile development on hold for sometime. then I came across the flutter release from Google which uses the dart language which is similar to any object oriented programming.

Flutter seems to be promising for me personally after  Trying all these languages and tools. The latest flutter as of 2021 expect Xcode 12.0.1 and you need to have compatible OS on the Mac. 

Now I have the following devices used for the development

Moto E6s : Android 9
iPad 2 : 9.3.5
iPhone SE : 14.4.5

I am finally happy with the flutter and I was able to test and run on these Multiple devices without any hicupps. As i am working on simple apps and there is no plan to develop any 2d or 3D game apps for which native platform is recommended. My favourite ide is vscode for the flutter development and it's pretty powerful with the additional plugin which empowers developer productivity.

Good bye objective-c,swift,Java,Kotlin. Not sure whether flutter exposes all the features from the native platform but so far it's convincing as the development setup and workflow seems to be friendly for me

Here some projects I have been working on using flutter.

- Awespire
- DaapTune


















