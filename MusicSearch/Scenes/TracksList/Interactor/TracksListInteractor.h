//
//  TracksListInteractor.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesFetcher.h"

@class TracksList_SearchRequest;
@class TracksList_SearchResponse;

#pragma mark - Input and Output Plugs

@protocol TracksListInteractorInput <NSObject>
- (void)searchTracksWithRequest:(TracksList_SearchRequest * _Nonnull)request;
@end

@protocol TracksListInteractorOutput <NSObject>
- (void)presentSearchWithResponse:(TracksList_SearchResponse * _Nonnull)response;
- (void)presentSearchWithError:(NSError * _Nullable)error;
@end

@interface TracksListInteractor : NSObject <TracksListInteractorInput>

@property (nonatomic, strong) id<MusicFetcherType> _Nonnull fetcher;
@property (nonatomic, strong) id<TracksListInteractorOutput> _Nonnull output;

- (instancetype _Nullable)initWithFetcher:(id<MusicFetcherType> _Nonnull)fetcher;

@end
