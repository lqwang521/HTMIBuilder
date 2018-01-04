//
//  ModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "<#Root#><#Unit#>Interface.h"

@interface <#Root#><#Unit#>Model : NSObject <<#Root#><#Unit#>ModelInterface>

<#ModelInterface#>
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (<#Root#><#Unit#>Model *)modelWithDictionary:(NSDictionary *)dictionary;

@end
