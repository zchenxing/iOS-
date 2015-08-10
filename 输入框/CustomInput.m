//
//  CustomInput.m
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "CustomInput.h"

@interface CustomInput () <UITextFieldDelegate>

STATEMENT_Strong UIView*        basicView;
STATEMENT_Strong UITextField*   textField;

@end

@implementation CustomInput
@synthesize basicView = _basicView;
@synthesize textField = _textField;

- (instancetype)initWithTitle:(NSString *)titleStr {
    
    self = [super initWithFrame:CGRectMake(0,0, Main_Width, Main_Height)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _basicView = [[UIView alloc]init];
        _basicView.backgroundColor = [UIColor whiteColor];
        _basicView.center = CGPointMake(Main_Width/2, Main_Height/2);
        _basicView.bounds = CGRectMake(0, 0, Main_Width-80, 120);
        _basicView.layer.borderColor = Header_Color.CGColor;
        _basicView.layer.borderWidth = 1;
        _basicView.layer.cornerRadius = 5;
        _basicView.clipsToBounds = YES;
        [self addSubview:_basicView];
        [_basicView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(40);
            make.right.equalTo(self.mas_right).with.offset(-40);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_equalTo(120);
        }];
        
        _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.2, 0.2);
        [UIView animateWithDuration:0.3 animations:^{
            _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        }];
        
        
        
        UILabel *title_lab          = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Main_Width-80, 25)];
        title_lab.text              = titleStr;
        title_lab.textAlignment     = NSTextAlignmentCenter;
        title_lab.textColor         = [UIColor whiteColor];
        title_lab.backgroundColor   = Header_Color;
        title_lab.font              = [UIFont systemFontOfSize:12];
        [_basicView addSubview:title_lab];

        
        
        _textField = [[UITextField alloc]init];
        _textField.layer.cornerRadius = 5;
        _textField.layer.borderColor = Header_Color.CGColor;
        _textField.layer.borderWidth = 1;
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.delegate = self;
        _textField.font = [UIFont systemFontOfSize:15];
        [_basicView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_basicView.mas_left).with.offset(15);
            make.right.equalTo(_basicView.mas_right).with.offset(-15);
            make.top.equalTo(title_lab.mas_bottom).with.offset(15);
            make.height.mas_equalTo(30);
        }];
        
        
        
        
        
        UIButton *cancel_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancel_btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [cancel_btn setTitle:@"取消" forState:0];
        [cancel_btn setTitleColor:[UIColor whiteColor] forState:0];
        cancel_btn.backgroundColor = Header_Color;
        [cancel_btn addTarget:self action:@selector(buttonWithPressure:) forControlEvents:1 << 6];
        cancel_btn.tag = 10;
        [_basicView addSubview:cancel_btn];
        [cancel_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_basicView.mas_left).with.offset(0);
            make.bottom.equalTo(_basicView.mas_bottom).with.offset(0);
            make.right.equalTo(self.mas_centerX).with.offset(-0.5);
            make.height.mas_equalTo(30);
        }];
        
        
        
        UIButton *comfirm_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        comfirm_btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [comfirm_btn setTitle:@"确认" forState:0];
        comfirm_btn.backgroundColor = Header_Color;
        [comfirm_btn setTitleColor:[UIColor whiteColor] forState:0];
        [comfirm_btn addTarget:self action:@selector(buttonWithPressure:) forControlEvents:1 << 6];
        comfirm_btn.tag = 11;
        [_basicView addSubview:comfirm_btn];
        [comfirm_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_centerX).with.offset(0.5);
            make.right.equalTo(_basicView.mas_right).with.offset(0);
            make.top.equalTo(cancel_btn.mas_top).with.offset(0);
            make.bottom.equalTo(cancel_btn.mas_bottom).with.offset(0);
        }];
        
    }
    return self;
}


#pragma mark -Private Method
- (void)buttonWithPressure:(UIButton *)sender {
 
    if (sender.tag == 10) {
        [UIView animateWithDuration:0.3 animations:^{
            _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
            _basicView.alpha = 0;
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    else {
        [self.delegate customInputText:_textField.text];
        [UIView animateWithDuration:0.3 animations:^{
            _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
            _basicView.alpha = 0;
        }completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}



#pragma mark - UITextFieldDelegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    [UIView animateWithDuration:0.3 animations:^{
        if (iPhone4s) {
            _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-80);
        }
        else {
            _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-50);
        }
    }];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.3 animations:^{
        _basicView.center = CGPointMake(Main_Width/2, Main_Height/2);
    }];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

@end
