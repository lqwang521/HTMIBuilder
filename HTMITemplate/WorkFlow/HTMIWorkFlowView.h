//
//  ViewTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMIWorkFlowInterface.h"

@interface HTMIWorkFlowView : UIView <HTMIWorkFlowViewInterface>

@property (nonatomic,weak) id<HTMIWorkFlowViewModelInterface> workflowViewModel;
@property (nonatomic,weak) id<HTMIWorkFlowViewModelInterface> workflowOperator;

@end
