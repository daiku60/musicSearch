//
//  ViewController.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 16/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TracksListRouter;
@class TracksList_SearchViewModel;

@protocol TracksListViewControllerInput <NSObject>

//Place here methods that the input (presenter) will call
- (void)displaySearchResults:(TracksList_SearchViewModel *)viewModel;

@end

@protocol TracksListViewControllerOutput <NSObject>

//Place here methods that will be called in the output (interactor)

@end

@interface TracksListViewController : UIViewController <TracksListViewControllerInput>

@property (nonatomic, strong) TracksListRouter *router;
@property (nonatomic, strong) id<TracksListViewControllerOutput> output;

@end

