//
//  ControllerTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIWorkFlowViewController.h"
#import "HTMIWorkFlowPresenter.h"
#import "HTMIWorkFlowViewModel.h"
#import "HTMIWorkFlowView.h"

@interface HTMIWorkFlowViewController ()

@property (nonatomic,strong) HTMIWorkFlowPresenter * workflowPresenter;
@property (nonatomic,strong) HTMIWorkFlowViewModel * workflowViewModel;
@property (nonatomic,strong) HTMIWorkFlowView * workflowView;

@end

@implementation HTMIWorkFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self adapterView];
}

- (HTMIWorkFlowPresenter *)workflowPresenter {
    
    if (!_workflowPresenter) {
        _workflowPresenter = [[HTMIWorkFlowPresenter alloc] initWithParams:self.params];
        _workflowPresenter.age = _age;
    }
    return _workflowPresenter;
}

- (HTMIWorkFlowViewModel *)workflowViewModel {
    
    if (!_workflowViewModel) {
        _workflowViewModel = [HTMIWorkFlowViewModel new];
    }
    return _workflowViewModel;
}

- (HTMIWorkFlowView *)workflowView {
    
    if (!_workflowView) {
        _workflowView = [HTMIWorkFlowView new];
        _workflowView.frame = self.view.bounds;
    }
    return _workflowView;
}

- (void)setupView {
    [self.view addSubview:self.workflowView];
}

- (void)adapterView {
    [self.workflowPresenter adapterWithWorkFlowView:self.workflowView workflowViewModel:self.workflowViewModel];
}

@end
