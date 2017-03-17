//
//  MusiciTunesFetcher.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MusicFetcherType <NSObject>

- (void)fetchMusicWithCompletion:(void(^_Nullable)(NSDictionary<NSString*,NSString*> * _Nullable jsonResponse, NSError * _Nullable error))completionHandler;

@end

@interface ITunesFetcher : NSObject <MusicFetcherType>

@end
