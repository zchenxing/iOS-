//
//  CalendarDate.m
//  U-健康管家
//
//  Created by Aaron on 15/1/30.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "CalendarDate.h"

@implementation CalendarDate

+ (NSInteger)day:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                    fromDate:date];
    return [components day];
}



+ (NSInteger)month:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                    fromDate:date];
    return [components month];
}


+ (NSInteger)year:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                    fromDate:date];
    return [components year];
}


+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                         fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday
                                                  inUnit:NSCalendarUnitWeekOfMonth
                                                 forDate:firstDayOfMonthDate];
    
    return firstWeekday - 1;
}

+ (NSInteger)totaldaysInMonth:(NSDate *)date
{
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay
                                                               inUnit:NSCalendarUnitMonth
                                                              forDate:date];
    return daysInOfMonth.length;
}


+ (NSDate *)lastMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                    toDate:date
                                                                   options:0];
    return newDate;
}



+ (NSDate *)nextMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                    toDate:date
                                                                   options:0];
    return newDate;
}



+ (NSDate *)lastYear:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                    toDate:date
                                                                   options:0];
    return newDate;
}



+ (NSDate *)nextYear:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                    toDate:date
                                                                   options:0];
    return newDate;
}



+ (NSString *)today
{
    NSDate *date = [NSDate date];
    //格式化日期
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    //HH24小时制  hh12小时制
    formatter.dateFormat = @"yyyy-MM-dd";
    //地方时间
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CH"];
    //Date  转 String
    NSString *string = [formatter stringFromDate : date];
    
    return string;
}




// 本年本月 yyyy-MM
+ (NSString *)monthOfYear
{
    NSDate *date = [NSDate date];
    //格式化日期
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    //HH24小时制  hh12小时制
    formatter.dateFormat = @"yyyy-MM";
    //地方时间
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CH"];
    //Date  转 String
    NSString *string = [formatter stringFromDate : date];
    
    return string;
}



+ (NSString *)thisMonth
{
    NSDate *date = [NSDate date];
    //格式化日期
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    //HH24小时制  hh12小时制
    formatter.dateFormat = @"MM";
    //地方时间
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CH"];
    //Date  转 String
    NSString *string = [formatter stringFromDate : date];
    
    return string;
}





/**
 *当前时间 yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)nowTime
{
    //新建时间
    NSDate *date = [NSDate date];
    //格式化日期
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    //HH24小时制  hh12小时制
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //地方时间
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CH"];
    //Date  转 String
    NSString *string = [formatter stringFromDate : date];
    
    return string;
}

@end

