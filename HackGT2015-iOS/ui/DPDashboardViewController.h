//
//  ViewController.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>
#import "ITreasureInteractor.h"

@interface DPDashboardViewController : UIViewController <ITreasureInteractor, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>


@end

