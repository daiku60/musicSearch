//
//  TrackCell.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackCell.h"
#import "TracksList_SearchViewModel.h"

@interface TrackCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TrackCell


#pragma mark - Public Methods

- (void)configureForViewModel:(TracksList_TrackViewModel *)viewModel {
    self.titleLabel.text = viewModel.trackTitle;
}


#pragma mark - Static Methods

+ (NSString *)reuseIdentifier {
    return @"TRACK_CELL";
}

+ (NSInteger)staticHeight {
    return 100;
}


@end
