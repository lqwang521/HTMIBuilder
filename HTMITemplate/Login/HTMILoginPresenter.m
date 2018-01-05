//
//  PresenterTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginPresenter.h"

@interface HTMILoginPresenter ()

@property (nonatomic,weak) id<HTMILoginViewInterface> loginView;
@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginViewModel;

@end

@implementation HTMILoginPresenter

- (void)adapterWithLoginView:(id<HTMILoginViewInterface>)loginView loginViewModel:(id<HTMILoginViewModelInterface>)loginViewModel {

    _loginView = loginView;
    _loginViewModel = loginViewModel;

    __weak typeof(self) _self = self;
    __weak id<HTMILoginViewModelInterface> __loginViewModel = _loginViewModel;
    [_loginViewModel initializeWithModel:__loginViewModel.model params:_self.params completion:^{
        _self.loginView.loginViewModel = __loginViewModel;
        _self.loginView.loginOperator = _self;
    }];
}

- (void)login1WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMILoginViewModelInterface> __loginViewModel = _loginViewModel;
    [_loginViewModel login1WithModel:model map:map age:age name:name completion:^{
        _self.loginView.loginViewModel = __loginViewModel;
        if (completion) {completion();}
    }];
}

- (void)login2WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMILoginViewModelInterface> __loginViewModel = _loginViewModel;
    [_loginViewModel login2WithModel:model map:map completion:^{
        _self.loginView.loginViewModel = __loginViewModel;
        if (completion) {completion();}
    }];
}

- (void)login3WithModel:(id<HTMILoginModelInterface>)model completion:(void(^)())completion {

    __weak typeof(self) _self = self;
    __weak id<HTMILoginViewModelInterface> __loginViewModel = _loginViewModel;
    [_loginViewModel login3WithModel:model completion:^{
        _self.loginView.loginViewModel = __loginViewModel;
        if (completion) {completion();}
    }];
}



@end




