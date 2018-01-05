//
//  ModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginModel.h"

@implementation HTMILoginModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (HTMILoginModel *)modelWithDictionary:(NSDictionary *)dictionary {
    return [[HTMILoginModel alloc]initWithDictionary:dictionary];
}

@end
