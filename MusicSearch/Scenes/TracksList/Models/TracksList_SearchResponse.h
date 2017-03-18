//
//  TracksList_SearchResponse.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackModel;

@interface TracksList_SearchResponse : NSObject

@property (nonatomic, strong, nullable) NSArray<TrackModel *> *resultsArray;

- (instancetype _Nullable)initWithDictionary:(NSDictionary * _Nonnull)dict;

@end
