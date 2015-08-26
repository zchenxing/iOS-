//
//  ZYJAlertTextView.m
//  善和健康管家
//
//  Created by Aaron on 15/8/17.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "ZYJAlertTextView.h"

@implementation ZYJAlertTextView

+ (ZYJAlertTextView *)showZYJTextAlertWithTitle:(NSString *)title
                                      textTitle:(NSString *)textTitle
                                    placeholder:(NSString *)placeholder
                                   keyboardType:(UIKeyboardType)keyboardType
                                       delegate:(id<ZYJAlertTextViewDelegate>)delegate
                                     parentView:(UIView*)parentView
{
    ZYJAlertTextView *textAlert = [[ZYJAlertTextView alloc]initWithTitle:title textName:textTitle placeholder:placeholder];
    textAlert.delegate = delegate;
    textAlert.textField.keyboardType = keyboardType;
    [parentView addSubview:textAlert];
    return textAlert;
}



- (instancetype)initWithTitle:(NSString *)title
                     textName:(NSString *)textName
                  placeholder:(NSString *)placeholder {
    
    self = [super initWithFrame:CGRectMake(0, 0, Main_Width, Main_Height)];
    
    if (self) {
        
        UIView *hiddenView = [[UIView alloc]initWithFrame:self.frame];
        hiddenView.backgroundColor = [UIColor blackColor];
        hiddenView.alpha = 0.3;
        [self addSubview:hiddenView];
        
        
        _basicView = [[UIView alloc]init];
        _basicView.backgroundColor = [UIColor whiteColor];
        _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-40);
        _basicView.bounds = CGRectMake(0, 0, Main_Width-50, 150);
        _basicView.clipsToBounds = YES;
        _basicView.layer.cornerRadius = 5;
        _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        _basicView.alpha = 0.2;
        [self addSubview:_basicView];
        
        [UIView animateWithDuration:0.2 animations:^{
            _basicView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            _basicView.alpha = 1.0;
        }];
        
        
        
        UILabel *title_lab = [[UILabel alloc]init];
        title_lab.frame = CGRectMake(-1, -1, CGRectGetWidth(_basicView.frame)+2, 45);
        title_lab.text = title;
        title_lab.font = [UIFont boldSystemFontOfSize:18];
        title_lab.textAlignment = NSTextAlignmentCenter;
        title_lab.layer.borderColor = COLOR(220, 220, 220, 1).CGColor;
        title_lab.layer.borderWidth = 1;
        [_basicView addSubview:title_lab];
        
        
        UILabel *textName_lab = [[UILabel alloc]init];
        textName_lab.frame = CGRectMake(0, CGRectGetHeight(title_lab.frame)+15, 90, 30);
        textName_lab.textAlignment = NSTextAlignmentRight;
        textName_lab.text = textName;
        [_basicView addSubview:textName_lab];
        
        
        
        _textField = [[UITextField alloc]init];
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.frame = CGRectMake(CGRectGetMaxX(textName_lab.frame)+10,
                                      CGRectGetMinY(textName_lab.frame),
                                      CGRectGetWidth(_basicView.frame)-
                                      CGRectGetWidth(textName_lab.frame)-30, 30);
        _textField.delegate = self;
        _textField.placeholder = placeholder;
        [_basicView addSubview:_textField];
        
        
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.layer.borderWidth = 0.5;
        cancelBtn.layer.borderColor = COLOR(210, 210, 210, 1).CGColor;
        [cancelBtn setTitleColor:[UIColor blackColor] forState:0];
        [cancelBtn setTitle:@"取消" forState:0];
        cancelBtn.frame = CGRectMake(0, CGRectGetHeight(_basicView.frame)-40,
                                     CGRectGetWidth(_basicView.frame)/2, 40);
        [_basicView addSubview:cancelBtn];
        
        
        
        UIButton *comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        comfirmBtn.layer.borderWidth = 0.5;
        comfirmBtn.layer.borderColor = COLOR(210, 210, 210, 1).CGColor;
        [comfirmBtn setTitleColor:[UIColor blackColor] forState:0];
        [comfirmBtn setTitle:@"确认" forState:0];
        comfirmBtn.frame = CGRectMake(CGRectGetWidth(_basicView.frame)/2,
                                      CGRectGetHeight(_basicView.frame)-40,
                                     CGRectGetWidth(_basicView.frame)/2, 40);
        [_basicView addSubview:comfirmBtn];
        
        
        cancelBtn.tag = 10;
        comfirmBtn.tag = 11;
        [cancelBtn addTarget:self action:@selector(buttonWithPressured:) forControlEvents:1 << 6];
        [comfirmBtn addTarget:self action:@selector(buttonWithPressured:) forControlEvents:1 << 6];
    }
    return self;
}


- (void)buttonWithPressured:(UIButton *)sender {
    
    if (sender.tag == 11) {
        if ([self.delegate respondsToSelector:@selector(alertComfirm:)]) {
            [self.delegate alertComfirm:_textField.text];
        }
    }
    [UIView animateWithDuration:0.45 animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self endEditing:YES];
}



#pragma mark - UITextFieldDelegate methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    
    if (iPhone4s) {
        [UIView animateWithDuration:0.25 animations:^{
            _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-90);
        }];
    }
    else if (iPhone5s) {
        [UIView animateWithDuration:0.25 animations:^{
            _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-70);
        }];
    }
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.25 animations:^{
        _basicView.center = CGPointMake(Main_Width/2, Main_Height/2-40);
    }];
    return YES;
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}



@end
