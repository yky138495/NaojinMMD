//
//  Commopertion.m
//  chunjie
//
//  Created by yang mengge on 15/3/23.
//  Copyright (c) 2015年 zhai shuqing. All rights reserved.
//

#import "Commopertion.h"

@implementation Commopertion

@end

@implementation NSDictionary (Utils)

- (NSString *)stringForKey:(NSString *)key {
    if (key) {
        NSObject *obj = [self objectForKey:key];
        if (obj) {
            return [obj description];
        }
    }
    return @"";
}

- (NSInteger)integerForKey:(NSString *)key {
    if (key) {
        return [[self objectForKey:key] integerValue];
    }
    return 0;
}

@end