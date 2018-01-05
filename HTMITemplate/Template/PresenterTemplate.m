//
//  PresenterTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "PresenterTemplate.h"
//@class HTMIWorkFlowViewController;
#import "HTMIWorkFlowViewController.h"

@implementation PresenterTemplate

- (void)adapterWithView:(id<ViewInterface>)view viewModel:(id<ViewModelInterface>)viewModel {

    _view = view;
    _viewModel = viewModel;
    [self dynamicBinding];
}

- (void)dynamicBinding {
    
    __weak typeof(self) _self = self;
    __weak id<ViewModelInterface> __viewModel = _viewModel;
    [_viewModel dynamicBindingWithFinishedCallBack:^{
        _self.view.viewModel = __viewModel;
        _self.view.operation = _self;
    }];
}

- (void)pushTo {
    NSString *router = [JLRoutes htmi_generateURLWithPattern:HTMINavPushRoute parameters:@[NSStringFromClass(HTMIWorkFlowViewController.class)] extraParameters:@{@"name":@"wlq",@"age":@27}];
    [[RACScheduler mainThreadScheduler] schedule:^{
        
        [[UIApplication sharedApplication] openURL:JLRGenRouteURL(HTMIDefaultRouteSchema, router)];
    }];
}

@end




