//
//  ViewModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "<#Root#><#Unit#>ViewModel.h"
#import "<#Root#><#Unit#>Model.h"

@implementation <#Root#><#Unit#>ViewModel

- (<#Root#><#Unit#>Model *)model {
    
    if (!_model) {
        _model = [<#Root#><#Unit#>Model new];
    }
    return _model;
}

- (void)initializeWithModel:(id<<#Root#><#Unit#>ModelInterface>)model <#InitializeInterface#>completion:(void(^)())completion {

}

<#ViewModelImplementation#>
@end
