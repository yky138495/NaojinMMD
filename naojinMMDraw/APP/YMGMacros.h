
//
//  YMGMacros.h
//  sanshiliuji
//
//  Created by yang mengge on 15/3/14.
//  Copyright (c) 2015年 zhai shuqing. All rights reserved.
//

#ifndef sanshiliuji_YMGMacros_h
#define sanshiliuji_YMGMacros_h

// 引入公共宏定义
#import "CommonMacros.h"


//
// 未使用变量宏（去警告）
//
#define NWD_UNUSED(x) ((void)(x))


//
// 要求调用父类
//
#if __has_attribute(objc_requires_super)
#define NWD_REQUIRES_SUPER __attribute__((objc_requires_super))
#else
#define NWD_REQUIRES_SUPER
#endif

//
// 标记废弃的属性
//
#if __has_attribute(deprecated)
#define NWD_DEPRECATED __attribute__((deprecated))
#else
#define NWD_DEPRECATED
#endif

//
// ARC下performSelector无法编译通过
//
#define NWD_SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#endif
