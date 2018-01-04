//
//  InterfaceTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewOperation <NSObject>

- (void)pushTo;

@end

@protocol ModelInterface <NSObject>

@property (nonatomic,strong) NSArray * models;

@end

@protocol ViewModelInterface <NSObject>

@property (nonatomic,strong) id<ModelInterface> model;
- (void)dynamicBindingWithFinishedCallBack:(void(^)())finishCallBack;

@end


@protocol ViewInterface <NSObject>

@property (nonatomic,strong) id<ViewModelInterface> viewModel;
@property (nonatomic,strong) id<ViewOperation> operation;

@end

