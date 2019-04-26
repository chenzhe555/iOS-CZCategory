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

-(UIViewController *)getCurrentShowVC
{
    UIViewController * vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self getVCFrom:vc];
}

-(UIViewController *)getVCFrom:(UIViewController *)rootVC
{
    UIViewController * currentVC = nil;
    if ([rootVC presentedViewController])
    {
        //presented
        currentVC = [rootVC presentedViewController];
    }
    else if ([rootVC isKindOfClass:[UITabBarController class]])
    {
        //tabbar
        currentVC = [self getVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    }
    else if ([rootVC isKindOfClass:[UINavigationController class]])
    {
        //navi
        currentVC = [self getVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    }
    else
    {
        //vc
        currentVC = rootVC;
    }
    return currentVC;
}
@end
