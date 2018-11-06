//
//  LYFastLogin.m
//  123456
//
//  Created by 李艳 on 2018/11/6.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYFastLogin.h"
#import "LYFastLoginBtn.h"
@interface LYFastLogin()
@property (nonatomic, weak) UILabel *fastLoginLabel;
@property (nonatomic, weak) UIImageView *leftLine;
@property (nonatomic, weak) UIImageView *rightLine;
@property (nonatomic, weak) LYFastLoginBtn *qqLogin;
@property (nonatomic, weak) LYFastLoginBtn *weixinLogin;
@property (nonatomic, weak) LYFastLoginBtn *weiboLogin;

@end

@implementation LYFastLogin

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       // self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (UILabel *)fastLoginLabel
{
    if (_fastLoginLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        _fastLoginLabel = label;
        _fastLoginLabel.text = @"快速登录";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        [_fastLoginLabel sizeToFit];
    }
    return _fastLoginLabel;
}

- (LYFastLoginBtn *)qqLogin
{
    if (_qqLogin == nil) {
        LYFastLoginBtn *btn = [[LYFastLoginBtn alloc] init];
        [self addSubview:btn];
        _qqLogin = btn;
        [_qqLogin setTitle:@"QQ登录" forState:(UIControlStateNormal)];
        [_qqLogin setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:(UIControlStateNormal)];
        [_qqLogin setImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:(UIControlStateHighlighted)];
        _qqLogin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_qqLogin setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _qqLogin;
}

- (LYFastLoginBtn *)weixinLogin
{
    if (_weixinLogin == nil) {
        LYFastLoginBtn *btn = [[LYFastLoginBtn alloc] init];
        [self addSubview:btn];
        _weixinLogin = btn;
        [_weixinLogin setTitle:@"微信登录" forState:(UIControlStateNormal)];
        [_weixinLogin setImage:[UIImage imageNamed:@"login_sina_icon"] forState:(UIControlStateNormal)];
        [_weixinLogin setImage:[UIImage imageNamed:@"login_sina_icon_click"] forState:(UIControlStateHighlighted)];
        _weixinLogin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_weixinLogin setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _weixinLogin;
}

- (LYFastLoginBtn *)weiboLogin
{
    if (_weiboLogin == nil) {
        LYFastLoginBtn *btn = [[LYFastLoginBtn alloc] init];
        [self addSubview:btn];
        _weiboLogin = btn;
        [_weiboLogin setTitle:@"微博登录" forState:(UIControlStateNormal)];
        [_weiboLogin setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:(UIControlStateNormal)];
        [_weiboLogin setImage:[UIImage imageNamed:@"login_tecent_icon_click"] forState:(UIControlStateHighlighted)];
        _weiboLogin.titleLabel.font = [UIFont systemFontOfSize:13];
        [_weiboLogin setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _weiboLogin;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof__(self) weakSelf = self;
    [self.fastLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
    }];
    
    [self.weixinLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.fastLoginLabel.mas_bottom).mas_offset(10);
        make.centerX.equalTo(weakSelf);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70 + 30);
    }];
    
    [self.qqLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).mas_offset(20);
        make.size.equalTo(weakSelf.weixinLogin);
        make.top.equalTo(weakSelf.weixinLogin);
    }];
    
    [self.weiboLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.weixinLogin);
        make.right.equalTo(weakSelf).mas_offset(-20);
        make.size.equalTo(weakSelf.weixinLogin);
    }];
}
@end
