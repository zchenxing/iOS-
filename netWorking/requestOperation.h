//
//  requestOperation.h
//  E-learning
//
//  Created by rimi on 14-10-11.
//  Copyright (c) 2014年 朱元杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface requestOperation : NSObject

@property (nonatomic,strong)AFHTTPRequestOperation *requestOperation;


+(void)AFAddressname:(NSString*)addressName parmas:(NSMutableDictionary*)parmas RequestSuccess:(void(^)(id result))success failBlcok:(void(^)(void))failBlcok;

- (NSString*)decodeString:(NSString*)strSrc;

@end
