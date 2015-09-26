//
//  DPTreasurePresenter.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import "DPTreasurePresenter.h"

@implementation DPTreasurePresenter

# pragma mark - Init

- (id)initWithInteractor:(id<ITreasureInteractor>)interactor {
    _treasureInfo = interactor;
    return self;
}

# pragma mark - Bus Methods

- (void)registerOnBus {
    REGISTER();
}

- (void)unregisterOnBus {
    UNREGISTER();
}

# pragma mark - loadOrganizationUsers

- (void)loadOrganizationUsers {
    
}


@end
