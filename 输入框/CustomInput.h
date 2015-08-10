//
//  CustomInput.h
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomInputDelegate <NSObject>

@optional
- (void)customInputText:(NSString *)text;

@end

@interface CustomInput : UIView

@property(nonatomic,weak)id<CustomInputDelegate>delegate;

- (instancetype)initWithTitle:(NSString *)titleStr;
@end
