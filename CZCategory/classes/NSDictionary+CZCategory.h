//
//  NSDictionary+CZCategory.h
//  CZCategory
//
//  Created by yunshan on 2019/4/27.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (CZCategory)

/**
 @brief 重写NSDictionary打印的description方法,打印的输出中文字符
 */
-(NSString *)descriptionWithLocale:(id)locale;

/**
 @brief 判断字典中是否存在某个Key

 @param key key值
 */
-(BOOL)containKey:(NSString *)key;
@end

@interface NSMutableDictionary (CZCategory)

@end

NS_ASSUME_NONNULL_END
