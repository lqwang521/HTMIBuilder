//
//  InterfaceTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTMILoginModelInterface <NSObject>

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) NSDictionary * map;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSArray * plan;
@property (nonatomic,copy) NSString * name;

@end

@protocol HTMILoginViewModelInterface <NSObject>

@optional
@property (nonatomic,strong) id<HTMILoginModelInterface> model;

/**
 tableView 标题列表
 */
@property (nonatomic, strong) NSArray <NSString *>*cellTitleArray;

/**
 判断是否可以登录
 */
@property (nonatomic, assign) BOOL isLoginEnable;

/**
 用户名
 */
@property (nonatomic, copy) NSString *userAccount;

/**
 密码
 */
@property (nonatomic, copy) NSString *password;

#pragma mark - 命令
/**
 登录
 */
@property (nonatomic, strong) RACCommand *loginCommand;

@optional
- (void)initializeWithModel:(id<HTMILoginModelInterface>)model params:(NSDictionary *)params completion:(void(^)())completion;
- (void)login1WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion;
- (void)login2WithModel:(id<HTMILoginModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion;
- (void)login3WithModel:(id<HTMILoginModelInterface>)model completion:(void(^)())completion;

@end

@protocol HTMILoginViewInterface <NSObject>

@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginViewModel;
@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginOperator;

@end
