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

static NSString *kCellId = @"memoryCellId";

@interface DPDashboardViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DPDashboardViewController

# pragma mark - LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MPSkewedParallaxLayout *layout = [[MPSkewedParallaxLayout alloc] init];
    layout.lineSpacing = 2;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 250);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[MPSkewedCell class] forCellWithReuseIdentifier:kCellId];
    [self.view addSubview:self.collectionView];
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

# pragma mark - viewDidLayoutSubviews

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [(MPSkewedParallaxLayout *)self.collectionView.collectionViewLayout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 250)];
}

# pragma mark - checkIfLoggedIn

- (void)checkIfLoggedIn {
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        DPLoginViewController *loginViewController = [[DPLoginViewController alloc] init];
        [loginViewController setDelegate:self];
        
        DPSignUpViewController *signUpViewController = [[DPSignUpViewController alloc] init];
        [signUpViewController setDelegate:self];
        
        // Assign our sign up controller to be displayed from login view controller
        [loginViewController setSignUpController:signUpViewController];
        
        // Present login view controller
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
}

- (NSString *)titleForIndex:(NSInteger)index {
    NSString *text = nil;
    switch (index - 1) {
        case 0:
            text = @"DESERT\n hot";
            break;
        case 1:
            text = @"MOUNTAIN\n cold";
            break;
        case 2:
            text = @"BLAH\n warm";
            break;
        case 3:
            text = @"SUNSET\n red";
            break;
        case 4:
            text = @"AJACCIO\n beach";
            break;
        default:
            break;
    }
    
    return text;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30; // random
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.item % 5 + 1;
    MPSkewedCell* cell = (MPSkewedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", index]];
    cell.text = [self titleForIndex:index];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@ %zd", NSStringFromSelector(_cmd), indexPath.item);
}


# pragma mark - Parse Login and Sign Up Delegates

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    
}

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    return false;
}

@end
