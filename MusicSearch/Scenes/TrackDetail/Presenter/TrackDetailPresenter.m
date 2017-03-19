//
//  TrackDetailPresenter.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetailPresenter.h"
#import "TrackDetailModels.h"
#import "TrackModel.h"

@implementation TrackDetailPresenter

- (void)presentTrackWithResponse:(TrackDetail_Response * _Nonnull)response {
    // Transform response as it came from input (interactor), i.e. model to a viewModel
    TrackModel *model = response.trackModel;
    TrackDetail_ViewModel *viewModel = [[TrackDetail_ViewModel alloc] initWithName:model.trackName andAudioPath:model.previewUrl andImagePath:model.artworkUrl130];
    
    [self.output displayTrackResult:viewModel];
}

- (void)presentTrackWithError:(NSError * _Nullable)error {
    if (error != nil) {
        [self.output displayTrackError:error];
    }
}

@end
