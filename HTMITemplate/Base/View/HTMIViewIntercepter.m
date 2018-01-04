//
//  HTMIViewIntercepter.m
//  HTMIBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIViewIntercepter.h"
#import "HTMIViewProtocol.h"
#import "Aspects.h"

@implementation HTMIViewIntercepter

+ (void)load
{
    [HTMIViewIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTMIViewIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMIViewIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 代码方式唤起view
        [UIView aspect_hookSelector:@selector(initWithFrame:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, CGRect frame){
            
            [self _init:aspectInfo.instance withFrame:frame];
        }  error:nil];
        
        // xib方式唤起view
        [UIView aspect_hookSelector:@selector(initWithCoder:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, NSCoder *aDecoder){
            
            // 在此时 IBOut 中 view 都为空， 需要Hook awakeFromNib 方法
            [self _init:aspectInfo.instance withCoder:aDecoder];
        } error:nil];
        
        // xib方式唤起view
        [UIView aspect_hookSelector:@selector(awakeFromNib) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            // 这时候可以初始化视图
            [self _awakFromNib:aspectInfo.instance];
        } error:nil];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_init:(UIView <HTMIViewProtocol>*)view withFrame:(CGRect)frame
{
    
    if ([view respondsToSelector:@selector(htmi_initializeForView)]) {
        [view htmi_initializeForView];
    }
    
    if ([view respondsToSelector:@selector(htmi_createViewForView)]) {
        [view htmi_createViewForView];
    }
}

- (void)_init:(UIView <HTMIViewProtocol>*)view withCoder:(NSCoder *)aDecoder
{
    if ([view respondsToSelector:@selector(htmi_initializeForView)]) {
        [view htmi_initializeForView];
    }
}

- (void)_awakFromNib:(UIView <HTMIViewProtocol>*)view
{
    if ([view respondsToSelector:@selector(htmi_createViewForView)]) {
        [view htmi_createViewForView];
    }
}


@end
