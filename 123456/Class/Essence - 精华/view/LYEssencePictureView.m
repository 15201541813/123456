//
//  LYEssencePictureView.m
//  123456
//
//  Created by 李艳 on 2018/11/8.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssencePictureView.h"
#import "LYEssenceTopic.h"
#import <UIImageView+WebCache.h>
#import "LYEssenceFullPictureController.h"
@interface LYEssencePictureView()
@property (nonatomic, weak) UIImageView *gif;
@property (nonatomic, weak) UIButton *bigImageBtn;
@property (nonatomic, strong) UIImageView *backImage;
@property (nonatomic, weak) UIImageView *picture;
@end
@implementation LYEssencePictureView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)setTopic:(LYEssenceTopic *)topic
{
    _topic = topic;
    [self insertSubview:self.backImage atIndex:0];
    NSURL *url = [NSURL URLWithString:topic.image1];
    [self.picture sd_setImageWithURL:url];
    NSString *fileName = [[topic.image1 pathExtension] lowercaseString];
    if ([fileName isEqualToString:@"gif"]) {
        self.gif.hidden = NO;
    }else self.gif.hidden = YES;
    if (topic.isBigPicture) {
        self.bigImageBtn.hidden = NO;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }else self.bigImageBtn.hidden = YES;
}

- (void)seeFullPicture
{
    LYEssenceFullPictureController *full = [[LYEssenceFullPictureController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:full animated:YES completion:nil];
    full.topic = self.topic;
}
- (UIImageView *)picture
{
    if (_picture == nil) {
        UIImageView *picture = [[UIImageView alloc] init];
        [self addSubview:picture];
        _picture = picture;
        _picture.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeFullPicture)];
        [_picture addGestureRecognizer:gesture];
        _picture.userInteractionEnabled = YES;
    }return _picture;
}
- (UIImageView *)backImage
{
    if (_backImage == nil) {
        _backImage = [[UIImageView alloc] init];
        _backImage.image = [UIImage imageNamed:@"imageBackground"];
        [self addSubview:_backImage];
        _backImage.userInteractionEnabled = YES;
    }
    return _backImage;
}
- (UIImageView *)gif
{
    if (_gif == nil) {
        UIImageView *gif = [[UIImageView alloc] init];
        [self.picture addSubview:gif];
        _gif = gif;
        gif.image = [UIImage imageNamed:@"common-gif"];
        _gif.userInteractionEnabled = YES;
    }
    return _gif;
}
- (UIButton *)bigImageBtn
{
    if (_bigImageBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.picture addSubview:btn];
        _bigImageBtn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"see-big-picture-background"] forState:(UIControlStateNormal)];
        [btn setImage:[UIImage imageNamed:@"see-big-picture"] forState:(UIControlStateNormal)];
        [btn setTitle:@"点击查看大图" forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.enabled = NO;
    }
    return _bigImageBtn;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat backImageW = 200;
    CGFloat backImageH = 30;
    self.backImage.x = (self.width - backImageW) * 0.5;;
    self.backImage.y = 20;
    self.backImage.width = backImageW;
    self.backImage.height = backImageH;
    self.picture.frame = self.bounds;
    self.gif.frame = CGRectMake(0, 0, 31, 31);
    CGFloat btnH = 43;
    CGFloat btnW = self.width;
    CGFloat btnY = self.height - btnH;
    self.bigImageBtn.frame = CGRectMake(0, btnY, btnW, btnH);
    
}
@end
