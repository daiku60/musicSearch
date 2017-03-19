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
@property (nonatomic, strong, nonnull) NSMutableArray<TrackModel *> *trackModels;
@end

@implementation Storage

static Storage *sharedInstance;

+ (instancetype _Nonnull)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.trackModels = [NSMutableArray array];
    });
    return sharedInstance;
}

- (void)storeTrackModel:(TrackModel * _Nonnull)trackModel {
    [self.trackModels filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        TrackModel *model = (TrackModel *)evaluatedObject;
        return model.trackId != trackModel.trackId;
    }]];
    
    [self.trackModels addObject:trackModel];
}

- (TrackModel * _Nullable)trackModelWithId:(NSInteger)trackId {
    return [[self.trackModels filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        TrackModel *model = (TrackModel *)evaluatedObject;
        return model.trackId == trackId;
    }]] firstObject];
}

- (TrackModel * _Nullable)nextTrackModelWithId:(NSInteger)trackId {
    TrackModel *currentTrackModel = [[self.trackModels filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        TrackModel *model = (TrackModel *)evaluatedObject;
        return model.trackId == trackId;
    }]] firstObject];
    
    NSUInteger idx = [self.trackModels indexOfObject:currentTrackModel];
    NSUInteger nextIdx = (idx + 1) % self.trackModels.count;
    
    return [self.trackModels objectAtIndex:nextIdx];
}


@end
