//
//  LYLoginController.m
//  123456
//
//  Created by 李艳 on 2018/11/5.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYLoginController.h"

@interface LYLoginController ()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, weak) UIButton *backBtn;
@property (nonatomic, weak) UIButton *registerBtn;
@property (nonatomic, weak) UIView *loginView;

@end

@implementation LYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backImageView];
    [self layoutSubviews];
}

- (UIImageView *)backImageView
{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.image = [UIImage imageNamed:@"login_register_background"];
        _backImageView.frame = [UIScreen mainScreen].bounds;
        _backImageView.userInteractionEnabled = YES;
    }return _backImageView;
}
- (UIButton *)backBtn
{
    if (_backBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.backImageView addSubview:btn];
        _backBtn = btn;
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"login_close_icon"] forState:(UIControlStateNormal)];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _backBtn;
}

- (UIButton *)registerBtn
{
    if (_registerBtn == nil) {
        UIButton *registerBtn = [[UIButton alloc] init];
        [self.backImageView addSubview:registerBtn];
        _registerBtn = registerBtn;
        [_registerBtn setTitle:@"注册账号" forState:(UIControlStateNormal)];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerBtn sizeToFit];
    }
    return _registerBtn;
}
- (UIView *)loginView
{
    if (_loginView == nil) {
        UIView *loginView = [[UIView alloc] init];
        [self.backImageView addSubview:loginView];
        _loginView = loginView;
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)layoutSubviews
{
    __weak __typeof__(self) weakSelf = self;
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backImageView).mas_offset(20);
        make.top.equalTo(weakSelf.backImageView).offset(0.1 * LYScreenHeight);
        make.size.mas_equalTo(16);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backBtn);
        make.right.equalTo(weakSelf.backImageView).mas_offset(-20);
    }];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImageView).mas_offset(0.2 * LYScreenHeight);
        make.height.mas_equalTo(130);
        make.centerX.mas_equalTo(weakSelf.backImageView);
        make.width.mas_equalTo(LYScreenWidth * 0.7);
    }];
}
@end
