//
//  NSArray+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/27.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NSArray+CZCategory.h"
#import "NSObject+CZCategory.h"

@implementation NSArray (CZCategory)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndex:) newSEL:@selector(sw_objectAtIndex:) class:NSClassFromString(@"__NSArray0")];
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndex:) newSEL:@selector(sw_objectAtIndex:) class:NSClassFromString(@"__NSArrayI")];
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndex:) newSEL:@selector(sw_objectAtIndex:) class:NSClassFromString(@"__NSArrayM")];
        
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndexedSubscript:) newSEL:@selector(sw_objectAtIndexedSubscript:) class:NSClassFromString(@"__NSArray0")];
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndexedSubscript:) newSEL:@selector(sw_objectAtIndexedSubscript:) class:NSClassFromString(@"__NSArrayI")];
        [self replaceInstanceMethodWithOriginSEL:@selector(objectAtIndexedSubscript:) newSEL:@selector(sw_objectAtIndexedSubscript:) class:NSClassFromString(@"__NSArrayM")];
    });
}

-(id)sw_objectAtIndex:(NSUInteger)index
{
    return (index >= 0 && index < self.count) ? [self sw_objectAtIndex:index] : nil;
}

-(id)sw_objectAtIndexedSubscript:(NSUInteger)idx
{
    return (idx >= 0 && idx < self.count) ? [self sw_objectAtIndexedSubscript:idx] : nil;
}
@end


@implementation NSMutableArray (CZCategory)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self replaceInstanceMethodWithOriginSEL:@selector(addObject:) newSEL:@selector(sw_addObject:) class:NSClassFromString(@"__NSArrayM")];
        [self replaceInstanceMethodWithOriginSEL:@selector(insertObject:atIndex:) newSEL:@selector(sw_insertObject:atIndex:) class:NSClassFromString(@"__NSArrayM")];
    });
}

-(void)sw_addObject:(id)anObject
{
    if (anObject) [self sw_addObject:anObject];
}

-(void)sw_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    // 做 index < self.count 的判断话，会导致一些系统的方法调用失败
    if (anObject && index >= 0) [self sw_insertObject:anObject atIndex:index];
}
@end
