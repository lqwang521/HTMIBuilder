//
//  ViewModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginViewModel.h"
#import "HTMILoginModel.h"

@interface HTMILoginViewModel()

@property (nonatomic,strong) id<RACSubscriber> subscriber;

@end

@implementation HTMILoginViewModel

- (void)dealloc {
    NSLog(@"%@ - execute %s",NSStringFromClass([self class]),__func__);
}

- (HTMILoginModel *)model {
    
    if (!_model) {
        _model = [HTMILoginModel new];
    }
    return _model;
}

- (NSArray<NSString *> *)cellTitleArray {
    if (!_cellTitleArray) {
        _cellTitleArray = @[
                            @"账户",
                            @"密码",
                            ];
    }
    return _cellTitleArray;
}

- (RACCommand *)loginCommand {
    if (!_loginCommand) {
        @weakify(self);
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            
            
            RACSignal *signal = [[[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                // 请求起飞
                //             [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                //
                //             [subscriber sendNext:[request responseJSONObject]];
                //             [subscriber sendCompleted];
                //
                //             } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                //
                //             [subscriber sendError:[request error]];
                //             }];
                self.subscriber = subscriber;
                
                // 2秒后移除提示框
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.subscriber sendNext:@"test"];
                    [self.subscriber sendCompleted];
                });
                
                return [RACDisposable disposableWithBlock:^{
                    
                    //[self stop];
                }];
            }] takeUntil:[self rac_willDeallocSignal]] doNext:^(id  _Nullable x) {
                // 解析数据
                [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
            }] materialize];
            
            return signal;//[RACSignal empty];
        }];
    }
    return _loginCommand;
}

- (void)initializeWithModel:(id<HTMILoginModelInterface>)model params:(NSDictionary *)params completion:(void(^)())completion {
    // 是否可以登录
    RAC(self, isLoginEnable) =  [[RACSignal combineLatest:@[
                                                            RACObserve(self, userAccount),
                                                            RACObserve(self, password)]
                                  ]
                                 map:^id _Nullable(RACTuple * _Nullable value) {
                                     RACTupleUnpack(NSString *account, NSString *pwd) = value;
                                     return @(account && pwd && account.length && pwd.length);
                                 }];
    //请求成功触发
    completion();
}

- (void)login1WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion {
    
}

- (void)login2WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion {
    
}

- (void)login3WithModel:(id<HTMILoginModelInterface>)model completion:(void(^)())completion {
    
}


@end
