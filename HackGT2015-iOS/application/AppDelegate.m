//
//  AppDelegate.m
//  HackGT2015-iOS
//
//  Created by Haider Khan on 9/26/15.
//  Copyright © 2015 ZkHaider. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import <FBSDKCoreKit/FBSDKApplicationDelegate.h>
#import <FBSDKCoreKit/FBSDKAppEvents.h>
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

# pragma mark - AppDelegate Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Set the Parse Application with Parse Application ID
    [Parse setApplicationId:@"WDxhZjVJSBXeBudlLDLU5RutPQnNU1gifhcD4Zuq"
                  clientKey:@"8kg3SvqXKnnfo0PqabwLdv8Nv0iCOgEJ564qlknN"];
    // Init facebook login utils
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];
    
    // Configure delegate
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate  sharedInstance]
                                       application:application
                                       openURL:url
                                       sourceApplication:sourceApplication
                                       annotation:annotation];
}

@end
