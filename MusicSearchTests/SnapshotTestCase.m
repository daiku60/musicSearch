//
//  SnapshotTestCase.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "SnapshotTestCase.h"

@implementation SnapshotTestCase

- (UIWindow *)currentWindow {
    return [UIApplication sharedApplication].keyWindow;
}

- (UIViewController *)rootViewController {
    return self.currentWindow.rootViewController;
}

- (void)setRootViewController:(UIViewController *)newRootViewController {
    self.currentWindow.rootViewController = newRootViewController;
    [self.currentWindow makeKeyAndVisible];
}


- (void)debugViewController:(UIViewController *)viewController {
    self.rootViewController = viewController;
    [self expectationWithDescription:@"No expectation"];
    [self waitForExpectationsWithTimeout:6666 handler:nil];
}

- (void)presentViewController:(UIViewController *)viewController {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Presentation"];
    self.rootViewController = [[UIViewController alloc] init];
    self.rootViewController.view.backgroundColor = [UIColor whiteColor];
    [self.rootViewController presentViewController:viewController animated:YES completion:^{
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)verifyViewController:(UIViewController *)viewController {
    self.rootViewController = viewController;
    FBSnapshotVerifyView(viewController.view, @"");
}

@end
