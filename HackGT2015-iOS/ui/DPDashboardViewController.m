//
//  ViewController.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Parse/Parse.h>
#import "DPDashboardViewController.h"
#import "DPLoginViewController.h"
#import "DPSignUpViewController.h"
#import "MPSkewedCell.h"
#import "MPSkewedParallaxLayout.h"
#import "DPTreasureCell.h"
#import "DPTreasurePresenter.h"

static NSString *kCellId = @"memoryCellId";

@interface DPDashboardViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) DPTreasurePresenter *treasurePresenter;
@property (nonatomic, strong) NSMutableArray *treasures;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation DPDashboardViewController

# pragma mark - LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self setupRefreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self checkIfLoggedIn];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - setupCollectionView

- (void)setupCollectionView {
    MPSkewedParallaxLayout *layout = [[MPSkewedParallaxLayout alloc] init];
    layout.lineSpacing = 2;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 300);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    [self.collectionView registerClass:[DPTreasureCell class] forCellWithReuseIdentifier:kCellId];
    [self.view addSubview:self.collectionView];
}

# pragma mark - setupRefreshControl 

- (void)setupRefreshControl {
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = [UIColor cyanColor];
    [_refreshControl addTarget:self action:@selector(refreshControlAction) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:_refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

# pragma mark - refreshControlAction

- (void)refreshControlAction {
    [_treasurePresenter loadNearbyTreasures];
}

# pragma mark - viewDidLayoutSubviews

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [(MPSkewedParallaxLayout *)self.collectionView.collectionViewLayout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 300)];
}

# pragma mark - checkIfLoggedIn

- (void)checkIfLoggedIn {
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        DPLoginViewController *loginViewController = [[DPLoginViewController alloc] init];
        [loginViewController setDelegate:self];
        
        DPSignUpViewController *signUpViewController = [[DPSignUpViewController alloc] init];
        [signUpViewController setDelegate:self];
        
        // Set facebook permissions
        [loginViewController setFacebookPermissions:[NSArray arrayWithObjects:@"user_friends", nil]];
        
        // Set the login view controller fields
        [loginViewController setFields:PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton];
        
        // Assign our sign up controller to be displayed from login view controller
        [loginViewController setSignUpController:signUpViewController];
        
        // Present login view controller
        [self presentViewController:loginViewController animated:YES completion:nil];
    } else {
        // Go ahead and init the presenter
        [self setupTreasurePresenter];
    }
}

# pragma mark - setupTreasurePresenter

- (void)setupTreasurePresenter {
    if (!_treasurePresenter) {
        _treasurePresenter = [[DPTreasurePresenter alloc] initWithInteractor:self];
        [_treasurePresenter registerOnBus];
        [_treasurePresenter loadNearbyTreasures];
    }
}

# pragma mark - ITreasureInteractor Methods

- (void)initNearbyTreasures:(NSMutableArray *)treasures {
    // Add to collectionview and reload data
    _treasures = [[NSMutableArray alloc] initWithArray:treasures];
    [self.collectionView reloadData];
}

# pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30; // random
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DPTreasureCell* cell = (DPTreasureCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:@"smallerTreasure"];
    cell.text = @"You found treasure!";
    
    return cell;
}

# pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DPTreasureCell *cell = (DPTreasureCell *) [collectionView cellForItemAtIndexPath:indexPath];
    
}

# pragma mark - Parse Login and Sign Up Delegates

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    NSLog(@"User logged in!");
}

@end
