//
//  TracksListConfigurator.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListConfigurator.h"
#import "TracksListRouter.h"
#import "TracksListPresenter.h"
#import "TracksListInteractor.h"
#import "TracksListViewController.h"

@implementation TracksListConfigurator

static id sharedInstance;

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)configureWithViewController:(TracksListViewController *)viewController {
    TracksListRouter *router = [[TracksListRouter alloc] init];
    router.viewController = viewController;
    
    TracksListPresenter *presenter = [[TracksListPresenter alloc] init];
    presenter.output = (id<TracksListPresenterOutput>)viewController;
    
    TracksListInteractor *interactor = [[TracksListInteractor alloc] init];
    interactor.output = (id<TracksListInteractorOutput>)presenter;
    
    viewController.output = (id<TracksListViewControllerOutput>)interactor;
    viewController.router = router;
}

@end
