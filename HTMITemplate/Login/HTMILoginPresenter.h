//
//  PresenterTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMILoginInterface.h"

@interface HTMILoginPresenter : NSObject<HTMILoginViewModelInterface>

@property (nonatomic,strong) NSDictionary * params;

- (void)adapterWithLoginView:(id<HTMILoginViewInterface>)loginView loginViewModel:(id<HTMILoginViewModelInterface>)loginViewModel;

@end
