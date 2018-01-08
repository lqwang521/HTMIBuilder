//
//  ViewTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginView.h"
#import "HTMILoginAccountInputTableViewCell.h"
#import "HTMILoginPwdInputTableViewCell.h"
#import "HTMILoginInputFooterView.h"

#import "Masonry.h"

typedef NS_ENUM(NSInteger, kLoginInputType) {
    kLoginInputType_account = 0,//账户
    kLoginInputType_password = 1 //密码
};

@interface HTMILoginView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView * tableView;

/**
 tableheader
 */
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;

/**
 tableFooter
 */
@property (nonatomic, strong) HTMILoginInputFooterView *tableFooterView;

@end

@implementation HTMILoginView

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
        // 注册cell
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HTMILoginAccountInputTableViewCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(HTMILoginAccountInputTableViewCell.class)];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass(HTMILoginPwdInputTableViewCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(HTMILoginPwdInputTableViewCell.class)];
       
        // tableHeaderView
        _tableView.tableHeaderView = self.tableHeaderView;
        self.tableHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3);
        _tableView.tableFooterView = self.tableFooterView;
    }
    return _tableView;
}

- (void)setupSubviews {
    [self addSubview:self.tableView];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setupConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setLoginViewModel:(id<HTMILoginViewModelInterface>)loginViewModel {
    _loginViewModel = loginViewModel;
    [self.tableView reloadData];
    
    @weakify(self);
    RAC(self.tableFooterView.loginBtn,enabled) = RACObserve(_loginViewModel, isLoginEnable);
    
    [[[self.tableFooterView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] throttle:1.0f] subscribeNext:^(__kindof UIControl * _Nullable x) {
             @strongify(self);
        [self.loginViewModel.loginCommand execute:nil];
    }];
    
    //监听登录信号是否在执行
    [[self.loginViewModel.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        if (x.boolValue) {
            [self.tableFooterView.loginBtn startLoadingAnimation];
        }else
        {
            // 2秒后移除提示框
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableFooterView.loginBtn stopLoadingAnimation];
            });
        }
    }];
    
    [self.loginViewModel.loginCommand.executionSignals subscribeNext:^(RACSignal* signal) {//id  _Nullable x
       
        [[signal dematerialize] subscribeNext:^(id  _Nullable x) {
            BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
            if(isLogin){
                [SVProgressHUD htmi_displaySuccessWithStatus:@"登录成功"];
                
                // 2s后进入首页
                [SVProgressHUD dismissWithDelay:2.0f completion:^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:HTMILoginStateChangedNotificationKey object:nil];
                }];
            }else
            {
                [SVProgressHUD htmi_displaySuccessWithStatus:@"登录失败"];
            }
        } error:^(NSError * _Nullable error) {
             [SVProgressHUD htmi_displayErrorWithStatus:error.localizedDescription];
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.loginViewModel.cellTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case kLoginInputType_account:
        {
            // 账户
            HTMILoginAccountInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HTMILoginAccountInputTableViewCell.class)];
            
            cell.loginViewModel = self.loginViewModel;
            
            return cell;
        }
            break;
        case kLoginInputType_password:
        {
            // 密码
            HTMILoginPwdInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HTMILoginPwdInputTableViewCell.class)];
            
            cell.loginViewModel = self.loginViewModel;
            
            return cell;
        }
            break;
        default:
            break;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"blankCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //self.tableView.frame = self.bounds;
}

#pragma mark - Getter
- (HTMILoginInputFooterView *)tableFooterView
{
    if (!_tableFooterView){
        _tableFooterView = [[HTMILoginInputFooterView alloc] init];
        _tableFooterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    }
    return _tableFooterView;
}

@end


