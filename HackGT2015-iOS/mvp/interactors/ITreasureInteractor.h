//
//  ITreasureInteractor.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITreasureInteractor <NSObject>

- (void)initNearbyTreasures:(NSMutableArray *)treasures;

@end