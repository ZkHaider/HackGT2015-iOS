//
//  DPBaseSubscriber.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tolo.h"
#import "DPNotificationSubscriber.h"

@interface DPBaseSubscriber : NSObject <DPNotificationSubscriber>

@property (nonatomic) Tolo *eventBus;

- (id<NSObject>)registerOnBus:(Tolo *)eventBus;
- (void)unregisterOnBus:(Tolo *)eventBus;
- (void)post:(id<NSObject>)event;

@end