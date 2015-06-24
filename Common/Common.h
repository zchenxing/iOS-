//
//  CommonModel.h
//  U-健康管家
//
//  Created by Aaron on 15/3/9.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject


/**
 *冒泡排序 获取到数组中得最大值和最小值，由小到大
 */
+ (NSMutableArray *)sortArr:(NSMutableArray *)arr;



/**
 *两个数组比较是否所有元素都相等
 */
+ (BOOL)arrTheSameAsOtherArr:(NSMutableArray *)arr
                    otherArr:(NSMutableArray *)otherArr;
@end
