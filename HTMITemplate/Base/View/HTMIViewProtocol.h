//
//  HTMIViewProtocol.h
//  HTMIBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTMIViewProtocol <NSObject>

/**
 为视图绑定 viewModel
 
 @param viewModel 要绑定的ViewModel
 @param params 额外参数
 */
- (void)bindViewModel:(id <HTMIViewProtocol>)viewModel withParams:(NSDictionary *)params;

@required

/**
 初始化额外数据
 */
- (void)htmi_initializeForView;

/**
 初始化视图
 */
- (void)htmi_createViewForView;

@end
