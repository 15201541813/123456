//
//  LYEssenceBigPictureController.m
//  123456
//
//  Created by 李艳 on 2018/11/9.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceFullPictureController.h"
#import "LYEssenceTopic.h"
#import <UIImageView+WebCache.h>
@interface LYEssenceFullPictureController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIScrollView *scro;
@property (nonatomic, strong) UIImageView *picture;
@end

@implementation LYEssenceFullPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.scro];
    [self.scro addSubview:self.picture];
    [self.view insertSubview:self.backBtn aboveSubview:self.scro];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setTopic:(LYEssenceTopic *)topic
{
    _topic = topic;
    CGFloat pictureH = topic.height * LYScreenWidth / topic.width;
    NSURL *url = [NSURL URLWithString:topic.image1];
    [self.picture sd_setImageWithURL:url];
    if (pictureH > LYScreenHeight) {
        self.picture.frame = CGRectMake(0, 0, LYScreenWidth, pictureH);
        self.scro.contentSize = CGSizeMake(0, pictureH);
    }else{
        self.picture.x = 0;
        self.picture.width = LYScreenWidth;
        self.picture.height = pictureH;
        self.picture.centerY = LYScreenHeight * 0.5;
        
    }
}
- (UIButton *)backBtn
{
    if (_backBtn == nil) {
        _backBtn = [[UIButton alloc] init];
        [_backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _backBtn.backgroundColor = [UIColor lightGrayColor];
        [_backBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
        _backBtn.frame = CGRectMake(20, 44, 60, 25);
    }
    return _backBtn;
}

- (UIScrollView *)scro
{
    if (_scro == nil) {
        _scro = [[UIScrollView alloc] init];
        _scro.frame = self.view.bounds;
        _scro.showsVerticalScrollIndicator = NO;
        _scro.showsHorizontalScrollIndicator = NO;
        _scro.delegate = self;
    }
    return _scro;
}

- (UIImageView *)picture
{
    if (_picture == nil) {
        _picture = [[UIImageView alloc] init];
        _picture.userInteractionEnabled = YES;
    }
    return _picture;
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
