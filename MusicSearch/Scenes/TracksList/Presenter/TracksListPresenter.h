//
//  TracksListPresenter.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TracksList_SearchResponse;
@class TracksList_SearchViewModel;

#pragma mark - Input and Output Plugs

@protocol TracksListPresenterInput <NSObject>
- (void)presentSearchWithResponse:(TracksList_SearchResponse * _Nonnull)response;
- (void)presentSearchWithError:(NSError * _Nullable)error;
@end

@protocol TracksListPresenterOutput <NSObject>
- (void)displaySearchResults:(TracksList_SearchViewModel * _Nonnull)viewModel;
- (void)displaySearchError:(NSError * _Nonnull)error;
@end

@interface TracksListPresenter : NSObject <TracksListPresenterInput>

@property (nonatomic, strong) id<TracksListPresenterOutput> _Nonnull output;

@end
