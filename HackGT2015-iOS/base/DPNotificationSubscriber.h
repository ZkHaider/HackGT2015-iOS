//
//  DPNotificationSubscriber.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "Tolo.h"

@protocol DPNotificationSubscriber <NSObject>

- (id<NSObject>)registerOnBus:(Tolo *)eventBus;
- (void)unregisterOnBus:(Tolo *)eventBus;

@end