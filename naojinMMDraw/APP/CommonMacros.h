//
//  CommonMacros.h
//  sanshiliuji
//
//  Created by yang mengge on 15/3/14.
//  Copyright (c) 2015年 zhai shuqing. All rights reserved.
//

#ifndef sanshiliuji_CommonMacros_h
#define sanshiliuji_CommonMacros_h

//
// IOS设备检查宏
//
#define IS_OS_8_OR_LATER           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IPAD                    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE                  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5                (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height == 568.0) &&  ((IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale) || !IS_OS_8_OR_LATER))
#define IS_STANDARD_IPHONE_6       (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0  && IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale)
#define IS_ZOOMED_IPHONE_6         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0 && IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale > [UIScreen mainScreen].scale)
#define IS_STANDARD_IPHONE_6_PLUS  (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_ZOOMED_IPHONE_6_PLUS    (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0 && IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale < [UIScreen mainScreen].scale)

//
// IOS系统版本检查宏
//
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//
//
//
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height
#define STATUS_BAR_FRAME    [[UIApplication sharedApplication] statusBarFrame]
#define STATUS_BAR_HEIGHT   MIN(STATUS_BAR_FRAME.size.height, STATUS_BAR_FRAME.size.width)
#define NAVIGATION_BAR_FRAME(__ofViewController)    (__ofViewController.navigationController.navigationBar.frame)
#define NAVIGATION_BAR_HEIGHT(__ofViewController)   (NAVIGATION_BAR_FRAME(__ofViewController).size.height)

//
// 浮点数比较操作宏（不要使用==、!=来判断浮点数）
//
#define FLT_EQUAL(a, b) (fabs((a) - (b)) < FLT_EPSILON)
#define FLT_EQUAL_ZERO(a) (fabs(a) < FLT_EPSILON)


//
// 非法数据检查宏
//
#define CHECK_VALID_STRING(__aString)               (__aString && [__aString isKindOfClass:[NSString class]] && [__aString length])
#define CHECK_VALID_DATA(__aData)                   (__aData && [__aData isKindOfClass:[NSData class]] && [__aData length])
#define CHECK_VALID_NUMBER(__aNumber)               (__aNumber && [__aNumber isKindOfClass:[NSNumber class]])
#define CHECK_VALID_ARRAY(__aArray)                 (__aArray && [__aArray isKindOfClass:[NSArray class]] && [__aArray count])
#define CHECK_VALID_DICTIONARY(__aDictionary)       (__aDictionary && [__aDictionary isKindOfClass:[NSDictionary class]] && [__aDictionary count])
#define CHECK_VALID_SET(__aSet)                     (__aSet && [__aSet isKindOfClass:[NSSet class]] && [__aSet count])

//
// 各型数据默认值宏
//
#define DEFAULT_STRING                              (@"");
#define DEFAULT_NUMBER                              ([NSNumber numberWithInteger:0]);
#define DEFAULT_ARRAY                               ([NSArray array]);
#define DEFAULT_DICTIONARY                          ([NSDictionary dictionary]);


//
// 单例定义和实现宏
//
#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	IMP_SINGLETON
#define IMP_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}


#endif
