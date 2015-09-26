//
//  DPSignUpViewController.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPSignUpViewController.h"

@interface DPSignUpViewController ()

@end

@implementation DPSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Drop";
    [label sizeToFit];
    self.signUpView.logo = label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
