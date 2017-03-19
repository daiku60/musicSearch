//
//  TrackResponse.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackModel : NSObject

@property (nonatomic) NSInteger artistId;
@property (nonatomic) NSInteger collectionId;
@property (nonatomic) NSInteger trackId;

@property (nonatomic, strong, nullable) NSString *artistName;
@property (nonatomic, strong, nullable) NSString *collectionCensoredName;
@property (nonatomic, strong, nullable) NSString *trackName;
@property (nonatomic, strong, nullable) NSString *previewUrl;
@property (nonatomic, strong, nullable) NSString *artworkUrl60;
@property (nonatomic, strong, nullable) NSString *artworkUrl100;

@property (nonatomic) float collectionPrice;
@property (nonatomic, strong, nullable) NSString *releaseDate;
@property (nonatomic, strong, nullable) NSString *primaryGenreName;

@end
