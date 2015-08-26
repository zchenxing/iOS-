//
//  ZYJAlertTextView.h
//  善和健康管家
//
//  Created by Aaron on 15/8/17.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYJAlertTextViewDelegate <NSObject>

- (void)alertComfirm:(NSString *)text;

@end

@interface ZYJAlertTextView : UIView <UITextFieldDelegate>

@property (nonatomic,weak)id<ZYJAlertTextViewDelegate>delegate;

@property (nonatomic,strong)UIView* basicView;

@property (nonatomic,strong)UITextField* textField;

+ (ZYJAlertTextView *)showZYJTextAlertWithTitle:(NSString *)title
                                      textTitle:(NSString *)textTitle
                                    placeholder:(NSString *)placeholder
                                   keyboardType:(UIKeyboardType)keyboardType
                                       delegate:(id<ZYJAlertTextViewDelegate>)delegate
                                     parentView:(UIView*)parentView;

- (instancetype)initWithTitle:(NSString *)title
                     textName:(NSString *)textName
                  placeholder:(NSString *)placeholder;

@end
