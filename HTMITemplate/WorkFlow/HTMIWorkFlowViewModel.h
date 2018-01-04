//
//  ViewModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMIWorkFlowInterface.h"

@interface HTMIWorkFlowViewModel : NSObject <HTMIWorkFlowViewModelInterface>

@property (nonatomic,strong) id<HTMIWorkFlowModelInterface> model;

- (void)initializeWithModel:(id<HTMIWorkFlowModelInterface>)model age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion;
- (void)login1WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion;
- (void)login2WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion;
- (void)login3WithModel:(id<HTMIWorkFlowModelInterface>)model completion:(void(^)())completion;


@end
