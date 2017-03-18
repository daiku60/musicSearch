//
//  SnapshotTestCase.h
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

@interface SnapshotTestCase : FBSnapshotTestCase

@property (nonatomic, strong, readonly, getter=currentWindow) UIWindow *window;
@property (nonatomic, strong, getter=rootViewController, setter=setRootViewController:) UIViewController *rootViewController;

- (void)debugViewController:(UIViewController *)viewController;
- (void)presentViewController:(UIViewController *)viewController;
- (void)verifyViewController:(UIViewController *)viewController;

@end
