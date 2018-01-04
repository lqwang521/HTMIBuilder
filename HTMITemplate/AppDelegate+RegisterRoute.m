//
//  HTMIAppDelegate+RegisterRoute.m
//  JLRouteScheme
//
//  Created by lizhaojie on 16/11/30.
//  Copyright © 2016年 siemens. All rights reserved.
//

#import "AppDelegate+RegisterRoute.h"

#import "JLRoutes.h"
#import <objc/runtime.h>


@implementation AppDelegate (RegisterRoute)

#pragma mark - 普通的跳转路由注册
- (void)registerNavgationRouter
{
    // push
    // 路由 /com_htmi_navPush/:viewController
    [[JLRoutes globalRoutes] addRoute:HTMINavPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:NO parameters:parameters];
            
        });
        return YES;
    }];
    
    // present
    // 路由 /com_htmi_navPresent/:viewController
    [[JLRoutes globalRoutes] addRoute:HTMINavPresentRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self _handlerSceneWithPresent:YES parameters:parameters];
            
        });
        return YES;
    }];
    
    // sb push
    // 路由 /com_htmi_navStoryboardPush/:viewController
    [[JLRoutes globalRoutes] addRoute:HTMINavStoryBoardPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return YES;
    }];
    
}

#pragma mark - Schema 匹配
- (void)registerSchemaRouter
{
    // HTTP注册
    [[JLRoutes routesForScheme:HTMIHTTPRouteSchema] addRoute:@"/somethingHTTP" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return NO;
    }];
    
    // HTTPS注册
    [[JLRoutes routesForScheme:HTMIHTTPsRouteSchema] addRoute:@"/somethingHTTPs" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
    
    // 自定义 Schema注册
    [[JLRoutes routesForScheme:HTMIWebHandlerRouteSchema] addRoute:@"/somethingCustom" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
}

#pragma mark - Private
/// 处理跳转事件
- (void)_handlerSceneWithPresent:(BOOL)isPresent parameters:(NSDictionary *)parameters
{
    // 当前控制器
    NSString *controllerName = [parameters objectForKey:HTMIControllerNameRouteParam];
    UIViewController *currentVC = [HTMICurrentViewController currentViewController];
    UIViewController *toVC = [[NSClassFromString(controllerName) alloc] init];
    toVC.params = parameters;
    if (currentVC && currentVC.navigationController) {
        if (isPresent) {
            [currentVC.navigationController presentViewController:toVC animated:YES completion:nil];
        }else
        {
            [currentVC.navigationController pushViewController:toVC animated:YES];
        }
    }
}

/// 获取当前控制器
- (UIViewController *)_currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}


- (void)registerRouteWithScheme:(NSString *)scheme{
    //RouteOne://push/FirstNextViewController
    [[JLRoutes routesForScheme:scheme] addRoute:@"/push/:controller"handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        Class class = NSClassFromString(parameters[@"controller"]);
        
        UIViewController *nextVC = [[class alloc] init];
        
        [self paramToVc:nextVC param:parameters];
        UIViewController *currentVc = [HTMICurrentViewController currentViewController];
        [currentVc.navigationController pushViewController:nextVC animated:YES];
        return YES;
    }];
}
//传参数
-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

@end
