//
//  TrackDetail_Request.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackDetail_Request : NSObject

@property (nonatomic) NSInteger trackId;

- (instancetype _Nonnull)initWithTrackId:(NSInteger)trackId;

@end
