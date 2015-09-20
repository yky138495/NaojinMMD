//
//  HomeViewController.h
//  naojin
//
//  Created by yang mengge on 15/1/22.
//  Copyright (c) 2015年 zhai shuqing. All rights reserved.
//

#import "YMGViewController.h"
#import "GDTMobBannerView.h" 

@interface HomeViewController : YMGViewController<GDTMobBannerViewDelegate>
{
    GDTMobBannerView *_bannerView;
}

@end
