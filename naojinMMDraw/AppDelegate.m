//
//  AppDelegate.m
//  naojinMMDraw
//
//  Created by yang mengge on 15/8/14.
//  Copyright (c) 2015年 yang mengge. All rights reserved.
//

#import "AppDelegate.h"
#import "YMGDrawerController.h"
#import "UMFeedback.h"
#import "UMOpus.h"
#import <QuartzCore/QuartzCore.h>
#import "MMUSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 设置主界面
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self initThreePary];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [YMGDrawerController sharedDrawerController];
    [self.window makeKeyAndVisible];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"menuDerection"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    return YES;
}

- (void)initThreePary
{
    [self initFeedBack];
    [self initTaobaoSDk];
}

- (void)initFeedBack
{
    [UMOpus setAudioEnable:YES];
    [UMFeedback setAppkey:@"55cdba1ae0f55a8eca003789"];
    [UMFeedback setLogEnabled:NO];
    [[UMFeedback sharedInstance] setFeedbackViewController:[UMFeedback feedbackViewController] shouldPush:NO];
}

- (void)initTaobaoSDk
{
    [MMUSDK sharedInstance].delegate = (id<MMUSDKDelegate>)self; //设置delegate
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
