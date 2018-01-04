//
//  AppDelegate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "AppDelegate.h"
#import "ControllerTemplate.h"
#import "AppDelegate+RegisterRoute.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[ControllerTemplate new]];
    [self registerNavgationRouter];
    [self registerSchemaRouter];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    
    //    return [[JLRoutes routesForScheme:@"HTMIRoute"] routeURL:url];
    // 默认的路由 跳转等等
    if ([[url scheme] isEqualToString:HTMIDefaultRouteSchema]) {
        
        return [[JLRoutes globalRoutes] routeURL:url];
    }
    // http
    else if ([[url scheme] isEqualToString:HTMIHTTPRouteSchema])
    {
        return [[JLRoutes routesForScheme:HTMIHTTPRouteSchema] routeURL:url];
    }
    // https
    else if ([[url scheme] isEqualToString:HTMIHTTPsRouteSchema])
    {
        return [[JLRoutes routesForScheme:HTMIHTTPsRouteSchema] routeURL:url];
    }
    // Web交互请求
    else if ([[url scheme] isEqualToString:HTMIWebHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:HTMIWebHandlerRouteSchema] routeURL:url];
    }
    // 请求回调
    else if ([[url scheme] isEqualToString:HTMIComponentsCallBackHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:HTMIComponentsCallBackHandlerRouteSchema] routeURL:url];
    }
    // 未知请求
    else if ([[url scheme] isEqualToString:HTMIUnknownHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:HTMIUnknownHandlerRouteSchema] routeURL:url];
    }
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
