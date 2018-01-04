//
//  InterfaceTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTMIWorkFlowModelInterface <NSObject>

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) NSDictionary * map;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSArray * plan;
@property (nonatomic,copy) NSString * name;

@end

@protocol HTMIWorkFlowViewModelInterface <NSObject>

@optional
@property (nonatomic,strong) id<HTMIWorkFlowModelInterface> model;

@optional
- (void)initializeWithModel:(id<HTMIWorkFlowModelInterface>)model age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion;
- (void)login1WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map age:(NSInteger)age name:(NSString *)name completion:(void(^)())completion;
- (void)login2WithModel:(id<HTMIWorkFlowModelInterface>)model map:(NSDictionary *)map completion:(void(^)())completion;
- (void)login3WithModel:(id<HTMIWorkFlowModelInterface>)model completion:(void(^)())completion;

@end

@protocol HTMIWorkFlowViewInterface <NSObject>

@property (nonatomic,weak) id<HTMIWorkFlowViewModelInterface> workflowViewModel;
@property (nonatomic,weak) id<HTMIWorkFlowViewModelInterface> workflowOperator;

@end
