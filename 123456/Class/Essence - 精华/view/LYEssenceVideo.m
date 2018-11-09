//
//  LYEssenceVideo.m
//  123456
//
//  Created by 李艳 on 2018/11/9.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceVideo.h"
#import <UIImageView+WebCache.h>
#import "LYEssenceTopic.h"
@interface LYEssenceVideo()
@property (nonatomic, weak)UIImageView *picture;
@property (nonatomic, weak)UILabel *playCount;
@property (nonatomic, weak)UILabel *time;
@property (nonatomic, weak)UIButton *playBtn;
@end
@implementation LYEssenceVideo
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        nil;
    }
    return self;
}

- (void)setTopic:(LYEssenceTopic *)topic
{
    _topic = topic;
    NSURL *url = [NSURL URLWithString:topic.image_small];
    [self.picture sd_setImageWithURL:url];
    self.playCount.text = [NSString stringWithFormat:@"%ld播放",(long)topic.playcount];
    self.time.text = [self stringWithText:topic.videotime];
}

- (NSString *)stringWithText:(NSString *)text
{
    NSInteger count = [text integerValue];
    NSInteger sec = count % 60;
    NSInteger min = count / 60;
    NSString *str = [NSString stringWithFormat:@"%02ld:%02ld",(long)min,(long)sec];
    return str;
}
- (UIImageView *)picture
{
    if (_picture == nil) {
        UIImageView *pic = [[UIImageView alloc] init];
        [self addSubview:pic];
        _picture = pic;
        _picture.userInteractionEnabled = YES;
    }
    return _picture;
}

- (UILabel *)playCount
{
    if (_playCount == nil) {
        UILabel *lab = [[UILabel alloc] init];
        [self.picture addSubview:lab];
        _playCount = lab;
        lab.textColor = [UIColor whiteColor];
        lab.font = [UIFont systemFontOfSize:13];
        lab.backgroundColor = [UIColor darkGrayColor];
        [lab sizeToFit];
    }
    return _playCount;
}

- (UILabel *)time
{
    if (_time == nil) {
        UILabel *lab = [[UILabel alloc] init];
        [self.picture addSubview:lab];
        _time = lab;
        lab.textColor = [UIColor whiteColor];
        lab.font = [UIFont systemFontOfSize:13];
        lab.backgroundColor = [UIColor darkGrayColor];
        [lab sizeToFit];
    }
    return _time;
}

- (UIButton *)playBtn
{
    if (_playBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.picture addSubview:btn];
        _playBtn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"video-play"] forState:(UIControlStateNormal)];
    }
    return _playBtn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof__(self) weakSelf = self;
    self.picture.frame = self.bounds;
    [self.playCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(weakSelf.picture);
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(weakSelf.picture);
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.picture);
        make.size.mas_equalTo(71);
    }];
}
@end
