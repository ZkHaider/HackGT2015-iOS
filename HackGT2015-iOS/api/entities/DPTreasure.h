//
//  DPTreasure.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Mantle.h>
#import "MTLModel.h"

@interface DPTreasure : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSMutableArray *textArray;
@property (nonatomic, strong) NSMutableArray *user;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;

@end
