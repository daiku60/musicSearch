//
//  TrackDetail_ViewModel.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetail_ViewModel.h"

@implementation TrackDetail_ViewModel

- (instancetype _Nonnull)initWithName:(NSString * _Nonnull)name andAudioPath:(NSString * _Nonnull)audioPath andImagePath:(NSString * _Nonnull)imagePath {
    
    if ((self = [super init])) {
        self.name = name;
        self.audioPath = audioPath;
        self.imagePath = imagePath;
    }
    
    return self;
}

@end
