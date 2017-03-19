//
//  MusicFetcherType.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MusicFetcherType <NSObject>

- (void)fetchMusicWithTerm:(NSString * _Nonnull)term andCompletion:(void(^_Nullable)(NSDictionary<NSString*,NSString*> * _Nullable jsonResponse, NSError * _Nullable error))completionHandler;

@end
