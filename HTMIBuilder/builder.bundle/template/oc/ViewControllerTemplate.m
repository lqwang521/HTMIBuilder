//
//  ControllerTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "<#Root#><#Unit#>ViewController.h"
#import "<#Root#><#Unit#>Presenter.h"
#import "<#Root#><#Unit#>ViewModel.h"
#import "<#Root#><#Unit#>View.h"

@interface <#Root#><#Unit#>ViewController ()

@property (nonatomic,strong) <#Root#><#Unit#>Presenter * <#unit#>Presenter;
@property (nonatomic,strong) <#Root#><#Unit#>ViewModel * <#unit#>ViewModel;
@property (nonatomic,strong) <#Root#><#Unit#>View * <#unit#>View;

@end

@implementation <#Root#><#Unit#>ViewController

#pragma mark - Init


#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self adapterView];
}

- (void)setupView {
    [self.view addSubview:self.<#unit#>View];
}

- (void)adapterView {
    [self.<#unit#>Presenter adapterWith<#Unit#>View:self.<#unit#>View <#unit#>ViewModel:self.<#unit#>ViewModel];
}

#pragma mark - Getter

- (<#Root#><#Unit#>Presenter *)<#unit#>Presenter {
    
    if (!_<#unit#>Presenter) {
        _<#unit#>Presenter = [[<#Root#><#Unit#>Presenter alloc] initWithParams:self.params];<#InitializeAssignment#>
    }
    return _<#unit#>Presenter;
}

- (<#Root#><#Unit#>ViewModel *)<#unit#>ViewModel {
    
    if (!_<#unit#>ViewModel) {
        _<#unit#>ViewModel = [<#Root#><#Unit#>ViewModel new];
    }
    return _<#unit#>ViewModel;
}

- (<#Root#><#Unit#>View *)<#unit#>View {
    
    if (!_<#unit#>View) {
        _<#unit#>View = [<#Root#><#Unit#>View new];
        _<#unit#>View.frame = self.view.bounds;
    }
    return _<#unit#>View;
}

#pragma mark - Setter

@end
