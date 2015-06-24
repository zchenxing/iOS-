//
//  StaticFunction.h
//  E-LearningForiPhone
//
//  Created by rimi on 14-7-9.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StaticFunction : NSObject

/**
 *  获取字符串范围大小
 *
 *  @param string 字符串
 *  @param font   字体
 *  @param size   最大范围
 *
 *  @return 获取范围
 */
+ (CGSize)getContentSizeWithString:(NSString*)string font:(UIFont*)font size:(CGSize)size;

+ (UIFont*)getFontWithString:(NSString*)string size:(CGSize)size maxsize:(CGSize)maxsize fontWidth:(int)fontWidth;

/**
 *  获取蹄片路径
 *
 *  @param imagePath 通过后台地址返回完整url
 *
 *  @return url
 */
+ (NSURL *)getImageUrlWithString:(NSString *)imagePath;

/**
 *  @param filePath 字符串,不包含http地址的图片地址
 *
 */
+ (NSString*)getFullImagePath:(NSString*)filePath;

///**
// *  0,未就业； 1，就业
// */
//+ (NSString*)getWorkString:(BOOL)flag;// companyName:(NSString*)name;
//
//+ (NSString*)genaUUID;
//
//+ (NSDate*) convertDateFromString:(NSString*)uiDate;

@end
