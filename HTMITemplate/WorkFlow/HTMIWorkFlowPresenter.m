//
//  PresenterTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIWorkFlowPresenter.h"
#import "ControllerTemplate.h"

@interface HTMIWorkFlowPresenter ()

@property (nonatomic,weak) id<HTMIWorkFlowViewInterface> workflowView;
@property (nonatomic,weak) id<HTMIWorkFlowViewModelInterface> workflowViewModel;

@end

@implementation HTMIWorkFlowPresenter

- (void)adapterWithWorkFlowView:(id<HTMIWorkFlowViewInterface>)workflowView workflowViewModel:(id<HTMIWorkFlowViewModelInterface>)workflowViewModel {

    _workflowView = workflowView;
    _workflowViewModel = workflowViewModel;

    __weak typeof(self) _self = self;
    __weak id<HTMIWorkFlowViewModelInterface> __workflowViewModel = _workflowViewModel;
    [_workflowViewModel initializeWithModel:__workflowViewModel.model age:_self.age completion:^{
        _self.workflowView.workflowViewModel = __workflowViewModel;
        _self.workflowView.workflowOperator = _self;
    }];
}

- (void)login1WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMIWorkFlowViewModelInterface> __workflowViewModel = _workflowViewModel;
    [_workflowViewModel login1WithModel:model map:map age:age name:name completion:^{
        _self.workflowView.workflowViewModel = __workflowViewModel;
        if (completion) {completion();}
    }];
}

- (void)login2WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMIWorkFlowViewModelInterface> __workflowViewModel = _workflowViewModel;
    [_workflowViewModel login2WithModel:model map:map completion:^{
        _self.workflowView.workflowViewModel = __workflowViewModel;
        if (completion) {completion();}
    }];
}

- (void)login3WithModel:(id<HTMIWorkFlowModelInterface>)model completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMIWorkFlowViewModelInterface> __workflowViewModel = _workflowViewModel;
    [_workflowViewModel login3WithModel:model completion:^{
        _self.workflowView.workflowViewModel = __workflowViewModel;
        if (completion) {completion();}
    }];
}

- (void)pushtoOtherVC:(id<HTMIWorkFlowModelInterface>)model completion:(void(^)())completion {
    
    NSString *router = [JLRoutes htmi_generateURLWithPattern:HTMINavPushRoute parameters:@[NSStringFromClass(ControllerTemplate.class)] extraParameters:nil];
    [[RACScheduler mainThreadScheduler] schedule:^{
        
        [[UIApplication sharedApplication] openURL:JLRGenRouteURL(HTMIDefaultRouteSchema, router)];
    }];
    
}


@end




