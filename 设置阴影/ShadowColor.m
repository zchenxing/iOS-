//
//  ShadowColor.m
//  U-健康管家
//
//  Created by Aaron on 15/1/12.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "ShadowColor.h"

@implementation ShadowColor

- (id)initWithColorFrame:(CGRect)frame
              firstColor:(UIColor *)firstColor
             secondColor:(UIColor *)secondColor
              thirtColor:(UIColor *)thirtColor
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        
        gradient.frame = frame;
        
        gradient.colors = [NSArray arrayWithObjects:(id)firstColor.CGColor,
                           (id)secondColor.CGColor,
                           (id)thirtColor.CGColor,nil];
        
        [self.layer insertSublayer:gradient atIndex:0];
        
    }
    return self;
}




@end







