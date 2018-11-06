//
//  LYAccountScrollView.m
//  123456
//
//  Created by 李艳 on 2018/11/6.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYAccountScrollView.h"
#import "LYPlaveHoderTextField.h"
static CGFloat loginRegisterBtnH = 30;
static CGFloat textFieldBageH = 80;
static CGFloat topParding = 20;
static CGFloat textFieldLeftParding = 10;
static CGFloat textFieldWidthPercent = 0.7;
@interface LYAccountScrollView()
/**textField的背景图*/
@property (nonatomic, weak) UIImageView *textFieldBage;
/**手机号*/
@property (nonatomic, weak) LYPlaveHoderTextField *numTextField;
/**密码*/
@property (nonatomic, weak) LYPlaveHoderTextField *secretField;
/**登录*/
@property (nonatomic, weak) UIButton *loginBtn;
/**忘记密码*/
@property (nonatomic, weak) UIButton *fogetBtn;
/**请输入手机号*/
@property (nonatomic, weak) LYPlaveHoderTextField *inputTextField;
/**设置密码*/
@property (nonatomic, weak) LYPlaveHoderTextField *settingTextField;
/**注册*/
@property (nonatomic, weak) UIButton *registerButton;
/**textFile的背景图*/
@property (nonatomic, weak) UIImageView *textFieldRegisterBage;
@end
@implementation LYAccountScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
            self.contentSize = CGSizeMake(LYScreenWidth * 2, 0);
            self.pagingEnabled = YES;
            self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}
#pragma mark - 控件懒加载
-(LYPlaveHoderTextField *)numTextField
{
    if (_numTextField == nil) {
        LYPlaveHoderTextField *nubTextField = [[LYPlaveHoderTextField alloc] init];
        [self.textFieldBage addSubview:nubTextField];
        _numTextField = nubTextField;
        _numTextField.placeholder = @"手机号";
        [_numTextField resignFirstResponder];
    }
    return _numTextField;
}

-(LYPlaveHoderTextField *)secretField
{
    if (_secretField == nil) {
        LYPlaveHoderTextField *secfield = [[LYPlaveHoderTextField alloc] init];
        [self.textFieldBage addSubview:secfield];
        _secretField = secfield;
        _secretField.placeholder = @"密码";
        [_secretField resignFirstResponder];
    }
    return _secretField;
}

-(LYPlaveHoderTextField *)inputTextField
{
    if (_inputTextField == nil) {
        LYPlaveHoderTextField *nubTextField = [[LYPlaveHoderTextField alloc] init];
        [self.textFieldRegisterBage addSubview:nubTextField];
        _inputTextField = nubTextField;
        _inputTextField.placeholder = @"请输入手机号";
        [_inputTextField resignFirstResponder];
    }
    return _inputTextField;
}

-(LYPlaveHoderTextField *)settingTextField
{
    if (_settingTextField == nil) {
        LYPlaveHoderTextField *secfield = [[LYPlaveHoderTextField alloc] init];
        [self.textFieldRegisterBage addSubview:secfield];
        _settingTextField = secfield;
        _settingTextField.placeholder = @"设置密码";
        [_settingTextField resignFirstResponder];
    }
    return _settingTextField;
}
- (UIImageView *)textFieldBage
{
    if (_textFieldBage == nil) {
        UIImageView *loginView = [[UIImageView alloc] init];
        [self addSubview:loginView];
        _textFieldBage = loginView;
        _textFieldBage.userInteractionEnabled = YES;
        _textFieldBage.image = [UIImage imageNamed:@"login_rgister_textfield_bg"];
    }
    return _textFieldBage;
}

- (UIImageView *)textFieldRegisterBage
{
    if (_textFieldRegisterBage == nil) {
        UIImageView *loginView = [[UIImageView alloc] init];
        [self addSubview:loginView];
        _textFieldRegisterBage = loginView;
        _textFieldRegisterBage.userInteractionEnabled = YES;
        _textFieldRegisterBage.image = [UIImage imageNamed:@"login_rgister_textfield_bg"];
    }
    return _textFieldRegisterBage;
}

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self addSubview:btn];
        _loginBtn = btn;
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds = YES;
        UIImage *ima = [UIImage imageNamed:@"login_register_button"];
        UIImage *highIma = [UIImage imageNamed:@"login_register_button_click"];
        [_loginBtn setBackgroundImage:ima forState:(UIControlStateNormal)];
        [_loginBtn setBackgroundImage:highIma forState:(UIControlStateHighlighted)];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _loginBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
    }
    return _loginBtn;
}

- (UIButton *)registerButton
{
    if (_registerButton == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self addSubview:btn];
        _registerButton = btn;
        _registerButton.layer.cornerRadius = 5;
        _registerButton.layer.masksToBounds = YES;
        UIImage *ima = [UIImage imageNamed:@"login_register_button"];
        UIImage *highIma = [UIImage imageNamed:@"login_register_button_click"];
        [_registerButton setBackgroundImage:ima forState:(UIControlStateNormal)];
        [_registerButton setBackgroundImage:highIma forState:(UIControlStateHighlighted)];
        [_registerButton setTitle:@"注册" forState:(UIControlStateNormal)];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _registerButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
    }
    return _registerButton;
}


- (UIButton *)fogetBtn
{
    if (_fogetBtn == nil) {
        UIButton *fogetBtn = [[UIButton alloc] init];
        [self addSubview:fogetBtn];
        _fogetBtn = fogetBtn;
        [_fogetBtn setTitle:@"忘记密码？" forState:(UIControlStateNormal)];
        _fogetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_fogetBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_fogetBtn sizeToFit];
    }
    return _fogetBtn;
}
#pragma mark - layoutSubviews控件布局
- (void)layoutSubviews
{
    [super layoutSubviews];
     __weak __typeof__(self) weakSelf = self;
    self.textFieldBage.width = LYScreenWidth * textFieldWidthPercent;
    self.textFieldBage.height = textFieldBageH;
    self.textFieldBage.y = 0;
    self.textFieldBage.centerX = LYScreenWidth * 0.5;
    
    [self.numTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.textFieldBage).mas_offset(textFieldLeftParding);
        make.top.right.equalTo(weakSelf.textFieldBage);
        make.height.mas_equalTo(textFieldBageH * 0.5);
    }];
    
    [self.secretField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.numTextField.mas_bottom);
        make.left.right.equalTo(weakSelf.numTextField);
        make.bottom.equalTo(weakSelf.textFieldBage);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.textFieldBage.mas_bottom).mas_offset(topParding);
        make.left.right.equalTo(weakSelf.textFieldBage);
        make.height.mas_equalTo(loginRegisterBtnH);
    }];
    
    [self.fogetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.loginBtn);
        make.top.equalTo(weakSelf.loginBtn.mas_bottom).mas_offset(topParding);
    }];
    
    self.textFieldRegisterBage.x = LYScreenWidth + self.textFieldBage.x;
    self.textFieldRegisterBage.y = self.textFieldBage.y;
    self.textFieldRegisterBage.width = self.textFieldBage.width;
    self.textFieldRegisterBage.height = self.textFieldBage.height;
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.textFieldRegisterBage).mas_offset(textFieldLeftParding);
        make.top.right.equalTo(weakSelf.textFieldRegisterBage);
        make.height.mas_equalTo(textFieldBageH * 0.5);
    }];
    
    [self.settingTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputTextField.mas_bottom);
        make.left.right.equalTo(weakSelf.inputTextField);
        make.bottom.equalTo(weakSelf.textFieldRegisterBage);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.textFieldRegisterBage.mas_bottom).mas_offset(topParding);
        make.left.right.equalTo(weakSelf.textFieldRegisterBage);
        make.height.mas_equalTo(loginRegisterBtnH);
    }];
}
@end
