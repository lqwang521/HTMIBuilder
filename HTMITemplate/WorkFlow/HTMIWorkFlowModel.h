//
//  ModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMIWorkFlowInterface.h"

@interface HTMIWorkFlowModel : NSObject <HTMIWorkFlowModelInterface>

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) NSDictionary * map;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSArray * plan;
@property (nonatomic,copy) NSString * name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (HTMIWorkFlowModel *)modelWithDictionary:(NSDictionary *)dictionary;

@end
