//
//  ModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfaceTemplate.h"

@interface ModelTemplate : NSObject <ModelInterface>

@property (nonatomic,strong) NSArray * models;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (ModelTemplate *)modelWithDictionary:(NSDictionary *)dictionary;

@end
