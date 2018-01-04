//
//  ModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIWorkFlowModel.h"

@implementation HTMIWorkFlowModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (HTMIWorkFlowModel *)modelWithDictionary:(NSDictionary *)dictionary {
    return [[HTMIWorkFlowModel alloc]initWithDictionary:dictionary];
}

@end
