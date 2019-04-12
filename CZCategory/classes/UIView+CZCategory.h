//
//  UIView+CZCategory.h
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CZCategory)

#pragma mark 坐标相关
/**
 @brief 获取Origin
 */
-(CGPoint)origin;

/**
 @brief 获取Size
 */
-(CGSize)size;

/**
 @brief 获取横坐标 x
 */
-(CGFloat)x;

/**
 @brief 获取纵坐标 y
 */
-(CGFloat)y;

/**
 @brief 获取高度 height
 */
-(CGFloat)height;

/**
 @brief 获取宽度 width
 */
-(CGFloat)width;

/**
 @brief 横坐标+宽度
 */
-(CGFloat)xPlusWidth;

/**
 @brief 纵坐标+高度
 */
-(CGFloat)yPlushHeight;
@end

NS_ASSUME_NONNULL_END
