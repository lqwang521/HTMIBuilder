//
//  ViewTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "<#Root#><#Unit#>Interface.h"

@interface <#Root#><#Unit#>View : UIView <<#Root#><#Unit#>ViewInterface>

@property (nonatomic,weak) id<<#Root#><#Unit#>ViewModelInterface> <#unit#>ViewModel;
@property (nonatomic,weak) id<<#Root#><#Unit#>ViewModelInterface> <#unit#>Operator;

@end
