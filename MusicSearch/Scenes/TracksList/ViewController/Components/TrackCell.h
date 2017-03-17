//
//  TrackCell.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TracksList_TrackViewModel;

@interface TrackCell : UICollectionViewCell

// Class methods
+ (NSString *)reuseIdentifier;
+ (NSInteger)staticHeight;

// Public Methods
- (void)configureForViewModel:(TracksList_TrackViewModel *)viewModel;

@end
