
//
//  YMGDrawerController.m
//  naojinMMDraw
//
//  Created by yang mengge on 15/8/14.
//  Copyright (c) 2015年 yang mengge. All rights reserved.
//

#import "YMGDrawerController.h"
#import "YMGNavigationController.h"
#import "YMGHomeViewController.h"
#import "YMGMenuViewController.h"
#import <MMDrawerController/MMDrawerVisualState.h>

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width

@interface YMGDrawerController ()

@end

@implementation YMGDrawerController

static YMGDrawerController *_sharedDrawerController;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

+ (YMGDrawerController *)sharedDrawerController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 构建主界面
        UIViewController *leftSideDrawerViewController = [YMGMenuViewController new];
        UIViewController *centerViewController = [[YMGNavigationController alloc] initWithRootViewController:[YMGHomeViewController new]];
        _sharedDrawerController = [[YMGDrawerController alloc] initWithCenterViewController:centerViewController leftDrawerViewController:leftSideDrawerViewController];
        // 基本界面参数
        [_sharedDrawerController setMaximumLeftDrawerWidth:SCREEN_WIDTH*0.8f];
        [_sharedDrawerController setShouldStretchDrawer:NO];
        [_sharedDrawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideVisualStateBlock]];
        [_sharedDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [_sharedDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    });
    return _sharedDrawerController;
}

@end
