//
//  TracksList_SearchRequest.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksList_SearchRequest.h"

@implementation TracksList_SearchRequest

- (instancetype _Nullable)initWithTerm:(NSString * _Nonnull)requestTerm {
    if ((self = [super init])) {
        self.requestTerm = requestTerm;
    }
    
    return self;
}

@end
