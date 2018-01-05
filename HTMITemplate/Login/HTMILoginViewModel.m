//
//  ViewModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginViewModel.h"
#import "HTMILoginModel.h"

@implementation HTMILoginViewModel

- (HTMILoginModel *)model {
    
    if (!_model) {
        _model = [HTMILoginModel new];
    }
    return _model;
}

- (void)initializeWithModel:(id<HTMILoginModelInterface>)model params:(NSDictionary *)params completion:(void(^)())completion {

}

- (void)login1WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion {

}

- (void)login2WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion {

}

- (void)login3WithModel:(id<HTMILoginModelInterface>)model completion:(void(^)())completion {

}


@end
