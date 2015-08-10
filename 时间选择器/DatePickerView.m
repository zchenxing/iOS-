//
//  DatePicker.m
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "DatePickerView.h"

@interface DatePickerView ()

STATEMENT_Strong UIView*            pickerBisicView;
STATEMENT_Strong UIDatePicker*      datePicker;

@end

@implementation DatePickerView
@synthesize pickerBisicView = _pickerBisicView;

- (id)initWithDatePickerTitle:(NSString *)title
{
    self = [super initWithFrame:CGRectMake(0, 0, Main_Width, Main_Height)];
    if (self) {
        
        _pickerBisicView = [[UIView alloc]init];
        _pickerBisicView.frame = CGRectMake(0, Main_Height, Main_Width, 180);
        _pickerBisicView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_pickerBisicView];
        
        [UIView animateWithDuration:0.3 animations:^{
            _pickerBisicView.frame = CGRectMake(0, Main_Height-180, Main_Width, 180);
        }];
        
        
        
        UILabel *title_lab = [[UILabel alloc]init];
        title_lab.text = [NSString stringWithFormat:@"   %@",title];
        title_lab.textColor = [UIColor grayColor];
        title_lab.backgroundColor = COLOR(241, 241, 241, 1);
        title_lab.font = [UIFont systemFontOfSize:15];
        title_lab.layer.borderColor = COLOR(223, 223, 223, 1).CGColor;
        title_lab.layer.borderWidth = 1;
        [_pickerBisicView addSubview:title_lab];
        [title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pickerBisicView.mas_left).with.offset(-1);
            make.right.equalTo(_pickerBisicView.mas_right).with.offset(1);
            make.top.equalTo(_pickerBisicView.mas_top).with.offset(0);
            make.height.mas_equalTo(30);
        }];
        
        
        UIButton *confirm_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [confirm_btn setTitle:@"确认" forState:0];
        [confirm_btn setTitleColor:Header_Color forState:0];
        confirm_btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [confirm_btn addTarget:self action:@selector(confirmChoose) forControlEvents:1 << 6];
        [_pickerBisicView addSubview:confirm_btn];
        [confirm_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_pickerBisicView.mas_right).with.offset(0);
            make.top.equalTo(_pickerBisicView.mas_top).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        
          
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.datePickerMode = UIDatePickerModeDate;

        [_pickerBisicView addSubview:_datePicker];
        [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pickerBisicView.mas_left).with.offset(0);
            make.right.equalTo(_pickerBisicView.mas_right).with.offset(0);
            make.top.equalTo(title_lab.mas_bottom).with.offset(0);
            make.bottom.equalTo(_pickerBisicView.mas_bottom).with.offset(0);
        }];

        
        UITapGestureRecognizer* tapRecognizer =
        [[UITapGestureRecognizer alloc]initWithTarget:self
                                               action:@selector(removeSelfView)];
        [self addGestureRecognizer:tapRecognizer];

    }
    return self;
}

// 确认选择
- (void)confirmChoose {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateStr = [dateFormatter stringFromDate:_datePicker.date];
    
    
    [self.delegate chooseDate:dateStr];
    [self removeSelfView];
}


- (void)removeSelfView {
    [UIView animateWithDuration:0.3 animations:^{
        _pickerBisicView.frame = CGRectMake(0, Main_Height, Main_Width, 180);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
