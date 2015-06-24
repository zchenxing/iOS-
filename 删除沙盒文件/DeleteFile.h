//
//  CommonModel.h
//  U-健康管家
//
//  Created by Aaron on 15/3/9.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeleteFile : NSObject


/**
 *删除沙盒里的文件
 */
+ (void)deleteFile:(NSString *)dbName;


@end
