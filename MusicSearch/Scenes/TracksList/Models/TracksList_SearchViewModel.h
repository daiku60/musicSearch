//
//  TracksList_SearchViewModel.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TracksList_TrackViewModel : NSObject

@property(nonatomic, strong) NSString *trackTitle;

@end

@interface TracksList_SearchViewModel : NSObject <NSCopying>

@property (nonatomic, strong) NSArray<TracksList_TrackViewModel *> *tracksArray;

- (instancetype)initWithTracks:(NSArray<TracksList_TrackViewModel *> *)tracksArray;

@end
