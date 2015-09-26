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

@interface DPDashboardViewController ()

@end

@implementation DPDashboardViewController

# pragma mark - LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self checkIfLoggedIn];
    [PFUser logOut];
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

# pragma mark - Parse Login and Sign Up Delegates

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    
}

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    return false;
}

@end
