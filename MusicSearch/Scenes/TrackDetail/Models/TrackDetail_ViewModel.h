//
//  TrackDetail_ViewModel.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackDetail_ViewModel : NSObject

@property (nonatomic) NSInteger trackId;
@property (nonatomic, strong, nonnull) NSString *name;
@property (nonatomic, strong, nonnull) NSString *audioPath;
@property (nonatomic, strong, nonnull) NSString *imagePath;

- (instancetype _Nonnull)initWithId:(NSInteger)trackId andName:(NSString * _Nonnull)name andAudioPath:(NSString * _Nonnull)audioPath andImagePath:(NSString * _Nonnull)imagePath;

@end
