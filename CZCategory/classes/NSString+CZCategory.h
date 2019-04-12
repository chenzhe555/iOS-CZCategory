//
//  NSString+CZCategory.h
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CZCategory)

#pragma mark 计算文本宽高
/**
 @brief 获取文本的宽高
 
 @param font 字体
 @param lines 行数，0表示不限制行数
 @param maxWidth 文本最大宽度
 */
-(CGSize)getTextActualSize:(UIFont *)font lines:(NSInteger)lines maxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
