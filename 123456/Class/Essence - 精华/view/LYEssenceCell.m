//
//  LYEssenceCell.m
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceCell.h"
#import "LYEssenceTopic.h"
#import <UIImageView+WebCache.h>
#import "LYEssencePictureView.h"
#import "LYEssenceVideo.h"
#import "LYEssenceBottomVIew.h"
@interface LYEssenceCell()//comment  love
//screen_name//text//created_at//cai  repost
@property (nonatomic, weak) UIImageView *profile_image;
@property (nonatomic, weak) UILabel *screen_name;
@property (nonatomic, weak) UILabel *created_at;
@property (nonatomic, weak) UILabel *text;
@property (nonatomic, weak) LYEssencePictureView *pictureView;
@property (nonatomic, weak) UIButton *followBtn;
@property (nonatomic, weak) LYEssenceVideo *video;
@property (nonatomic, weak) LYEssenceBottomVIew *bottomView;


@end
@implementation LYEssenceCell
#pragma mark - cell的创建方法
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LYEssenceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[LYEssenceCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ID"];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setTopic:(LYEssenceTopic *)topic
{
    [topic rowHeight];
    _topic = topic;
    NSURL *url = [NSURL URLWithString:topic.profile_image];
    [self.profile_image sd_setImageWithURL:url];
    self.screen_name.text = topic.screen_name;
    self.created_at.text = topic.created_at;
    self.text.text = topic.text;
    self.text.frame = topic.textLabelFrame;
    self.pictureView.topic = topic;
    self.pictureView.frame = topic.pictureFrame;
    self.video.frame = topic.videoFrame;
    self.video.topic = topic;
    self.bottomView.frame = topic.bottomViewFrame;
    self.bottomView.topic = topic;
    
    if (topic.type == LYEssenceOfTopicWord) {
        self.pictureView.hidden = YES;
        self.video.hidden = YES;
    }if (topic.type == LYEssenceOfTopicVideo) {
        self.pictureView.hidden = YES;
        self.video.hidden = NO;
    }if (topic.type == LYEssenceOfTopicVoice) {
        self.pictureView.hidden = YES;
        self.video.hidden = YES;
    }if (topic.type == LYEssenceOfTopicPicture) {
        self.pictureView.hidden = NO;
        self.video.hidden = YES;
    }
    
}
#pragma mark - 控件懒加载
- (UIImageView *)profile_image
{
    if (_profile_image == nil) {
        UIImageView *pro = [[UIImageView alloc] init];
        [self.contentView addSubview:pro];
        _profile_image = pro;
        _profile_image.image = [UIImage imageNamed:@"defaultUserIcon"];
    }
    return _profile_image;
}

- (UILabel *)screen_name
{
    if (_screen_name == nil) {
        UILabel *name = [[UILabel alloc] init];
        [self.contentView addSubview:name];
        _screen_name = name;
        name.font = [UIFont systemFontOfSize:14];
        name.textColor = [UIColor darkGrayColor];
        [name sizeToFit];
    }
    return _screen_name;
}

- (UILabel *)created_at
{
    if (_created_at == nil) {
        UILabel *name = [[UILabel alloc] init];
        [self.contentView addSubview:name];
        _created_at = name;
        name.font = [UIFont systemFontOfSize:12];
        name.textColor = [UIColor darkGrayColor];
        [name sizeToFit];
    }
    return _created_at;
}

- (UILabel *)text
{
    if (_text == nil) {
        UILabel *name = [[UILabel alloc] init];
        [self.contentView addSubview:name];
        _text = name;
        name.font = [UIFont systemFontOfSize:12];
        name.textColor = [UIColor blackColor];
        name.numberOfLines = 0;
    }
    return _text;
}

- (UIButton *)followBtn
{
    if (_followBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.contentView addSubview:btn];
        _followBtn = btn;
        [_followBtn setBackgroundImage:[UIImage imageNamed:@"cellFollowIcon"] forState:(UIControlStateNormal)];
    }
    return _followBtn;
}

- (LYEssencePictureView *)pictureView
{
    if (_pictureView == nil) {
        LYEssencePictureView *picture = [[LYEssencePictureView alloc] init];
        [self.contentView addSubview:picture];
        _pictureView = picture;
    }
    return _pictureView;
}

- (LYEssenceVideo *)video
{
    if (_video == nil) {
        LYEssenceVideo *view = [[LYEssenceVideo alloc] init];
        [self.contentView addSubview:view];
        _video = view;
    }
    return _video;
}

- (LYEssenceBottomVIew *)bottomView
{
    if (_bottomView == nil) {
        LYEssenceBottomVIew *view = [[LYEssenceBottomVIew alloc] init];
        [self.contentView addSubview:view];
        _bottomView = view;
    }
    return _bottomView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof__(self) weakSelf = self;
    [self.profile_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf).mas_offset(10);
        make.size.mas_equalTo(40);
    }];
    
    [self.screen_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.profile_image.mas_right).mas_offset(10);
        make.top.equalTo(weakSelf.profile_image);
    }];
    
    [self.created_at mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.screen_name);
        make.bottom.equalTo(weakSelf.profile_image);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).mas_offset(-10);
        make.top.equalTo(weakSelf.profile_image);
        make.size.mas_equalTo(20);
    }];
    
}
#pragma mark - setFrame
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
    frame.origin.x = 10;
    frame.size.width = LYScreenWidth - 20;
    frame.size.height -= 10;
    [super setFrame:frame];
}

@end
