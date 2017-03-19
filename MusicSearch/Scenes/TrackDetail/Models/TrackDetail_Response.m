//
//  TrackDetail_Response.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetail_Response.h"

@implementation TrackDetail_Response

- (instancetype _Nonnull)initWithTrackModel:(TrackModel * _Nonnull)trackModel {
    if ((self = [super init])) {
        self.trackModel = trackModel;
    }
    
    return self;
}

@end
