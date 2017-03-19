//
//  TrackDetailInteractor.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackDetail_Request;
@class TrackDetail_Response;

#pragma mark - Input and Output Plugs

@protocol TrackDetailInteractorInput <NSObject>
- (void)retrieveTrackWithRequest:(TrackDetail_Request * _Nonnull)request;
- (void)retrieveNextTrackToTrackId:(NSInteger)trackId;
@end

@protocol TrackDetailInteractorOutput <NSObject>
- (void)presentTrackWithResponse:(TrackDetail_Response * _Nonnull)response;
- (void)presentTrackWithError:(NSError * _Nullable)error;
@end

@interface TrackDetailInteractor : NSObject <TrackDetailInteractorInput>

@property (nonatomic, strong) id<TrackDetailInteractorOutput> _Nonnull output;

@end
