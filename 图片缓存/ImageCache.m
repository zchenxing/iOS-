//
//  BTECGModel.m
//  善和健康管家
//
//  Created by Aaron on 15/6/3.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "ImageCache.h"

@implementation ImageCache


//将图片保存到本地
+ (void)SaveImageToLocal:(UIImage *)image Keys:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    [preferences setObject:UIImagePNGRepresentation(image) forKey:key];
}

//本地是否有相关图片
+ (BOOL)LocalHaveImage:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    NSData* imageData = [preferences objectForKey:key];
    if (imageData)
    {
        return YES;
    }
    return NO;
}

//从本地获取图片
+ (UIImage*)GetImageFromLocal:(NSString*)key
{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    //[preferences persistentDomainForName:LocalPath];
    NSData* imageData = [preferences objectForKey:key];
    UIImage* image;
    if (imageData) {
        image = [UIImage imageWithData:imageData];
    }
    else
    {
        NSLog(@"未从本地获得图片");
    }
    return image;
}

@end
