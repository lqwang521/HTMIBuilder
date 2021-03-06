//
//  ViewModelTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "<#Root#><#Unit#>Interface.h"
#import "HTMIBasedViewModel.h"

@interface <#Root#><#Unit#>ViewModel : HTMIBasedViewModel <<#Root#><#Unit#>ViewModelInterface>

@property (nonatomic,strong) id<<#Root#><#Unit#>ModelInterface> model;

- (void)initializeWithModel:(id<<#Root#><#Unit#>ModelInterface>)model <#InitializeInterface#>completion:(void(^)())completion;
<#ViewModelInterface#>

@end
