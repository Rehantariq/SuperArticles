# SuperArticles
<p align="center">
<img src='https://github.com/Rehantariq/SuperArticles/blob/master/SuperArticles/Screenshot.png' />
</p>

## Support 

   * IOS version support : IOS 13, IOS 14, IOS 15  ( actually the time was short but we can give support upto ios 10.3 by small changes in future )
   * This app is build using xcode 12.5 as mentioned in requirenment 


## Project Architecture

* Model View Presenter (MVP), In MVP pattern Presenter and View are linked with each other via protocols.
* Why I use it? because it makes the Unit Testing much easier, for such kind of Apps.  
* I created one Generic Protocol named "AnyPresenter" if all screens uses that protocol in order to implement MVP then no matter which team member work on it, the code will look like the same and very easy to understand and maintain.

## 3rd party libraries

* I never use any 3rd party library in my core code directly, instead I create Protocol to use them in my code. Why? it will make it easier to manage 3rd party code and we can replace it with disturbing our core code.

* Alamofire: Alamofire is an HTTP networking library

