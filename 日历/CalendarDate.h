//
//  CalendarDate.h
//  U-健康管家
//
//  Created by Aaron on 15/1/30.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarDate : NSObject

/**
 *几号
 */
+ (NSInteger)day:(NSDate *)date;

/**
 *几月
 */
+ (NSInteger)month:(NSDate *)date;

/**
 *哪一年
 */
+ (NSInteger)year:(NSDate *)date;

/**
 *这个月第一周
 */
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

/**
 *这个月全部天数
 */
+ (NSInteger)totaldaysInMonth:(NSDate *)date;

/**
 *上个月
 */
+ (NSDate *)lastMonth:(NSDate *)date;

/**
 *下个月
 */
+ (NSDate *)nextMonth:(NSDate *)date;

/**
 *昨年的今天
 */
+ (NSDate *)lastYear:(NSDate *)date;

/**
 *明年的今天
 */
+ (NSDate *)nextYear:(NSDate *)date;

/**
 *今天 yyyy-MM-dd
 *@return yyyy-MM-dd
 */
+ (NSString *)today;

/**
 *本年本月 yyyy-MM
 *@return yyyy-MM
 */
+ (NSString *)monthOfYear;

/**
 *本月
 *@return 返回MM
 */
+ (NSString *)thisMonth;

/**
 *当前时间 yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)nowTime;

@end
