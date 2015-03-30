//
//  AppDelegate.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "AppDelegate.h"
#import "HHNavigationController.h"
#import "HHHomeViewController.h"
#import "HHWeatherItemStation.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    SWIZZ_IT;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    HHHomeViewController *homeViewController = [[HHHomeViewController alloc] init];
    
    // Through the AFNetworking, check the network
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager startMonitoring];
    
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable) {
            
            NSLog(@"The network is not avialible");
            self.netWorkAvailable = NO;
            homeViewController.netWorkAvailable = self.netWorkAvailable;
        }
        else {
            
            NSLog(@"The newwork is ok.");
            self.netWorkAvailable = YES;
            homeViewController.netWorkAvailable = self.netWorkAvailable;
        }
    }];
    
    HHNavigationController *navigationController = [[HHNavigationController alloc] initWithRootViewController:homeViewController];
    
    // Configure the appearance of navigationBar
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:110/255.0 green:182.0/255.0 blue:230/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0]];
    

    // Create weather data Source
    HHWeatherItemStation *weatherItemStation = [HHWeatherItemStation sharedStation];
    
    // Get the temp weather data
//    [weatherItemStation getTempWeatherDataForTest];

    // TODO: Set root view controller for the window
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

// APP 无横屏状态
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
