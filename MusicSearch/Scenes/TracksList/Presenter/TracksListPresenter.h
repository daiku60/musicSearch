//
//  TracksListPresenter.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TracksListPresenterInput <NSObject>

@end

@protocol TracksListPresenterOutput <NSObject>

@end

@interface TracksListPresenter : NSObject <TracksListPresenterInput>

@property (nonatomic, strong) id<TracksListPresenterOutput> output;

@end
