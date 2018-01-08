//
//  HTMILoginAccountInputTableViewCell.h
//  HTMITemplate
//
//  Created by wlq on 2018/1/5.
//  Copyright © 2018年 Doubles_Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMILoginInterface.h"

@interface HTMILoginAccountInputTableViewCell : UITableViewCell

@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginViewModel;
@property (nonatomic,weak) id<HTMILoginViewModelInterface> loginOperator;

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

/**
 输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;


@end
