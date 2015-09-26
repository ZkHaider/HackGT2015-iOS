//
//  AppDelegate.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPBaseNotificationRegistry.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) DPBaseNotificationRegistry *registry;
@property (strong, nonatomic) UIWindow *window;


@end

