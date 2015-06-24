//
//  requestOperation.m
//  E-learning
//
//  Created by rimi on 14-10-11.
//  Copyright (c) 2014年 朱元杰. All rights reserved.
//

#import "requestOperation.h"
#import "AFNetworking.h"
#import "JSONKit.h"

@implementation requestOperation

static NSString * base64hash = @"T62tz1XHCUjk8NBveQaInA3GMswumo7gc~9VZRdqhbKyiOFlJS-xPfWE04rLY5Dp";

+ (void)AFAddressname:(NSString*)addressName
              parmas:(NSMutableDictionary *)parmas
      RequestSuccess:(void(^)(id result))success
           failBlcok:(void(^)(void))failBlcok
{
    
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",BASE_URL,addressName];

    requestManager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript",@"text/plain", nil];
    
    
    [requestManager POST:urlStr parameters:parmas success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#if defined(DEBUG)||defined(_DEBUG)
        NSLog(@"error == %@",[error localizedDescription]);
#endif
        failBlcok();
    } timeOut:5];
}



- (NSData *)HTTPBodyWithDictionary:(NSMutableDictionary*)dictionary
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in [dictionary allKeys]) {
        id value = [dictionary objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [array addObject:[NSString stringWithFormat:@"%@ = %@",key,value]];
        }
    }
    NSString *dataString = [array componentsJoinedByString:@"&"];
    NSLog(@"== %@",dataString);
    return [dataString dataUsingEncoding:NSUTF8StringEncoding];
}




-(NSString *)decodeString:(NSString*)strSrc
{
    if ([self checkSecurityValid:strSrc]) {
        NSMutableString * result=[[NSMutableString alloc] initWithCapacity:10];
        for (int i=0; i<[strSrc length]; i++) {
            NSRange temp1=[base64hash rangeOfString:[NSString stringWithFormat:@"%c",
                                                     [strSrc characterAtIndex:i]]];
            if (temp1.length==0) {
                [result appendString:@"000000"];
            }else{
                NSMutableString * strT=[[NSMutableString alloc] initWithString:
                                        [self decimalTOBinary:temp1.location backLength:6]];
                [result appendString:strT];
                
            }
        }
        while ([[result substringFromIndex:result.length-8] isEqualToString:@"00000000"]) {
            result=[NSMutableString stringWithString:[result substringWithRange:
                                                      NSMakeRange(0, result.length-8)]];
        }
        Byte * byte2=(Byte*)malloc(result.length/8);
        for (int i=0; i<(result.length/8); i++) {
            byte2[i]=(Byte)[[self toDecimalSystemWithBinarySystem:[result substringWithRange:
                                                                   NSMakeRange(i*8,8)]]
                            integerValue];
        }
        NSData * dTemp=[NSData dataWithBytes:byte2 length:result.length/8];
        NSString * strTemp=[[NSString alloc] initWithData:dTemp encoding:NSUTF8StringEncoding];
        free(byte2);
        return strTemp;
    }
    return nil;
}
- (NSString *)decimalTOBinary:(uint16_t)tmpid backLength:(int)length
{
    NSString *a = @"";
    while (tmpid)
    {
        a = [[NSString stringWithFormat:@"%d",tmpid%2] stringByAppendingString:a];
        if (tmpid/2 < 1)
        {
            break;
        }
        tmpid = tmpid/2 ;
    }
    
    if (a.length <= length)
    {
        NSMutableString *b = [[NSMutableString alloc]init];;
        for (int i = 0; i < length - a.length; i++)
        {
            [b appendString:@"0"];
        }
        
        a = [b stringByAppendingString:a];
        
    }
    return a;
}
//检查有效性
-(BOOL)checkSecurityValid:(NSString*)str
{
    if ([self isTextEmpty:str]) {
        return NO;
    }
    return YES;
}
-(BOOL)isTextEmpty:(NSString*)str{
    return !([str respondsToSelector:@selector(length)] && [str length]);
}
- (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    
    return result;
}


@end
