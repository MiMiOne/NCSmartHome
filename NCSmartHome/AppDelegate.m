//
//  AppDelegate.m
//  NCSmartHome
//
//  Created by Wiley on 2019/5/31.
//  Copyright © 2019 Wiley. All rights reserved.
//

#import "AppDelegate.h"
#import "NCGuidePageViewController.h"
#import "NCTabBarViewController.h"
#import "NCHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initApp];
    [self judgeIsFirstLogin];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)initApp
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.tabBarController = [NCTabBarViewController new];
}
-(void)judgeIsFirstLogin
{
    BOOL NoFirstLogin = [[NSUserDefaults standardUserDefaults]objectForKey:@"isFirstTag"];
    if (NoFirstLogin) {
        //不是第一次登录
        self.window.rootViewController = self.tabBarController;
    }else{
       //第一次登录
        NCGuidePageViewController *guide = [NCGuidePageViewController new];
        guide.ClickLastButtonBlock = ^{
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isFirstTag"];
            self.window.rootViewController = self.tabBarController;
        };
        self.window.rootViewController = guide;
    }
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
