//
//  FakeFetcher.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "FakeFetcher.h"

@implementation FakeFetcher

- (void)fetchMusicWithCompletion:(void(^_Nullable)(NSDictionary<NSString*,NSString*> * _Nullable jsonResponse, NSError * _Nullable error))completionHandler {
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"TrackListMock" ofType:@"json"];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        
        NSError *error;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        completionHandler(jsonObject, nil);
    });
}

@end
