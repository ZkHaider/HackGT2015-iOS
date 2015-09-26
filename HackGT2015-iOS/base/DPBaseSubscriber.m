//
//  DPBaseSubscriber.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPBaseSubscriber.h"

@implementation DPBaseSubscriber

# pragma mark - registerOnBus

- (id<NSObject>)registerOnBus:(Tolo *)eventBus {
    _eventBus = eventBus;
    REGISTER();
    return self;
}

# pragma mark - unregisterOnBus

- (void)unregisterOnBus:(Tolo *)eventBus {
    UNREGISTER();
    _eventBus = nil;
}

# pragma mark - post

- (void)post:(id<NSObject>)event {
    if (event == nil) {
        // Throw an exception
    }
    PUBLISH(event);
}

@end