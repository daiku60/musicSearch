//
//  NSDictionary+SafeValue.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeValue)

- (NSString * _Nullable)stringValueForKey:(NSString * _Nonnull)key;
- (NSNumber * _Nullable)numberValueForKey:(NSString * _Nonnull)key;

@end
