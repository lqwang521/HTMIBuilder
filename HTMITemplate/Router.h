//
//  Router.h
//  HTMITemplate
//
//  Created by wlq on 17/5/8.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Router : NSObject

@property (nonatomic,strong) NSMutableDictionary * params;

+ (instancetype)sharedInstance;

- (void)addParamWithKey:(NSString *)key value:(id)value;

- (void)clearParams;

- (void)push:(NSString *)path;

@end
