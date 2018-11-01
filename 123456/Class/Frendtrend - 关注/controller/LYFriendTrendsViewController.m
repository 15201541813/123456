//
//  LYFriendTrendsViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYFriendTrendsViewController.h"
#import "UIBarButtonItem+extension.h"
#import <Masonry.h>
#import "LYRecommenFollowViewController.h"
@interface LYFriendTrendsViewController ()
/**图片*/
@property (nonatomic, weak) UIImageView *pictureImageView;
/**文字内容label*/
@property (nonatomic, weak) UILabel *textLabel;
/**登录按钮*/
@property (nonatomic, weak) UIButton *loginBtn;
@end

@implementation LYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //界面基本设置
    [self basicSetting];
    [self layoutSubViews];
    
}
#pragma mark - basicSetting界面基本设置
- (void)basicSetting
{
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(buttonClick)];
}

#pragma mark - buttonClick
- (void)buttonClick
{
    LYRecommenFollowViewController *recFollow = [[LYRecommenFollowViewController alloc] init];
    [self.navigationController pushViewController:recFollow animated:YES];
    
}
#pragma mark - 控件懒加载
- (UIImageView *)pictureImageView
{
    if (_pictureImageView == nil) {
        UIImageView *picture = [[UIImageView alloc] init];
        [self.view addSubview:picture];
        _pictureImageView = picture;
        picture.image = [UIImage imageNamed:@"header_cry_icon"];
    }
    return _pictureImageView;
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        UILabel *textLabel = [[UILabel alloc] init];
        [self.view addSubview:textLabel];
        _textLabel = textLabel;
        _textLabel.text = @"快快登录吧，关注百思最in牛人\n好友动态让你过把瘾儿~\n欧耶~~~~!";
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.textColor = [UIColor colorWithRed:159/255.0 green:114/255.0 blue:72/255.0 alpha:1];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [_textLabel sizeToFit];
    }
    return _textLabel;
}

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        UIButton *loginBtn = [[UIButton alloc] init];
        [self.view addSubview:loginBtn];
        _loginBtn = loginBtn;
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:(UIControlStateNormal)];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:(UIControlStateHighlighted)];
        [_loginBtn setTitle:@"立即登录注册" forState:(UIControlStateNormal)];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_loginBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateHighlighted)];
    }
    return _loginBtn;
}

-(void) layoutSubViews
{
    __weak __typeof__(self) weakSelf = self;
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
    }];
    
    [self.pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.textLabel.mas_top).mas_offset(-30);
        make.centerX.mas_equalTo(weakSelf.textLabel);
        make.size.mas_equalTo(48);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.textLabel);
        make.top.equalTo(weakSelf.textLabel.mas_bottom).mas_offset(30);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(30);
    }];
    
    
}
@end
