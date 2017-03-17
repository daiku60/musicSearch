//
//  TracksList_SearchRequest.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TracksList_SearchRequest : NSObject

@property (nonatomic, strong) NSString * _Nonnull requestTerm;

- (instancetype _Nullable)initWithTerm:(NSString * _Nonnull)requestTerm;

@end
