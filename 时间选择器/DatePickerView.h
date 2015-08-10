//
//  DatePicker.h
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewDelegate <NSObject>

- (void)chooseDate:(NSString *)dateStr;

@end

@interface DatePickerView : UIView

- (id)initWithDatePickerTitle:(NSString *)title;

@property (nonatomic,weak)id<DatePickerViewDelegate>delegate;

@end
