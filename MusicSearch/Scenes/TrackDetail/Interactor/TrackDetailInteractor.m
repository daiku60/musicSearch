//
//  TrackDetailInteractor.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetailInteractor.h"
#import "TrackDetailModels.h"
#import "Storage.h"
#import "TrackModel.h"

@implementation TrackDetailInteractor

- (void)retrieveTrackWithRequest:(TrackDetail_Request * _Nonnull)request {
    // Retrieve from storage and forward to output (Presenter)
    TrackModel *trackModel = [[Storage sharedInstance] trackModelWithId:request.trackId];
    
    if (trackModel != nil) {
        TrackDetail_Response *response = [[TrackDetail_Response alloc] initWithTrackModel:trackModel];
        [self.output presentTrackWithResponse:response];
    } else {
        NSError *error = [[NSError alloc] initWithDomain:@"TrackDetail.presenter" code:1001 userInfo:@{ @"message" : NSLocalizedString(@"Track not found", @"") }];
        [self.output presentTrackWithError:error];
    }
}

@end
