//
//  TrackDetailPresenter.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackDetail_Response;
@class TrackDetail_ViewModel;

@protocol TrackDetailPresenterInput <NSObject>
- (void)presentTrackWithResponse:(TrackDetail_Response * _Nonnull)response;
- (void)presentTrackWithError:(NSError * _Nullable)error;
@end

@protocol TrackDetailPresenterOutput <NSObject>
- (void)displayTrackResult:(TrackDetail_ViewModel * _Nonnull)viewModel;
- (void)displayTrackError:(NSError * _Nonnull)error;
@end

@interface TrackDetailPresenter : NSObject <TrackDetailPresenterInput>

@property (nonatomic, weak, nullable) id<TrackDetailPresenterOutput> output;

@end
