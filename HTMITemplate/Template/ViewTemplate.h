//
//  ViewTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceTemplate.h"

@interface ViewTemplate : UIView <ViewInterface>

@property (nonatomic,strong) id<ViewOperation> operation;
@property (nonatomic,strong) id<ViewModelInterface> viewModel;

@end
