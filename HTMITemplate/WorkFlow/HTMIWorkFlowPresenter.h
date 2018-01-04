//
//  PresenterTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMIWorkFlowInterface.h"

@interface HTMIWorkFlowPresenter : NSObject<HTMIWorkFlowViewModelInterface>

@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString * name;

- (void)adapterWithWorkFlowView:(id<HTMIWorkFlowViewInterface>)workflowView workflowViewModel:(id<HTMIWorkFlowViewModelInterface>)workflowViewModel;

@end
