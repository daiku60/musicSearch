//
//  TracksListConfigurator.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TracksListViewController;

@interface TracksListConfigurator : NSObject

+ (instancetype _Nonnull)sharedInstance;
- (void)configureWithViewController:(TracksListViewController * _Nonnull)viewController;

@end
