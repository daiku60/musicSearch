//
//  Storage.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "Storage.h"
#import "TrackModel.h"

@interface Storage ()
@property (nonatomic, strong, nonnull) NSMutableDictionary<NSString *, TrackModel *> *models;
@end

@implementation Storage

static Storage *sharedInstance;

+ (instancetype _Nonnull)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.models = [NSMutableDictionary dictionary];
    });
    return sharedInstance;
}

- (void)storeTrackModel:(TrackModel * _Nonnull)trackModel {
    [self.models setObject:trackModel forKey:[NSString stringWithFormat:@"%ld,",(long)trackModel.trackId]];
}

- (TrackModel * _Nullable)trackModelWithId:(NSInteger)trackId {
    return [self.models objectForKey:[NSString stringWithFormat:@"%ld,",(long)trackId]];
}


@end
