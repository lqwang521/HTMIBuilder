//
//  ViewTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIWorkFlowView.h"

#import "Masonry.h"
#import "SVProgressHUD.h"

@interface HTMIWorkFlowView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView * tableView;
/**
 退出登录
 */
@property (nonatomic, strong) UIButton *logoutBtn;

/**
 跳转
 */
@property (nonatomic, strong) UIButton *pushBtn;
@end

@implementation HTMIWorkFlowView

- (void)dealloc {
    NSLog(@"%@ - execute %s",NSStringFromClass([self class]),__func__);
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        [self setupConstraints];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder  {
    
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
        [self setupConstraints];
    }
    return self;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)setupSubviews {
    //[self addSubview:self.tableView];
    
    [self addSubview:self.logoutBtn];
    [self addSubview:self.pushBtn];
}

- (void)setupConstraints {
    
    NSArray *views = @[self.pushBtn, self.logoutBtn];
    CGFloat offset = self.bounds.size.width/3;
    
    [views mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:40 leadSpacing:offset tailSpacing:offset];
    
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self);
    }];
}

- (void)setWorkFlowViewModel:(id<HTMIWorkFlowViewModelInterface>)workflowViewModel {
    _workflowViewModel = workflowViewModel;
    
    [[self.logoutBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"isLogin"];
        [SVProgressHUD htmi_dispalyMsgWithStatus:@"2秒后将退出登录"];
        [SVProgressHUD dismissWithDelay:2.0f completion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:HTMILoginStateChangedNotificationKey object:nil];
        }];
    }];
    
    // push
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        [self.workflowOperator pushtoOtherVC:nil completion:^{
            
        }];
    }];
    
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tableView.frame = self.bounds;
}

#pragma mark - Getter
- (UIButton *)logoutBtn
{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _logoutBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_logoutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _logoutBtn;
}

- (UIButton *)pushBtn
{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBtn setTitle:@"下一页" forState:UIControlStateNormal];
        _pushBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _pushBtn;
}

@end


