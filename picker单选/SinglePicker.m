//
//  SinglePicker.m
//  家庭圈
//
//  Created by Aaron on 15/7/20.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "SinglePicker.h"

@interface SinglePicker () <UIPickerViewDelegate,UIPickerViewDataSource>

STATEMENT_Strong UIView*            pickerBisicView;
STATEMENT_Strong UIPickerView*      pickerView;
STATEMENT_Strong NSMutableArray*    dataSource;
STATEMENT_Strong NSMutableString*   resultStr;
STATEMENT_Strong UILabel*           discription_lab;
STATEMENT_Strong NSString*          title_str;

@end

@implementation SinglePicker
@synthesize pickerBisicView     = _pickerBisicView;
@synthesize pickerView          = _pickerView;
@synthesize dataSource          = _dataSource;
@synthesize resultStr           = _resultStr;
@synthesize discription_lab     = _discription_lab;
@synthesize title_str           = _title_str;



- (id)initWithPickerArray:(NSArray *)pickerArr title:(NSString *)title
{
    self = [super initWithFrame:CGRectMake(0, 0, Main_Width, Main_Height)];
    if (self) {
        
        
        _title_str  = title;
        _dataSource = [NSMutableArray arrayWithArray:pickerArr];
        _resultStr  = [NSMutableString stringWithFormat:@"%@",_dataSource[0]];
        
        
        _pickerBisicView = [[UIView alloc]init];
        _pickerBisicView.frame = CGRectMake(0, Main_Height, Main_Width, 200);
        _pickerBisicView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_pickerBisicView];
        
        [UIView animateWithDuration:0.3 animations:^{
            _pickerBisicView.frame = CGRectMake(0, Main_Height-200, Main_Width, 200);
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
            make.height.mas_equalTo(40);
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
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
        
        
        
        _discription_lab = [[UILabel alloc]init];
        _discription_lab.textColor = Text_GrayColor;
        _discription_lab.font = [UIFont systemFontOfSize:13];
        [_pickerBisicView addSubview:_discription_lab];
        [_discription_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pickerBisicView.mas_left).with.offset(10);
            make.right.equalTo(_pickerBisicView.mas_right).with.offset(0);
            make.top.equalTo(title_lab.mas_bottom).with.offset(0);
            make.height.mas_equalTo(25);
        }];
        
        
        _pickerView = [[UIPickerView alloc]init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        [_pickerBisicView addSubview:_pickerView];
        [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_pickerBisicView.mas_left).with.offset(0);
            make.right.equalTo(_pickerBisicView.mas_right).with.offset(0);
            make.top.equalTo(_discription_lab.mas_bottom).with.offset(25);
            make.bottom.equalTo(_pickerBisicView.mas_bottom).with.offset(0);
        }];
        
        
        
        _discription_lab.text = [PickerStatusModel discriptionStatus:_resultStr];
        
        UITapGestureRecognizer* tapRecognizer =
        [[UITapGestureRecognizer alloc]initWithTarget:self
                                               action:@selector(removeSelfView)];
        [self addGestureRecognizer:tapRecognizer];

        
    }
    return self;
}


- (void)confirmChoose {
 
    [self.delegate singlePickerWithSelecte:_resultStr];
    [self removeSelfView];
}


- (void)removeSelfView {
    [UIView animateWithDuration:0.3 animations:^{
        _pickerBisicView.frame = CGRectMake(0, Main_Height, Main_Width, 180);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerViewDelegate  methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@",[_dataSource objectAtIndex:row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _resultStr = [NSMutableString stringWithFormat:@"%@",[_dataSource objectAtIndex:row]];
    _discription_lab.text = [PickerStatusModel discriptionStatus:_resultStr];

}

#pragma mark - UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _dataSource.count;
}

@end
