//
//  SubmodelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/11.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "SubmodelTemplate.h"

@implementation SubmodelTemplate

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (SubmodelTemplate *)modelWithDictionary:(NSDictionary *)dictionary {
    return [[SubmodelTemplate alloc]initWithDictionary:dictionary];
}

@end
