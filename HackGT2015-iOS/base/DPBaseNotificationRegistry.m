//
//  DPBaseNotificationRegistry.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPBaseNotificationRegistry.h"
#import "DPTreasureSubscriber.h"
#import "DPBaseSubscriber.h"

@implementation DPBaseNotificationRegistry

# pragma mark - init

- (id)init {
    _eventBus = [Tolo sharedInstance];
    _defaultNotificationSubscribers = [NSMutableArray array];
    _notificationSubscribers = [[NSMapTable alloc] init];
    _notificationSubscribers = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory
                                                     valueOptions:NSMapTableWeakMemory];
    return self;
}

# pragma mark - Singleton

+ (DPBaseNotificationRegistry *)getInstance {
    // Create a singleton instance of the registry on application startup
    static DPBaseNotificationRegistry *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

# pragma mark - registerDefaultSubscribers

- (void)registerDefaultSubscribers {
    // Register all default subscribers when application starts
    [_defaultNotificationSubscribers removeAllObjects];
    [_defaultNotificationSubscribers addObjectsFromArray:[self createDefaultSubscribers]];
    for (id<DPNotificationSubscriber> subscriber in _defaultNotificationSubscribers) {
        [self registerSubscriber:subscriber];
    }
}

# pragma mark - unregisterDefaultSubscribers

- (void)unregisterDefaultSubscribers {
    // Unregister all default subscribers when application terminates
    for (DPBaseSubscriber *subscriber in _defaultNotificationSubscribers) {
        [subscriber unregisterOnBus:_eventBus];
    }
    [_notificationSubscribers removeAllObjects];
}

# pragma mark - registerSubscriber

- (void)registerSubscriber:(id<DPNotificationSubscriber>)subscriber {
    // Register an individual subscriber if it is not inside the MapTable
    if ([_notificationSubscribers objectForKey:subscriber]) {
        return;
    }
    NSObject *registeredSubscriber = [subscriber registerOnBus:_eventBus];
    [_notificationSubscribers setObject:registeredSubscriber forKey:subscriber];
}

# pragma mark - unregisterSubscriber

- (void)unregisterSubscriber:(NSObject *)subscriber {
    if (![_notificationSubscribers objectForKey:subscriber])
        return;
    DPBaseSubscriber *visitor = [_notificationSubscribers objectForKey:subscriber];
    [visitor unregisterOnBus:_eventBus];
    [_notificationSubscribers removeObjectForKey:subscriber];
}

# pragma mark - createDefaultSubscribers

- (NSMutableArray *)createDefaultSubscribers {
    // Init array for subscribers
    NSMutableArray *defaultSubscribers = [NSMutableArray array];
    
    // Create subscribers
    DPTreasureSubscriber *treasureSubscriber = [[DPTreasureSubscriber alloc] init];
    
    // Add subscribers
    [defaultSubscribers addObject:treasureSubscriber];
    
    // Add subscribers to registry to be able to recieve events
    return defaultSubscribers;
}

@end