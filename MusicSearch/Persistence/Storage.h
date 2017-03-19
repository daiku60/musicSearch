//
//  Storage.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackModel;

@interface Storage : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (void)storeTrackModel:(TrackModel * _Nonnull)trackModel;
- (TrackModel * _Nullable)trackModelWithId:(NSInteger)trackId;
- (TrackModel * _Nullable)nextTrackModelWithId:(NSInteger)trackId;

@end
