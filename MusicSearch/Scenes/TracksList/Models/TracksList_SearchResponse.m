//
//  TracksList_SearchResponse.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksList_SearchResponse.h"
#import "NSDictionary+SafeValue.h"

@implementation TracksList_SearchResponse

- (instancetype _Nullable)initWithDictionary:(NSDictionary * _Nonnull)dict {
    if ((self = [super init])) {
        // TODO: Perform the parsing into a Full Model
        
        NSArray<NSDictionary *> *resultsArray = [dict objectForKey:@"results"];
        if (resultsArray == nil) {
            return nil;
        }
        
        if (resultsArray.count == 0) {
            self.resultsArray = [NSArray array];
            return self;
        }
        
        NSMutableArray<TrackModel *> *mutableTracks = [NSMutableArray array];
        for (NSDictionary *jsonTrack in resultsArray) {
            TrackModel *track = [[TrackModel alloc] init];
            track.artistId = [[jsonTrack numberValueForKey:@"artistId"] integerValue];
            track.collectionId = [[jsonTrack numberValueForKey:@"collectionId"] integerValue];
            track.trackId = [[jsonTrack numberValueForKey:@"trackId"] integerValue];
            track.artistName = [jsonTrack stringValueForKey:@"artistName"];
            track.trackName = [jsonTrack stringValueForKey:@"trackName"];
            track.collectionCensoredName = [jsonTrack stringValueForKey:@"collectionCensoredName"];
            track.previewUrl = [jsonTrack stringValueForKey:@"previewUrl"];
            track.artworkUrl60 = [jsonTrack stringValueForKey:@"artworkUrl60"];
            track.artworkUrl100 = [jsonTrack stringValueForKey:@"artworkUrl100"];
            
            [mutableTracks addObject:track];
        }
        
        self.resultsArray = [mutableTracks copy];
    }
    
    return self;
}

@end
