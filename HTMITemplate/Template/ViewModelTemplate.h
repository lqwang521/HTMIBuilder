//
//  ViewModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfaceTemplate.h"

@interface ViewModelTemplate : NSObject <ViewModelInterface>

@property (nonatomic,strong) id<ModelInterface> model;

- (void)dynamicBindingWithFinishedCallBack:(void (^)())finishCallBack;

@end
