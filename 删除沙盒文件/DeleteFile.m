//
//  CommonModel.m
//  U-健康管家
//
//  Created by Aaron on 15/3/9.
//  Copyright (c) 2015年 ZYJ. All rights reserved.
//

#import "DeleteFile.h"

@implementation CommonModel



// 删除沙盒里的文件
+ (void)deleteFile:(NSString *)dbName
{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    //文件名@"MySqliteDB.db"
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:dbName];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    // 如果不存在就不做操作
    if (!blHave) {
        return;
    }
    // 如果存在就删除
    else {
        BOOL blDele= [fileManager removeItemAtPath:uniquePath error:nil];
        if (blDele)
        {
            NSLog(@"dele success");
        }
        else
        {
            NSLog(@"dele fail");
        }
    }
}



@end






