//
//  DPTreasureSubscriber.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPTreasureSubscriber.h"
#import "DPTreasureController.h"
#import "DPLoadTreasures.h"

@interface DPTreasureSubscriber() {
@private
    DPTreasureController *_treasureController;
}

@end

@implementation DPTreasureSubscriber

# pragma mark - init

- (id)init {
    _treasureController = [[DPTreasureController alloc] init];
    return self;
}

# pragma mark - subscription events

SUBSCRIBE(DPLoadTreasures) {
    [_treasureController getNearbyTreasures:^(id JSON) {
        NSArray *treasures = JSON;
        NSLog(@"%@", treasures);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
