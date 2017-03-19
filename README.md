# MusicSearch
Showcase app

It showcases various patterns and good practices for this case scenario. Amongst
others, it applies:

- Clean Architecture, adapted from http://clean-swift.com/ to Objective-C.
- Sepparation of Concerns (View - Interactor - Presenter)
- Single Responsability Principle
- Dependency Injection (MusicFetcherType)
- Data retrieved from server
- (a really humble) cache layer
- Decoupling through intense use of protocols (two way: input and output)
- Unit Testing (though only for the TracksList Scene)
- Snapshot testing for UI components using FBSnapshotTestCase
- Use of cocoapods (only for Snapshot Testing and image downloading and caching)

The app is not fully completed, but it is my understanding that the main point
to showcase my skills is made. Some thigs that are yet to develop but have really
no impact on the architecture presented here.

I hope you enjoy it ^_^
