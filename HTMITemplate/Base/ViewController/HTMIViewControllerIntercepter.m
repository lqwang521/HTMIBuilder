//
//  CTViewControllerIntercepter.m
//  Interceptor
//
//  Created by casa on 4/17/15.
//  Copyright (c) 2015 alibaba. All rights reserved.
//

#import "HTMIViewControllerIntercepter.h"
#import "Aspects/Aspects.h"
#import <UIKit/UIKit.h>

@implementation HTMIViewControllerIntercepter

+ (void)load
{
    [super load];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTMIViewControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMIViewControllerIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        ///* 在这里做好方法拦截 */
        [UIViewController aspect_hookSelector:@selector(viewDidLoad)
                                  withOptions:AspectPositionBefore
                                   usingBlock:^(id<AspectInfo>aspectInfo){
                                       
                                       [self viewDidLoad:[aspectInfo instance]];
                                       
                                   } error:NULL];
        
        //这个方法因为Bugly不能调用了
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:)
                                  withOptions:AspectPositionAfter
                                   usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
                                       [self ViewWillAppear:animated viewController:[aspectInfo instance]];
                                   } error:NULL];
        
        [UIViewController aspect_hookSelector:@selector(viewDidAppear:)
                                  withOptions:AspectPositionAfter
                                   usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
                                       
                                       [self viewDidAppear:animated viewController:[aspectInfo instance]];
                                       
                                   } error:NULL];
        
        [UIViewController aspect_hookSelector:@selector(viewWillDisappear:)
                                  withOptions:AspectPositionAfter
                                   usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
                                       
                                       [self viewWillDisappear:animated viewController:[aspectInfo instance]];
                                       
                                   } error:NULL];
        
    }
    return self;
}

#pragma mark - fake methods

- (void)customSetStatusBarStyle:(UIViewController *)viewController{
    
    
    if ([viewController isKindOfClass:[UIInputViewController class]] || [viewController isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
        return;
    }
   
}

- (void)viewDidLoad:(UIViewController *)viewController{
    
    [self customSetStatusBarStyle:viewController];
}

- (void)ViewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController{

}

- (void)viewDidAppear:(BOOL)animated viewController:(UIViewController *)viewController{
    
}

- (void)viewWillDisappear:(BOOL)animated viewController:(UIViewController *)viewController {

}

- (BOOL)isMXChatVC:(UIViewController *)vc {
    Class mxClass = NSClassFromString(@"WBPrivateMessageViewController");
    if ([vc isMemberOfClass:mxClass]) {
        return YES;
    }
    
    return NO;
}

@end
