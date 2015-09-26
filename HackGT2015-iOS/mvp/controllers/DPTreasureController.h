//
//  DPTreasureController.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPTreasureController : NSObject

- (void)getNearbyTreasures:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure;

@end
