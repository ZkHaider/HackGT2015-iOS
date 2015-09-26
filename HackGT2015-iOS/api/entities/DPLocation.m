//
//  DPLocation.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPLocation.h"

@implementation DPLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"type": @"__type",
             @"latitude": @"latitude",
             @"longitude": @"longitude"
             };
}

@end
