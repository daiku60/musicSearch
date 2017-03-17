//
//  Created by Jordi Serra i Font on 16/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TracksListRouter;
@class TracksList_SearchViewModel;
@class TracksList_SearchRequest;

#pragma mark - Input and Output Plugs

@protocol TracksListViewControllerInput <NSObject>
//Place here methods that the input (presenter) will call
- (void)displaySearchResults:(TracksList_SearchViewModel * _Nonnull)viewModel;
- (void)displaySearchError:(NSError * _Nonnull)error;
@end

@protocol TracksListViewControllerOutput <NSObject>
//Place here methods that will be called in the output (interactor)
- (void)searchTracksWithRequest:(TracksList_SearchRequest * _Nonnull)request;
@end


#pragma mark - ViewController

@interface TracksListViewController : UIViewController <TracksListViewControllerInput>

@property (nonatomic, strong) TracksListRouter * _Nullable router;
@property (nonatomic, strong) id<TracksListViewControllerOutput> _Nonnull output;

@end

