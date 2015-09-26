//
//  DPTreasureController.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Parse/PFGeoPoint.h>
#import <Parse/PFQuery.h>
#import "DPTreasureController.h"

static NSString *const kClassName = @"treasure";

@implementation DPTreasureController

- (void)getCurrentLocation:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error)
            success(geoPoint);
        else
            failure(error);
    }];
}

- (void)getNearbyTreasures:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    [self getCurrentLocation:^(PFGeoPoint *currentLocation) {
        
        NSLog(@"%@", currentLocation);
        
        // We now have user's location, query locations
        PFQuery *query = [PFQuery queryWithClassName:kClassName];
        
        // Interested in locations near me
        [query whereKey:@"locations" nearGeoPoint:currentLocation withinMiles:30.0];
        
        // Limit possible points to 25
        query.limit = 25;
        
        // Get final list of objects
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                NSLog(@"Success: %@", objects);
            }
        }];
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
