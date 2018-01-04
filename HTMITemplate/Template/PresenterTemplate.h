//
//  PresenterTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceTemplate.h"

@interface PresenterTemplate : NSObject<ViewOperation>

@property (nonatomic,weak) id<ViewInterface> view;
@property (nonatomic,weak) id<ViewModelInterface> viewModel;

- (void)adapterWithView:(id<ViewInterface>)view viewModel:(id<ViewModelInterface>)viewModel;

@end

