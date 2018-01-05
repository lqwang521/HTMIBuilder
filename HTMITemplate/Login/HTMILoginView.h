//
//  ViewTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMILoginInterface.h"

@interface HTMILoginView : UIView <HTMILoginViewInterface>

@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginViewModel;
@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginOperator;

@end
