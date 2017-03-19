//
//  TrackDetailConfigurator.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetailConfigurator.h"
#import "TrackDetailViewController.h"
#import "TrackDetailPresenter.h"
#import "TrackDetailInteractor.h"

@implementation TrackDetailConfigurator

static id sharedInstance;

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)configureWithViewController:(TrackDetailViewController *)viewController {
    
    TrackDetailPresenter *presenter = [[TrackDetailPresenter alloc] init];
    presenter.output = (id<TrackDetailPresenterOutput>)viewController;
    
    TrackDetailInteractor *interactor = [[TrackDetailInteractor alloc] init];
    interactor.output = (id<TrackDetailInteractorOutput>)presenter;
    
    viewController.output = (id<TrackDetailViewControllerOutput>)interactor;
}

@end
