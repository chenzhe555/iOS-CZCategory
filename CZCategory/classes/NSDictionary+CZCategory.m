//
//  NSDictionary+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/27.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NSDictionary+CZCategory.h"
#import "NSObject+CZCategory.h"

@implementation NSDictionary (CZCategory)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"\n{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@ = %@;\n" ,key, obj];
    }];
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

-(id)sw_objectForKey:(id)aKey
{
    NSLog(@"sw_objectForKeysw_objectForKeysw_objectForKey");
    return [self sw_objectForKey:aKey];
}

-(BOOL)containKey:(NSString *)key
{
    if (!key) return NO;
    return self[key] != nil;
}
@end

@implementation NSMutableDictionary (CZCategory)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self replaceClassMethodWithOriginSEL:@selector(setObject:forKey:) newSEL:@selector(sw_setObject:forKey:) class:NSClassFromString(@"__NSDictionaryM")];
    });
}

-(void)sw_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey && anObject) [self sw_setObject:anObject forKey:aKey];
}
@end
