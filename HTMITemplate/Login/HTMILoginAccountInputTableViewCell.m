//
//  HTMILoginAccountInputTableViewCell.m
//  HTMITemplate
//
//  Created by wlq on 2018/1/5.
//  Copyright © 2018年 Doubles_Z. All rights reserved.
//

#import "HTMILoginAccountInputTableViewCell.h"

@implementation HTMILoginAccountInputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupViews];
}

- (void)setupViews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.textLabel.font = [UIFont systemFontOfSize:17];
    //设置textfield属性
    self.inputTextFiled.font = [UIFont systemFontOfSize:17];
    self.inputTextFiled.spellCheckingType = UITextSpellCheckingTypeNo;
    self.inputTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.inputTextFiled.keyboardType = UIKeyboardTypeASCIICapable;
    self.inputTextFiled.secureTextEntry = NO;
    // 账户样式
    self.inputTextFiled.returnKeyType = UIReturnKeyNext;
}

- (void)setLoginViewModel:(id<HTMILoginViewModelInterface>)loginViewModel {
    _loginViewModel = loginViewModel;
    if ([_loginViewModel conformsToProtocol:@protocol(HTMILoginViewModelInterface)]){
        
        @weakify(self);
        
        RAC(_loginViewModel,userAccount) = [[self.inputTextFiled.rac_textSignal takeUntil:self.rac_prepareForReuseSignal] map:^id _Nullable(NSString * _Nullable account) {
            @strongify(self);
            if (account.length > 25) {
                self.inputTextFiled.text = [account substringToIndex:25];
            }
            return self.inputTextFiled.text;
        }];
    }
}

@end
