//
//  NSObject+CZCategory.h
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CZCategory)

#pragma mark 视图相关
/**
 @brief 获取当前主Window
 */
-(UIWindow *)getMainWindow;

/**
 @brief 获取当前屏幕显示的VC
 */
-(UIViewController *)getCurrentShowVC;

#pragma mark Swizzle 相关

/**
 @brief 替换实例方法实现

 @param originSEL 原方法
 @param newSEL 新方法
 */
+(BOOL)replaceInstanceMethodWithOriginSEL:(SEL)originSEL newSEL:(SEL)newSEL class:(Class _Nullable)class;

/**
 @brief 替换类方法实现

 @param originSEL 原方法
 @param newSEL 新方法
 */
+(BOOL)replaceClassMethodWithOriginSEL:(SEL)originSEL newSEL:(SEL)newSEL class:(Class _Nullable)class;
@end

NS_ASSUME_NONNULL_END
