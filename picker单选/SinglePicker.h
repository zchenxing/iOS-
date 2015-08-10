//
//  SinglePicker.h
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SinglePicker.h"
@protocol SinglePickerDelegate <NSObject>

- (void)singlePickerWithSelecte:(NSString *)resultStr;

@end

@interface SinglePicker : UIView

- (id)initWithPickerArray:(NSArray *)pickerArr title:(NSString *)title;

@property (nonatomic,weak)id<SinglePickerDelegate>delegate;

@end
