//
//  AppDelegate.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/7.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MainController.h"


// EMContactManagerDelegate 监听好友申请的回调方法的协议
@interface AppDelegate ()<EMContactManagerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[LoginViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    // 环信集成
    [self addEMCSocket];
    
    return YES;
}

/**
 环信集成
 */
- (void)addEMCSocket {
    EMOptions *options = [EMOptions optionsWithAppkey:EMAppKey];
    [[EMClient sharedClient] initializeSDKWithOptions:options];

}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
