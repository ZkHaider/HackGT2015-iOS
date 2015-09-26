//
//  DPLoginViewController.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPLoginViewController.h"

@implementation DPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    UIFont *font = label.font;
    label.font = [font fontWithSize:31];
    label.text = @"Drop";
    [label sizeToFit];
    self.logInView.logo = label;
}

@end
