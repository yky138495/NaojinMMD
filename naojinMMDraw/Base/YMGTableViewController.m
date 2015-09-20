//
//  YMGTableViewController.m
//  naojinREFrosted
//
//  Created by yang mengge on 15/8/7.
//  Copyright (c) 2015年 yang mengge. All rights reserved.
//

#import "YMGTableViewController.h"
#import "GDTMobBannerView.h"
#import "GDTMobInterstitial.h"

@interface YMGTableViewController ()<GDTMobBannerViewDelegate,GDTMobInterstitialDelegate>

@property (nonatomic,strong) GDTMobBannerView *_bannerView;
@property (nonatomic,strong) GDTMobInterstitial *_interstitialObj;
@property (nonatomic,strong) NSTimer *interstitialTimer1;
@property (nonatomic,strong) NSTimer *interstitialTimer2;

@end

@implementation YMGTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self setAdvertisement];
    self.interstitialTimer1 = [NSTimer scheduledTimerWithTimeInterval:50 target:self selector:@selector(loadAdd) userInfo:nil repeats:YES];
    self.interstitialTimer2 = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(showAdd) userInfo:nil repeats:YES];

}

//Banner
-(void)setAdvertisement
{
    CGFloat heightY = SCREEN_HEIGHT - 50 - GDTMOB_AD_SUGGEST_SIZE_320x50.height;
    self._bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, heightY, self.view.frame.size.width,GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:GDT_APPKEY placementId:GDT_BANNER_PLACEMENTID];
    self._bannerView.delegate = self;
    self._bannerView.currentViewController = self;
    self._bannerView.interval = 30;
    self._bannerView.isGpsOn = YES;
    self._bannerView.showCloseBtn = YES;
    self._bannerView.isAnimationOn = YES;
    [self.view addSubview:self._bannerView];
    [self._bannerView loadAdAndShow];
}

//插屏
-(void)loadAdd
{
    
    if (!self._interstitialObj) {
        self._interstitialObj = [[GDTMobInterstitial alloc] initWithAppkey:GDT_APPKEY placementId:GDT_INTERSTITIAL_PLACEMENTID];
        self._interstitialObj.delegate = self;
        self._interstitialObj.isGpsOn = YES;
    }
    [self._interstitialObj loadAd];
}

-(void)showAdd
{
    [self._interstitialObj presentFromRootViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

@end
