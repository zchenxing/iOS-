//
//  BTECGModel.h
//  善和健康管家
//
//  Created by Aaron on 15/6/3.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

/**
 *将图片保存到本地
 */
+ (void)SaveImageToLocal:(UIImage *)image Keys:(NSString *)key;

/**
 *本地是否有相关图片
 */
+ (BOOL)LocalHaveImage:(NSString *)key;

/**
 *从本地获取图片
 */
+ (UIImage *)GetImageFromLocal:(NSString *)key;

@end
