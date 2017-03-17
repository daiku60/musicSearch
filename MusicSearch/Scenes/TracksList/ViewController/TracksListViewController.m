//
//  ViewController.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 16/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListViewController.h"
#import "TrackCell.h"
#import "TracksList_SearchViewModel.h"

@interface TracksListViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, copy) TracksList_SearchViewModel *viewModel;

@end

@implementation TracksListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Hello";
    
    [self initSearchBar];
    [self initCollectionView];
    
    [self layoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)initCollectionView {
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLayout];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[TrackCell class] forCellWithReuseIdentifier:[TrackCell reuseIdentifier]];
}

- (void)initSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
}


- (void)layoutSubviews {
    
    //Add views to the hiearchy
    [self.view addSubview:_searchBar];
    [self.view addSubview:_collectionView];
    
    //Layout items inside view
    NSDictionary *views = @{ @"topGuide" : self.topLayoutGuide,
                             @"searchBar" : self.searchBar,
                             @"collectionView" : self.collectionView };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[searchBar][collectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[searchBar]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|" options:0 metrics:nil views:views]];
}


#pragma mark - CollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TrackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TrackCell reuseIdentifier] forIndexPath:indexPath];
    
    TracksList_TrackViewModel *trackVM = [self.viewModel.tracksArray objectAtIndex:indexPath.item];
    [cell configureForViewModel:trackVM];
    
    return cell;
}


#pragma mark - CollectionView Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, [TrackCell staticHeight]);
}


#pragma mark - Input Methods

- (void)displaySearchResults:(TracksList_SearchViewModel *)viewModel {
    self.viewModel = viewModel;
    [self.collectionView reloadData];
}


@end
