//
//  BannerViewController.h
//  GDTMobSample
//
//  Created by GaoChao on 13-11-1.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDTMobBannerView.h"


@interface BannerViewController : UIViewController<GDTMobBannerViewDelegate>
{
    GDTMobBannerView *_bannerView;
}

@end
