//
//  NSObject+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NSObject+CZCategory.h"
#import <objc/runtime.h>

@implementation NSObject (CZCategory)

#pragma mark 视图相关
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

#pragma mark Swizzle 相关
+(BOOL)replaceInstanceMethodWithOriginSEL:(SEL)originSEL newSEL:(SEL)newSEL class:(Class)class
{
    Class replaceClass = class ? class : object_getClass(self);
    Method originalMethod = class_getInstanceMethod(replaceClass, originSEL);
    Method newMethod = class_getInstanceMethod(replaceClass, newSEL);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(replaceClass, originSEL, class_getMethodImplementation(replaceClass, originSEL), method_getTypeEncoding(originalMethod));
    class_addMethod(replaceClass, newSEL, class_getMethodImplementation(replaceClass, newSEL), method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(replaceClass, originSEL), class_getInstanceMethod(replaceClass, newSEL));
    return YES;
}

+(BOOL)replaceClassMethodWithOriginSEL:(SEL)originSEL newSEL:(SEL)newSEL class:(Class)class
{
    Class replaceClass = class ? class : object_getClass(self);
    Method originalMethod = class_getInstanceMethod(replaceClass, originSEL);
    Method newMethod = class_getInstanceMethod(replaceClass, newSEL);
    if (!originalMethod || !newMethod) return NO;
    
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}
@end
