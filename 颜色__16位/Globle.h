//
//  Globle.h
//  U-健康管家
//
//  Created by Aaron on 15/1/13.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//  [Globle colorFromHexRGB:@"2BB891"]

#import <Foundation/Foundation.h>

@interface Globle : NSObject

@property (nonatomic,assign) float globleWidth;
@property (nonatomic,assign) float globleHeight;
@property (nonatomic,assign) float globleAllHeight;

+ (Globle *)shareInstance;
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
