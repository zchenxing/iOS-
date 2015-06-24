//
//  CommonModel.m
//  U-健康管家
//
//  Created by Aaron on 15/3/9.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "DeleteFile.h"

@implementation Common


/**
 *冒泡排序 获取到数组中得最大值和最小值，由小到大
 */
+ (NSMutableArray *)sortArr:(NSMutableArray *)arr
{
    for (int i = 0; i < arr.count; i++) {
        for (int j = 0; j < arr.count - i - 1; j++) {
            if ([arr[j+1] doubleValue] < [arr[j] doubleValue]) {
                NSString *temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    return arr;
}


/**
 *两个数组比较是否所有元素都相等
 */
+ (BOOL)arrTheSameAsOtherArr:(NSMutableArray *)arr otherArr:(NSMutableArray *)otherArr
{
    BOOL equal = YES;
    for (int i = 0; i < arr.count; i++) {
        for (int j = 0; j < otherArr.count; j++) {
            if (![arr[i] isEqualToString:otherArr[j]]) {
                equal = NO;
                break;
            }
        }
    }
    return equal;
}


@end






