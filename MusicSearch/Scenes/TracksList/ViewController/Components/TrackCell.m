//
//  TrackCell.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackCell.h"
#import "TracksList_SearchViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TrackCell ()

@property (strong, nonatomic) IBOutlet UIImageView *albumImageView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;

@end

@implementation TrackCell

#pragma mark - Public Methods

- (void)configureForViewModel:(TracksList_TrackViewModel *)viewModel {
    self.titleLabel.text = viewModel.trackTitle;
    self.descriptionLabel.text = viewModel.artistName;
    [self.albumImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.imagePath] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

#pragma mark - Static Methods

+ (NSString *)reuseIdentifier {
    return @"TRACK_CELL";
}

+ (NSInteger)staticHeight {
    return 100;
}


@end
