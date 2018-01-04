//
//  NetWork.h
//  HTMITemplate
//
//  Created by wlq on 17/5/8.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWork : NSObject

typedef NS_ENUM(NSUInteger, MethodType) {
    MethodGetType,
    MethodPostType,
};

+ (void)requestDataWithType:(MethodType)type URLString:(NSString *)URLString parameter:(NSDictionary *)parameter finishedCallBack:(void(^)(NSDictionary * result))finishedCallBack;

@end
