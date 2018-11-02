//
//  LYRecmmendFollowCatCell.m
//  123456
//
//  Created by 李艳 on 2018/11/1.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecmmendFollowCatCell.h"
#import <Masonry.h>
#import "LYRecommendFollowCategory.h"
@interface LYRecmmendFollowCatCell()
@property(nonatomic, weak) UILabel *contentLabel;
@property(nonatomic, weak) UIView *indicaterView;
@property(nonatomic, weak) UIView *bottomView;
@end
@implementation LYRecmmendFollowCatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = LYColor(244, 244, 244);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LYRecmmendFollowCatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[LYRecmmendFollowCatCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ID"];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.indicaterView.hidden = NO;
        self.textLabel.textColor = [UIColor redColor];
    }else{
        self.indicaterView.hidden = YES;
        self.textLabel.textColor = [UIColor blackColor];
    }
    
}

- (void)setCategory:(LYRecommendFollowCategory *)category
{
    _category = category;
    self.textLabel.text = category.name;
}
- (UIView *)indicaterView
{
    if (_indicaterView == nil) {
        UIView *indicaterView = [[UIView alloc] init];
        [self.contentView addSubview:indicaterView];
        _indicaterView = indicaterView;
        _indicaterView.backgroundColor = [UIColor redColor];
    }
    return _indicaterView;
}

- (UILabel *)contentLabel
{
    if (_contentLabel == nil) {
       UILabel *contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabel];
        _contentLabel = contentLabel;
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor blackColor];
        [_contentLabel sizeToFit];
    }
    return _contentLabel;
}

- (UIView *)bottomView
{
    if (_bottomView == nil) {
        UIView *bottomView = [[UIView alloc] init];
        [self.contentView addSubview:bottomView];
        _bottomView = bottomView;
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     __weak __typeof__(self) weakSelf = self;
    [self.indicaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView);
        make.bottom.equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf.mas_left);
        make.width.mas_equalTo(5);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf.indicaterView.mas_right).mas_offset(10);
        
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_bottom);
        make.left.right.equalTo(weakSelf.contentView);
        make.height.mas_equalTo(1);
    }];
    
}
@end
