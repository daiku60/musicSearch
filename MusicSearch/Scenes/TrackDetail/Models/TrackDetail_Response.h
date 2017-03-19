//
//  TrackDetail_Response.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackModel;

@interface TrackDetail_Response : NSObject

@property (nonatomic, strong, nonnull) TrackModel *trackModel;

- (instancetype _Nonnull)initWithTrackModel:(TrackModel * _Nonnull)trackModel;

@end
