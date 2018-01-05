//
//  HTMIBaseViewController.h
//  MXClient
//
//  Created by wlq on 16/5/30.
//  Copyright © 2016年 MXClient. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HTMIViewModelNavigationImpl.h"

#import "HTMIBasedViewModel.h"

@interface HTMIBaseViewController : UIViewController<UIGestureRecognizerDelegate>

@property(nonatomic,strong,readonly)HTMIBasedViewModel *viewModel;
@property(nonatomic,strong,readonly)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic,strong) NSDictionary * params;

- (instancetype)initWithViewModel:(HTMIBasedViewModel *)viewModel;

@end
