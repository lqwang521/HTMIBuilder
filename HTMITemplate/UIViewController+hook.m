//
//  UIViewController+hook.m
//  HTMITemplate
//
//  Created by wlq on 23/11/2017.
//  Copyright © 2017 htmi. All rights reserved.
//

#import "UIViewController+hook.h"
#import "HTMICurrentViewController.h"
#import <Aspects.h>

@implementation UIViewController (hook)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
            kHTMICurrentViewController = aspectInfo.instance;
        } error:NULL];
    });
}
    
@end
