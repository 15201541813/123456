//
//  LYLoginController.m
//  123456
//
//  Created by 李艳 on 2018/11/5.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYLoginController.h"
#import "LYAccountScrollView.h"
#import "LYFastLogin.h"
static CGFloat leftParding = 20;
static CGFloat rightParding = 20;
static CGFloat scrollViewHeight = 300;
static CGFloat backYPercent = 0.1;
static CGFloat scrollviewYPercent = 0.2;
static CGFloat backBtnSize = 16;
@interface LYLoginController ()
/**背景图片*/
@property (nonatomic, strong) UIImageView *backImageView;
/**返回按钮*/
@property (nonatomic, weak) UIButton *backBtn;
/**注册账号*/
@property (nonatomic, weak) UIButton *registerBtn;
/**注册登记账号的scrollView*/
@property (nonatomic, strong) LYAccountScrollView *scrollView;
/**快速登录*/
@property (nonatomic, weak) LYFastLogin *fastLogin;
@end

@implementation LYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图
    [self.view addSubview:self.backImageView];
    //控件布局
    [self layoutSubviews];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - registerClick点击注册账号
- (void)registerClick
{
    self.registerBtn.selected = !self.registerBtn.selected;
    if (self.registerBtn.selected) {
        [self.registerBtn setTitle:@"已有账号?" forState:(UIControlStateNormal)];
        CGPoint point = CGPointMake(LYScreenWidth, 0);
        [self.scrollView setContentOffset:point animated:YES];
    }else {
        [self.registerBtn setTitle:@"注册账号" forState:(UIControlStateNormal)];
        CGPoint point = CGPointMake(0, 0);
        [self.scrollView setContentOffset:point animated:YES];
    }
    
}

#pragma mark - back点击返回按钮
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 控件懒加载
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
        [_registerBtn addTarget:self action:@selector(registerClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerBtn;
}
- (LYAccountScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[LYAccountScrollView alloc] init];
        [self.backImageView addSubview:_scrollView];
    }
    return _scrollView;
}

- (LYFastLogin *)fastLogin
{
    if (_fastLogin == nil) {
        LYFastLogin *fast = [[LYFastLogin alloc] init];
        [self.backImageView addSubview:fast];
        _fastLogin = fast;
    }
    return _fastLogin;
}
#pragma mark - layoutSubviews控件布局
- (void)layoutSubviews
{
    __weak __typeof__(self) weakSelf = self;
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backImageView).mas_offset(leftParding);
        make.top.equalTo(weakSelf.backImageView).offset(backYPercent * LYScreenHeight);
        make.size.mas_equalTo(backBtnSize);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backBtn);
        make.right.equalTo(weakSelf.backImageView).mas_offset(-rightParding);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImageView).mas_offset(scrollviewYPercent * LYScreenHeight);
        make.height.mas_equalTo(scrollViewHeight);
        make.centerX.mas_equalTo(weakSelf.backImageView);
        make.width.mas_equalTo(LYScreenWidth);
    }];

    [self.fastLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(weakSelf.backImageView);
        make.height.mas_equalTo(LYScreenHeight * 0.2);
        
    }];
}
@end
