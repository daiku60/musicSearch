//
//  TracksList_SearchViewModel.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TracksList_TrackViewModel : NSObject

@property(nonatomic) NSInteger trackId;
@property(nonatomic, strong, nonnull) NSString *trackTitle;
@property(nonatomic, strong, nonnull) NSString *artistName;
@property(nonatomic, strong, nullable) NSString *imagePath;

- (instancetype _Nullable)initWithTrackId:(NSInteger)trackId andTrackTitle:(NSString * _Nonnull)trackTitle andArtistName:(NSString * _Nonnull)artistName andImagePath:(NSString * _Nonnull)imagePath;

@end

@interface TracksList_SearchViewModel : NSObject <NSCopying>

@property (nonatomic, strong, nonnull) NSArray<TracksList_TrackViewModel * > *tracksArray;

- (instancetype _Nullable)initWithTracks:(NSArray<TracksList_TrackViewModel * > * _Nonnull)tracksArray;

@end
