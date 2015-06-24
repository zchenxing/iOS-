//
//  CommonModel.h
//  U-健康管家
//
//  Created by Aaron on 15/3/9.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerifyPhoneNumder : NSObject

/**
 *手机号码验证 MODIFIED BY HELENSONG
 *param mobileNum 电话号码
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;


@end
