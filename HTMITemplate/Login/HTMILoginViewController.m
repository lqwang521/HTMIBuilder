//
//  ControllerTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginViewController.h"
#import "HTMILoginPresenter.h"
#import "HTMILoginViewModel.h"
#import "HTMILoginView.h"

@interface HTMILoginViewController ()

@property (nonatomic,strong) HTMILoginPresenter * loginPresenter;
@property (nonatomic,strong) HTMILoginViewModel * loginViewModel;
@property (nonatomic,strong) HTMILoginView * loginView;

@end

@implementation HTMILoginViewController

- (void)dealloc {
        NSLog(@"%@ - execute %s",NSStringFromClass([self class]),__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self adapterView];
}

- (HTMILoginPresenter *)loginPresenter {
    
    if (!_loginPresenter) {
        _loginPresenter = [[HTMILoginPresenter alloc] initWithParams:self.params];
    }
    return _loginPresenter;
}

- (HTMILoginViewModel *)loginViewModel {
    
    if (!_loginViewModel) {
        _loginViewModel = [HTMILoginViewModel new];
    }
    return _loginViewModel;
}

- (HTMILoginView *)loginView {
    
    if (!_loginView) {
        _loginView = [HTMILoginView new];
        _loginView.frame = self.view.bounds;
    }
    return _loginView;
}

- (void)setupView {
    [self.view addSubview:self.loginView];
}

- (void)adapterView {
    [self.loginPresenter adapterWithLoginView:self.loginView loginViewModel:self.loginViewModel];
}

@end
