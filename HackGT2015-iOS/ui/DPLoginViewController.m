//
//  DPLoginViewController.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import "DPLoginViewController.h"

@implementation DPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.logInView.layer.contents = (id)[UIImage imageNamed:@"drop_backdrop"].CGImage;
    
//    UILabel *label = [[UILabel alloc] init];
//    label.textColor = [UIColor whiteColor];
//    UIFont *font = label.font;
//    label.font = [font fontWithSize:40];
//    label.text = @"Drop";
//    label.textAlignment = NSTextAlignmentCenter;
//    [label sizeToFit];
//    self.logInView.logo = label;
}

# pragma mark - LoginViewController Delegates

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    NSLog(@"%@", user);
    NSLog(@"User logged in");
}

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"%@", error);
}

@end
