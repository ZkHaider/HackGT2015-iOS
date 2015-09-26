//
//  DPTreasurePresenter.h
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITreasureInteractor.h"

@interface DPTreasurePresenter : NSObject

@property (nonatomic, strong) id<ITreasureInteractor> treasureInfo;

- (id)initWithInteractor:(id<ITreasureInteractor>)interactor;
- (void)registerOnBus;
- (void)unregisterOnBus;
- (void)loadNearbyTreasures;

@end
