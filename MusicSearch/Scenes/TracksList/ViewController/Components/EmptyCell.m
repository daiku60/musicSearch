//
//  EmptyCell.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "EmptyCell.h"

@implementation EmptyCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        
        UILabel *emptyMessageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        emptyMessageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:emptyMessageLabel];
        
        emptyMessageLabel.text = @"There ain't no elements here...";
        emptyMessageLabel.numberOfLines = 0;
        emptyMessageLabel.textAlignment = NSTextAlignmentCenter;
        
        NSDictionary *views = @{ @"emptyLabel" : emptyMessageLabel };
        [self.contentView addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[emptyLabel]|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[emptyLabel]|" options:0 metrics:nil views:views]];
        
    }
    
    return self;
}

+ (NSString *)reuseIdentifier {
    return @"EMPTY_CELL";
}

@end
