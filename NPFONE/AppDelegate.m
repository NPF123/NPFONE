//
//  AppDelegate.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "AppDelegate.h"
#import "ONETabBarController.h"
#import "IntroduceViewController.h"
#define FIRST_USE @"FIRST_USE"
@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)firstUse
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"1" forKey:FIRST_USE];
    //    [defaults removeObjectForKey:FIRST_USE];
    [defaults synchronize];
    
}

- (BOOL)isFirstUse
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *value = [defaults objectForKey:FIRST_USE];
    if ([value isEqualToString:@""] || value == nil) {
        [self firstUse];
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if ([self isFirstUse]) {
        //是第一次使用，进入介绍页
        IntroduceViewController *introduce = [[IntroduceViewController alloc]init];
        self.window.rootViewController = introduce;
    }else{
        //不是第一次使用，直接进入主页
        self.window.rootViewController = [[ONETabBarController alloc] init];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
