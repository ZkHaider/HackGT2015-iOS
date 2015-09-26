//
//  DPBaseNotificationRegistry.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tolo.h"
#import "DPNotificationSubscriber.h"

@interface DPBaseNotificationRegistry : NSObject

@property (nonatomic, strong) Tolo *eventBus;
@property (nonatomic, strong, retain) NSMutableArray *defaultNotificationSubscribers;
@property (nonatomic, strong, retain) NSMapTable *notificationSubscribers;

+ (DPBaseNotificationRegistry *)getInstance;
- (void)registerDefaultSubscribers;
- (void)unregisterDefaultSubscribers;
- (void)registerSubscriber:(id<DPNotificationSubscriber>)subscriber;
- (void)unregisterSubscriber:(NSObject *)subscriber;
- (NSMutableArray *)createDefaultSubscribers;

@end