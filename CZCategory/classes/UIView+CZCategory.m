//
//  UIView+CZCategory.m
//  CZCategory
//
//  Created by yunshan on 2019/4/12.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "UIView+CZCategory.h"

@implementation UIView (CZCategory)

-(CGPoint)origin
{
    return self.frame.origin;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGFloat)xPlusWidth
{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)yPlushHeight
{
    return self.frame.origin.y + self.frame.size.height;
}

@end
