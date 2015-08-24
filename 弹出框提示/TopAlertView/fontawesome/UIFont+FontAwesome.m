//
//  UIFont+FontAwesome.m
//  FontAwesome-iOS Demo
//
//  Created by Alex Usbergo on 1/16/13.
//  Copyright (c) 2013 Alex Usbergo. All rights reserved.
//

#import "UIFont+FontAwesome.h"
#import "NSString+FontAwesome.h"

@implementation UIFont (FontAwesome)

#pragma mark - Public API
+ (UIFont*)fontAwesomeFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:kFontAwesomeFamilyName size:size];
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com