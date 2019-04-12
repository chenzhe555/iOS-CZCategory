//
//  NSObject+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NSObject+CZCategory.h"

@implementation NSObject (CZCategory)
/**
 @brief 获取当前主Window
 */
-(UIWindow *)getMainWindow
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}
@end
