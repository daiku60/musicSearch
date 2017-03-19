//
//  TrackDetailViewController.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 19/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TrackDetailViewController.h"
#import "TrackDetailConfigurator.h"
#import "TrackDetailModels.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface TrackDetailViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *albumImageView;
@property (nonatomic, strong) IBOutlet UILabel *trackNameLabel;

@property (nonatomic) NSInteger trackId;

@property (nonatomic, strong) TrackDetail_ViewModel *viewModel;

@end

@implementation TrackDetailViewController

#pragma mark - ViewController Lifecycle

- (instancetype)initWithTrackId:(NSInteger)trackId {
    if ((self = [super initWithNibName:@"TrackDetailViewController" bundle:[NSBundle mainBundle]])) {
        self.trackId = trackId;
    }
    
    return self;
}

- (instancetype _Nonnull)initWithViewModel:(TrackDetail_ViewModel * _Nonnull)viewModel {
    if ((self =  [super init])) {
        self.viewModel = viewModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[TrackDetailConfigurator sharedInstance] configureWithViewController:self];
    
//    // UI Initialization
//    [self initAlbumImageView];
//    [self initTrackNameLabel];
//    
//    // UI Layout
//    [self layoutSubviews];
    
    if (self.viewModel == nil) {
        // Request Track
        TrackDetail_Request *request = [[TrackDetail_Request alloc] initWithTrackId:self.trackId];
        [self.output retrieveTrackWithRequest:request];
    } else {
        [self configureForViewModel:_viewModel];
    }
}

- (void)initAlbumImageView {
    self.albumImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.albumImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.albumImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)initTrackNameLabel {
    self.trackNameLabel = [[UILabel alloc] init];
    self.trackNameLabel.font = [UIFont systemFontOfSize:14 weight:1];
    self.trackNameLabel.textAlignment = NSTextAlignmentCenter;
    self.albumImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutSubviews {
    [self.view addSubview:self.albumImageView];
    [self.view addSubview:self.trackNameLabel];
    
    //Layout items inside view
    NSDictionary *views = @{ @"topGuide" : self.topLayoutGuide,
                             @"albumImageView" : self.albumImageView,
                             @"trackNameLabel" : self.trackNameLabel };
    
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide]-50-[albumImageView(100)]-[trackNameLabel]" options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[albumImageView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[trackNameLabel]|" options:0 metrics:nil views:views]];
}

#pragma mark - ViewModel inflation

- (void)configureForViewModel:(TrackDetail_ViewModel *)viewModel {
    NSURL *url = [NSURL URLWithString:viewModel.imagePath];
    if (url != nil) {
        [self.albumImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
    
    self.trackNameLabel.text = viewModel.name;
}

#pragma mark - Input Methods

- (void)displayTrackResult:(TrackDetail_ViewModel * _Nonnull)viewModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self configureForViewModel:viewModel];
    });
}

- (void)displayTrackError:(NSError * _Nonnull)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

@end
