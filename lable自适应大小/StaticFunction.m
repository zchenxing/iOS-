//
//  StaticFunction.m
//  E-LearningForiPhone
//
//  Created by rimi on 14-7-9.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import "StaticFunction.h"

#define _FONT(_fontSize) [UIFont systemFontOfSize:_fontSize]
#define IOS7   ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0)

@implementation StaticFunction

+ (CGSize)getContentSizeWithString:(NSString*)string font:(UIFont*)font size:(CGSize)size
{
    if(IOS7){
        NSDictionary *attribute = @{NSFontAttributeName: font};
        CGSize result = [string boundingRectWithSize:CGSizeMake(size.width, size.height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        return result;
    }
    else{
        CGSize labelSize = [string sizeWithFont:font
                            constrainedToSize:CGSizeMake(size.width, MAXFLOAT)
                                lineBreakMode:NSLineBreakByWordWrapping];
        return labelSize;
    }
    
}

+ (UIFont*)getFontWithString:(NSString*)string size:(CGSize)size maxsize:(CGSize)maxsize fontWidth:(int)fontWidth
{
    int fontSize = fontWidth;
    UIFont *font = _FONT(fontSize);
    
    CGSize strSize = [StaticFunction getContentSizeWithString:string font:font size:maxsize];
    while (strSize.width > size.width && fontSize > 0) {
        fontSize--;
        font = _FONT(fontSize);
        strSize = [StaticFunction getContentSizeWithString:string font:font size:maxsize];
    }
    return font;
}

//+ (NSString*)getWorkString:(BOOL)flag// companyName:(NSString*)name
//{
//    if(flag)
//        return [NSString stringWithFormat:@"就业公司："];
//    else
//        return @"未就业";
//}

//+ (NSString*)genaUUID
//{
//    CFUUIDRef uuid_ref = CFUUIDCreate(nil);
//    CFStringRef uuid_string_ref= CFUUIDCreateString(nil, uuid_ref);
//    CFRelease(uuid_ref);
//    NSString *uuid = [NSString stringWithString:(__bridge_transfer NSString*)uuid_string_ref];
//    return uuid;
//}
//
//+ (NSDate*) convertDateFromString:(NSString*)uiDate
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
//    [formatter setDateFormat:@"mm:ss"];
//    NSDate *date=[formatter dateFromString:uiDate];
//    return date;
//}

@end
