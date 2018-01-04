//
//  DataBase.h
//  HTMITemplate
//
//  Created by wlq on 17/5/8.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject

+ (DataBase *)shareInstance;
+ (void)cache:(Class)cls data:(NSDictionary *)data;
+ (void)requestDataWithClass:(Class)cls finishedCallBack:(void(^)(NSDictionary * response))finishedCallBack;

@end
