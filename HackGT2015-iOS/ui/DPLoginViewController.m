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
    
    UIImageView *uiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"treasureChest"]];
   
    
    uiv.frame = CGRectMake(100,30,180,180);
     uiv.frame = uiv.frame;
    
    [self.view addSubview:uiv];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    UIFont *font = label.font;
    label.font = [font fontWithSize:35];
    label.text = @"Drop";
    [label sizeToFit];
    self.logInView.logo = label;
}

@end
