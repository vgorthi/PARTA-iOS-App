//
//  AppDelegate.m
//  PartaDriver
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import "AppDelegate.h"
@import GoogleMaps;
//@import Firebase;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self decorateGlobalAppInterface];

    [GMSServices provideAPIKey:@"AIzaSyDfUNkvnKTsZVuUb-Iy_biTb_Qlp2bm5oI"];
//    [FIRApp configure];
    

    return YES;
}

-(void)decorateGlobalAppInterface
{    
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.09 green:0.22 blue:0.28 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor whiteColor],
                                 NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:20]
                                 };
    
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
