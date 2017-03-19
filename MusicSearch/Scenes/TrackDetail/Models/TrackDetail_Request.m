//
//  TrackDetail_Request.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetail_Request.h"


@implementation TrackDetail_Request

- (instancetype _Nonnull)initWithTrackId:(NSInteger)trackId {
    if ((self = [super init])) {
        self.trackId = trackId;
    }
    
    return self;
}

@end
