//
//  MusiciTunesFetcher.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "ITunesFetcher.h"

#define BASE_URL @"https://itunes.apple.com/search"

@interface ITunesFetcher ()

@end

@implementation ITunesFetcher

- (void)fetchMusicWithTerm:(NSString *)term andCompletion:(void(^_Nullable)(NSDictionary<NSString*,NSString*> * _Nullable jsonResponse, NSError * _Nullable error))completionHandler
{
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@?term=%@&limit=10", BASE_URL, @"search", term];
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:fullPath] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        if (data != nil) {
            NSError *jsonErr;
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonErr];
            completionHandler(jsonResponse, nil);
        }
    }] resume];
}

@end
