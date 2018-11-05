//
//  LYRecommendFollowUsersCell.m
//  123456
//
//  Created by 李艳 on 2018/11/5.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommendFollowUsersCell.h"
#import "LYRecommendFollowUsers.h"
#import <UIImageView+WebCache.h>
static NSString *userID = @"userID";
static CGFloat headerHeight = 50;
static CGFloat parding = 10;
static CGFloat rightParding = 20;
@interface LYRecommendFollowUsersCell()
@property (nonatomic, weak) UIImageView *headerImageView;
@property (nonatomic, weak) UILabel *screen_nameLabel;
@property (nonatomic, weak) UILabel *fans_countLabel;
@property (nonatomic, weak) UIButton *followBtn;
@end
@implementation LYRecommendFollowUsersCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LYRecommendFollowUsersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"user"];
    if (cell == nil) {
        cell = [[LYRecommendFollowUsersCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:userID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setUser:(LYRecommendFollowUsers *)user
{
    _user = user;
    self.screen_nameLabel.text = user.screen_name;
    self.fans_countLabel.text = user.fans_count;
    NSURL *url = [NSURL URLWithString:user.header];
    [self.headerImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    user.cellHeight = parding * 2 + headerHeight;
}
#define mark - 控件懒加载
- (UIImageView *)headerImageView
{
    if (_headerImageView == nil) {
        UIImageView *imaeView = [[UIImageView alloc] init];
        [self.contentView addSubview:imaeView];
        _headerImageView = imaeView;
    }
    return _headerImageView;
}

- (UILabel *)screen_nameLabel
{
    if (_screen_nameLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _screen_nameLabel = label;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        [label sizeToFit];
    }
    return _screen_nameLabel;
}

- (UILabel *)fans_countLabel
{
    if (_fans_countLabel == nil) {
        UILabel *countLabel = [[UILabel alloc] init];
        [self.contentView addSubview:countLabel];
        _fans_countLabel = countLabel;
        countLabel.textColor = [UIColor grayColor];
        countLabel.font = [UIFont systemFontOfSize:12];
        [countLabel sizeToFit];
    }
    return _fans_countLabel;
}

- (UIButton *)followBtn
{
    if (_followBtn == nil) {
        UIButton *btn = [[UIButton alloc] init];
        [self.contentView addSubview:btn];
        _followBtn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"FollowBtnBg"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:@"FollowBtnClickBg"] forState:(UIControlStateHighlighted)];
        [btn setTitle:@"+关注" forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [btn sizeToFit];
    }
    return _followBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak __typeof__(self) weakSelf = self;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(weakSelf).mas_offset(parding);
        make.size.mas_equalTo(headerHeight);
    }];
    
    [self.screen_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.headerImageView.mas_right).mas_offset(parding);
        make.top.mas_equalTo(weakSelf.headerImageView);
    }];
    
    [self.fans_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.screen_nameLabel);
        make.bottom.equalTo(weakSelf.headerImageView);
    }];
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).mas_offset(-rightParding);
        make.centerY.equalTo(weakSelf);
    }];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 1;
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
