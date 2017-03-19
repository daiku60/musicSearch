//
//  TrackDetailConfigurator.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackDetailViewController;

@interface TrackDetailConfigurator : NSObject

+ (instancetype _Nonnull)sharedInstance;
- (void)configureWithViewController:(TrackDetailViewController * _Nonnull)viewController;

@end
