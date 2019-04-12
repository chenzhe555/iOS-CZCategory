//
//  NSString+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NSString+CZCategory.h"

@implementation NSString(CZCategory)

/**
 @brief 获取文本的宽高

 @param font 字体
 @param lines 行数，0表示不限制行数
 @param maxWidth 文本最大宽度
 */
-(CGSize)getTextActualSize:(UIFont *)font lines:(NSInteger)lines maxWidth:(CGFloat)maxWidth
{
    if (self.length <= 0) return CGSizeZero;
    
    //获取每一行的高度
    CGSize lineSize = [self getLineSize:font];
    CGSize allSize = [self getAllSize:font lines:lines maxWidth:maxWidth];
    return [self getActualSize:lineSize allSize:allSize lines:lines maxWidth:maxWidth];
}

/**
 @brief 获取每一行高度

 @param font 字体
 */
-(CGSize)getLineSize:(UIFont *)font
{
    return [self sizeWithAttributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]];
}

/**
 @brief 获取文本总高度

 @param font 字体
 @param lines 行数
 @param maxWidth 最大宽度
 */
-(CGSize)getAllSize:(UIFont *)font lines:(NSInteger)lines maxWidth:(CGFloat)maxWidth
{
    return [self boundingRectWithSize:CGSizeMake(maxWidth, 100000) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil].size;
}


/**
 @brief 获取文本实际宽高

 @param lineSize 每一行宽高
 @param allSize 总宽高
 @param lines 行数
 @param maxWidth 文本最大宽度
 */
-(CGSize)getActualSize:(CGSize)lineSize allSize:(CGSize)allSize lines:(NSInteger)lines maxWidth:(CGFloat)maxWidth
{
    if (allSize.width <= 0) {
        return CGSizeZero;
    } else {
        if (lines == 0) {
            return CGSizeMake(allSize.width < maxWidth ? allSize.width : maxWidth, allSize.height);
        } else {
            //实际行数
            NSInteger realLines = ceil((double)allSize.height/lineSize.height);
            return CGSizeMake(allSize.width < maxWidth ? allSize.width : maxWidth, (realLines > lines ? lines : realLines) * lineSize.height);
        }
    }
}
@end
