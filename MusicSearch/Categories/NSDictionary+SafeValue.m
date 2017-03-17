//
//  NSDictionary+SafeValue.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "NSDictionary+SafeValue.h"

@implementation NSDictionary (SafeValue)

- (NSString * _Nullable)stringValueForKey:(NSString * _Nonnull)key {
    id value = [self valueForKey:key];
    if (value == nil || ![value isKindOfClass:[NSString class]]) {
        return nil;
    }
    return value;
}

- (NSNumber * _Nullable)numberValueForKey:(NSString * _Nonnull)key {
    id value = [self valueForKey:key];
    if (value == nil || ![value isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    return value;
}

@end
