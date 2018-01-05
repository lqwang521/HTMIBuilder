//
//  ModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMILoginInterface.h"

@interface HTMILoginModel : NSObject <HTMILoginModelInterface>

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) NSDictionary * map;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSArray * plan;
@property (nonatomic,copy) NSString * name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (HTMILoginModel *)modelWithDictionary:(NSDictionary *)dictionary;

@end
