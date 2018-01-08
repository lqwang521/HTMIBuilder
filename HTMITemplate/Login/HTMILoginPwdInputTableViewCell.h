//
//  HTMILoginPwdInputTableViewCell.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMILoginInterface.h"

@interface HTMILoginPwdInputTableViewCell : UITableViewCell

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

/**
 操作按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *accessoryButton;


@end
