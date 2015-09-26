//
//  DPLocation.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Mantle.h>
#import "MTLModel.h"

@interface DPLocation : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *type;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end
