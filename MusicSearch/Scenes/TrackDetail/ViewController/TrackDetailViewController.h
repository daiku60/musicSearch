//
//  TrackDetailViewController.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrackDetail_ViewModel;
@class TrackDetail_Request;

#pragma mark - Input and Output Plugs

@protocol TrackDetailViewControllerInput <NSObject>
//Place here methods that the input (presenter) will call
- (void)displayTrackResult:(TrackDetail_ViewModel * _Nonnull)viewModel;
- (void)displayTrackError:(NSError * _Nonnull)error;
@end

@protocol TrackDetailViewControllerOutput <NSObject>
//Place here methods that will be called in the output (interactor)
- (void)retrieveTrackWithRequest:(TrackDetail_Request * _Nonnull)request;
- (void)retrieveNextTrackToTrackId:(NSInteger)trackId;
@end

@interface TrackDetailViewController : UIViewController <TrackDetailViewControllerInput>

@property (nonatomic, strong, nonnull) id<TrackDetailViewControllerOutput> output;

- (instancetype _Nonnull)initWithTrackId:(NSInteger)trackId;

// Testing and mockung purposes
- (instancetype _Nonnull)initWithViewModel:(TrackDetail_ViewModel * _Nonnull)viewModel;

@end
