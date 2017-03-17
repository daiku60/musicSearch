//
//  TracksListInteractor.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TracksListInteractorInput <NSObject>

@end

@protocol TracksListInteractorOutput <NSObject>

@end

@interface TracksListInteractor : NSObject <TracksListInteractorInput>

@property (nonatomic, strong) id<TracksListInteractorOutput> output;

@end
