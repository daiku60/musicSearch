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
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation TrackCell

#pragma mark - Default initializer

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self createItems];
        [self layoutItems];
    }
    
    return self;
}

- (void)createItems {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.4];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.descriptionLabel.font = [UIFont systemFontOfSize:12];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutItems {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descriptionLabel];
    
    //Layout items inside view
    NSDictionary *views = @{ @"titleLabel" : self.titleLabel, @"descriptionLabel" : self.descriptionLabel };
    
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[descriptionLabel]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[descriptionLabel]-|" options:0 metrics:nil views:views]];
}


#pragma mark - Public Methods

- (void)configureForViewModel:(TracksList_TrackViewModel *)viewModel {
    self.titleLabel.text = viewModel.trackTitle;
    self.descriptionLabel.text = viewModel.artistName;
}


#pragma mark - Static Methods

+ (NSString *)reuseIdentifier {
    return @"TRACK_CELL";
}

+ (NSInteger)staticHeight {
    return 100;
}


@end
