//
//  EmptyCell.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame;

+ (NSString *)reuseIdentifier;

@end
