//
//  ViewController.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 16/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListViewController.h"
#import "TracksListConfigurator.h"
#import "TrackCell.h"
#import "EmptyCell.h"
#import "TracksListModels.h"
#import "UIView+Constraints.h"
#import "TracksListRouter.h"


@interface TracksListViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, copy) TracksList_SearchViewModel *viewModel;

@property (nonatomic, strong) UIAlertController *loadingAlert;

@end

@implementation TracksListViewController

- (instancetype)initWithViewModel:(TracksList_SearchViewModel *)viewModel {
    if ((self = [super init])) {
        self.viewModel = viewModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure Clean Architecture
    [[TracksListConfigurator sharedInstance] configureWithViewController:self];
    
    self.navigationItem.title = @"Listen to Music!";
    
    [self initSearchBar];
    [self initCollectionView];
    
    [self layoutSubviews];
}

- (void)initCollectionView {
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLayout];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //Register Cell
    [self.collectionView registerClass:[TrackCell class] forCellWithReuseIdentifier:[TrackCell reuseIdentifier]];
    [self.collectionView registerClass:[EmptyCell class] forCellWithReuseIdentifier:[EmptyCell reuseIdentifier]];
    
    //Delegate & DataSource Hooks
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)initSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.searchBar.delegate = self;
}


- (void)layoutSubviews {
    
    //Add views to the hiearchy
    [self.view addSubview:_searchBar];
    [self.view addSubview:_collectionView];
    
    //Layout items inside view
    NSDictionary *views = @{ @"topGuide" : self.topLayoutGuide,
                             @"searchBar" : self.searchBar,
                             @"collectionView" : self.collectionView };
    
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[searchBar][collectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[searchBar]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|" options:0 metrics:nil views:views]];
}


#pragma mark - CollectionView Data Source

- (BOOL)isEmpty {
    return self.viewModel.tracksArray.count == 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self isEmpty]) {
        return 1;
    }
    return self.viewModel.tracksArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isEmpty]) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:[EmptyCell reuseIdentifier] forIndexPath:indexPath];
    }
    
    TrackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TrackCell reuseIdentifier] forIndexPath:indexPath];
    
    TracksList_TrackViewModel *trackVM = [self.viewModel.tracksArray objectAtIndex:indexPath.item];
    [cell configureForViewModel:trackVM];
    
    return cell;
}


#pragma mark - CollectionView Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isEmpty]) {
        return collectionView.frame.size;
    }
    
    return CGSizeMake(collectionView.frame.size.width, [TrackCell staticHeight]);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TracksList_TrackViewModel *trackVM = [self.viewModel.tracksArray objectAtIndex:indexPath.item];
    [self.router navigateToTrackDetailWithId: trackVM.trackId];
}


#pragma mark - Input Methods

- (void)displaySearchResults:(TracksList_SearchViewModel * _Nonnull)viewModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideLoading];
        self.viewModel = viewModel;
        [self.collectionView reloadData];
    });
}

- (void)displaySearchError:(NSError * _Nonnull)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideLoading];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[error.userInfo objectForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // TODO: retry search operation
        }];
        
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    });
}


#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar endEditing:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    if (searchBar.text == nil) {
        return;
    }
    
    TracksList_SearchRequest *request = [[TracksList_SearchRequest alloc] initWithTerm:searchBar.text];
    [self.output searchTracksWithRequest:request];
    
    [self showLoading];
}

- (void)showLoading {
    if (self.loadingAlert != nil) {
        return;
    }
    
    self.loadingAlert = [UIAlertController alertControllerWithTitle:nil message:@"Getting Tracks\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [self.loadingAlert.view addSubview:spinner];
    [self presentViewController:self.loadingAlert animated:YES completion:nil];
}

- (void)hideLoading {
    if (self.loadingAlert == nil) {
        return;
    }
    
    [self.loadingAlert dismissViewControllerAnimated:YES completion:nil];
    self.loadingAlert = nil;
}


@end
