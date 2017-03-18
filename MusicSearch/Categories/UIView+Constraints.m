//
//  UIView+Constraints.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (Constraints)

- (void)centerInSuperview {
    
    if (self.superview == nil) {
        return;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.f constant:0.f];
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.f constant:0.f];
}

- (void)fillSuperview {
    if (self.superview == nil) {
        return;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.f constant:0.f];
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.f constant:0.f];
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.f constant:0.f];
    
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.superview
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.f constant:0.f];
}

@end
