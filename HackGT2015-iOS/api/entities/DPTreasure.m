//
//  DPTreasure.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPTreasure.h"
#import "DPLocation.h"

@implementation DPTreasure

# pragma mark - Initialization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectId": @"objectId",
             @"textArray": @"text",
             @"location": @"location",
             @"user": @"user",
             @"createdAt": @"createdAt",
             @"updatedAt": @"updatedAt"
             };
}

# pragma mark - locationJSONTransformer

- (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[DPLocation class]];
}

@end
