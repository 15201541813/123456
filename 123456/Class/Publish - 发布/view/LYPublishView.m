//
//  LYPublishView.m
//  123456
//
//  Created by 李艳 on 2018/11/13.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYPublishView.h"
#import "LYPublishBtn.h"
#import <POP.h>
@interface LYPublishView()
@property (nonatomic, weak) UIButton *cancelBtn;
@property (nonatomic, weak) UIImageView *bageImage;
@property (nonatomic, weak) UIImageView *sloganImage;
@property (nonatomic, strong) NSMutableArray *buttons;
@end

@implementation LYPublishView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        [self addcontentBtns];
       
        
    }
    return self;
}
- (NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (void)addcontentBtns
{
    CGFloat parding = 20;
    CGFloat btnWidth = 72;
    CGFloat btnHeight = 72 + 30;
    NSInteger maxCol = 3;
    CGFloat gapWidth = (LYScreenWidth - parding * 2 - btnWidth * maxCol) / (maxCol - 1);
    NSArray *btns = @[@"publish-audio",@"publish-offline",@"publish-picture",@"publish-review",@"publish-text",@"publish-video"];
    NSArray *titles =@[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖",@"离线下载"];
    NSInteger count = btns.count;
    for (int i = 0; i < count; i++) {
        LYPublishBtn *btn = [[LYPublishBtn alloc] init];
        [self.buttons addObject:btn];
        [self.bageImage addSubview:btn];
        [btn setImage:[UIImage imageNamed:btns[i]] forState:(UIControlStateNormal)];
        [btn setTitle:titles[i] forState:(UIControlStateNormal)];
        NSInteger col = i / maxCol;
        NSInteger row = i % maxCol;
        CGFloat btnX = parding + (btnWidth + gapWidth) * row;
        CGFloat btnY = LYScreenHeight * 0.35 + btnHeight * col;
        POPSpringAnimation *aniSprong = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        aniSprong.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnY, btnWidth, btnHeight)];
        aniSprong.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnY - LYScreenHeight, btnWidth, btnHeight)];
        aniSprong.beginTime = CACurrentMediaTime() + i * 0.1;
        aniSprong.springBounciness = 10;
        aniSprong.springSpeed = 10;
        [btn pop_addAnimation:aniSprong forKey:nil];
    }
    POPSpringAnimation *sloganAni = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    CGFloat sloganW = LYScreenWidth * 0.6;
    CGFloat sloganH = 20;
    CGFloat sloganX = (LYScreenWidth - sloganW) * 0.5;
    CGFloat sloganY = LYScreenHeight * 0.2;
    sloganAni.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, LYScreenWidth * 0.6, 20)];
    sloganAni.toValue = [NSValue valueWithCGRect:CGRectMake(sloganX, sloganY, sloganW, sloganH)];
    sloganAni.springSpeed = 10;
    sloganAni.springBounciness = 10;
    sloganAni.beginTime = CACurrentMediaTime() + titles.count * 0.1;
    [self.sloganImage pop_addAnimation:sloganAni forKey:nil];
}
#pragma mark - 控件懒加载

- (UIImageView *)bageImage
{
    if (_bageImage == nil){
        UIImageView *image = [[UIImageView alloc] init];
        [self addSubview:image];
        _bageImage = image;
        image.image = [UIImage imageNamed:@"shareBottomBackground-1"];
        image.userInteractionEnabled = YES;
    }
    return _bageImage;
}
- (UIButton *)cancelBtn
{
    if (_cancelBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.bageImage addSubview:btn];
        _cancelBtn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"shareButtonCancel"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:@"shareButtonCancelClick"] forState:(UIControlStateHighlighted)];
        [btn addTarget:self action:@selector(cancelBtnDidCancel) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _cancelBtn;
}

- (UIImageView *)sloganImage
{
    if (_sloganImage == nil) {
        UIImageView *image = [[UIImageView alloc] init];
        [self.bageImage addSubview:image];
        _sloganImage = image;
        image.image = [UIImage imageNamed:@"app_slogan"];
    }
    return _sloganImage;
}

- (void)cancelBtnDidCancel
{
    [self cancel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof__(self) weakSelf = self;
    self.bageImage.frame = self.bounds;
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf).mas_offset(-80);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(weakSelf);
        make.width.mas_equalTo(LYScreenWidth * 0.7);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self cancel];
}

- (void)cancel
{
    for (UIButton *btn in self.buttons) {
        NSInteger dex = [self.buttons indexOfObject:btn];
        POPBasicAnimation *ani = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
        ani.toValue = [NSValue valueWithCGRect:CGRectMake(btn.x, LYScreenHeight, btn.width, btn.height)];
        ani.beginTime = CACurrentMediaTime() + dex * 0.1;
        [btn pop_addAnimation:ani forKey:nil];
        if (dex == self.buttons.count - 1) {
            POPBasicAnimation *ani = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
            ani.toValue = [NSValue valueWithCGRect:CGRectMake(self.sloganImage.x, LYScreenHeight, self.sloganImage.width, self.sloganImage.height)];
            ani.beginTime = CACurrentMediaTime() + self.buttons.count * 0.1;
            [self.sloganImage pop_addAnimation:ani forKey:nil];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
    }
}

@end
