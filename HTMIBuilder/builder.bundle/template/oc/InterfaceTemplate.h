//
//  InterfaceTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol <#Root#><#Unit#>ModelInterface <NSObject>

<#ModelInterface#>
@end

@protocol <#Root#><#Unit#>ViewModelInterface <NSObject>

@optional
@property (nonatomic,strong) id<<#Root#><#Unit#>ModelInterface> model;

@optional
- (void)initializeWithModel:(id<<#Root#><#Unit#>ModelInterface>)model <#InitializeInterface#>completion:(void(^)())completion;
<#ViewModelInterface#>
@end

@protocol <#Root#><#Unit#>ViewInterface <NSObject>

@property (nonatomic,weak) id<<#Root#><#Unit#>ViewModelInterface> <#unit#>ViewModel;
@property (nonatomic,weak) id<<#Root#><#Unit#>ViewModelInterface> <#unit#>Operator;

@end
