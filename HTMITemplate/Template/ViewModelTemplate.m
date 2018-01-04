//
//  ViewModelTemplate.m
//  HTMITemplate
//
//  Created by wlq on 17/5/5.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "ViewModelTemplate.h"
#import "ModelTemplate.h"
#import "NetWork.h"
#import "DataBase.h"

@implementation ViewModelTemplate

- (void)dynamicBindingWithFinishedCallBack:(void (^)())finishCallBack {

    [DataBase requestDataWithClass:[ModelTemplate class] finishedCallBack:^(NSDictionary *response) {
        _model = [ModelTemplate modelWithDictionary:response];
        finishCallBack();
    }];
    
    [NetWork requestDataWithType:MethodGetType URLString:@"http://localhost:3001/api/J1/getJ1List" parameter:nil finishedCallBack:^(NSDictionary * response){
        _model = [ModelTemplate modelWithDictionary:response[@"data"]];
        [DataBase cache:[ModelTemplate class] data:response[@"data"]];
        finishCallBack();
    }];
}

@end
