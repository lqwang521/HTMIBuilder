//
//  ModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "<#Root#><#Unit#>Model.h"

@implementation <#Root#><#Unit#>Model

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (<#Root#><#Unit#>Model *)modelWithDictionary:(NSDictionary *)dictionary {
    return [[<#Root#><#Unit#>Model alloc]initWithDictionary:dictionary];
}

@end
