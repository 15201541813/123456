//
//  LYRecommendTagCell.m
//  123456
//
//  Created by 李艳 on 2018/10/31.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommendTagCell.h"
#import <Masonry.h>
#import "LYRecommendTag.h"
#import <UIImageView+WebCache.h>
static CGFloat LYRecommendTagParding = 10;
static CGFloat LYRecommendTagRightParding = 20;
static CGFloat LYRecommendTagIconSize = 50;
static CGFloat LYRecommendTagSubscribeBtnW = 51;
static CGFloat LYRecommendTagSubscribeBtnH = 25;
@interface LYRecommendTagCell()
/**推荐标签的图片*/
@property (nonatomic, weak) UIImageView *iconImageView;
/**标签名称*/
@property (nonatomic, weak) UILabel *nameLabel;
/**标签的订阅量*/
@property (nonatomic, weak) UILabel *subNemberLabel;
/**订阅*/
@property (nonatomic, weak) UIButton *subscribeBtn;
@end
@implementation LYRecommendTagCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#define mark - 创建cell的类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LYRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[LYRecommendTagCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ID"];
    }
    return cell;
}

- (void)setRecTag:(LYRecommendTag *)recTag
{
    _recTag = recTag;
    NSURL *url = [NSURL URLWithString:recTag.image_list];
    [self.iconImageView sd_setImageWithURL:url];
    self.nameLabel.text = recTag.theme_name;
    self.subNemberLabel.text = recTag.sub_number;
}
#define mark - 控件懒加载
-(UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        _iconImageView = iconImageView;
        _iconImageView.image = [UIImage imageNamed:@"defaultUserIcon"];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.numberOfLines = 0;
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        [_nameLabel sizeToFit];
        _nameLabel.text = @"jasdfkjdf";
        _nameLabel.backgroundColor = [UIColor yellowColor];
    }
    return _nameLabel;
}

- (UILabel *)subNemberLabel
{
    if (_subNemberLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _subNemberLabel = label;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        [_subNemberLabel sizeToFit];
        _subNemberLabel.backgroundColor = [UIColor redColor];
        _subNemberLabel.text = @"akjfj";
    }
    return _subNemberLabel;
}

- (UIButton *)subscribeBtn
{
    if (_subscribeBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.contentView addSubview:btn];
        _subscribeBtn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:@"FollowBtnClickBg"] forState:(UIControlStateHighlighted)];
        [btn setTitle:@"+ 订阅" forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _subscribeBtn;
}
#define mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    UIView *contentView = self.contentView;
    __weak __typeof__(self) weakSelf = self;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).mas_offset(LYRecommendTagParding);
        make.left.equalTo(contentView).mas_offset(LYRecommendTagParding);
        make.size.mas_equalTo(LYRecommendTagIconSize);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImageView.mas_right).mas_offset(LYRecommendTagParding);
        make.top.equalTo(weakSelf.iconImageView);
    }];
    
    [self.subNemberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.iconImageView);
        make.left.equalTo(weakSelf.nameLabel);
    }];
    
    [self.subscribeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(contentView);
        make.right.equalTo(contentView).mas_offset(-LYRecommendTagRightParding);
        make.width.mas_equalTo(LYRecommendTagSubscribeBtnW);
        make.height.mas_equalTo(LYRecommendTagSubscribeBtnH);
    }];
    self.cellHeight = LYRecommendTagParding * 2 + LYRecommendTagIconSize;
}
@end
