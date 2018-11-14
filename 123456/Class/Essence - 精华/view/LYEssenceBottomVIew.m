//
//  LYEssenceBottomVIew.m
//  123456
//
//  Created by 李艳 on 2018/11/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceBottomVIew.h"
#import "LYEssenceTopic.h"
#import "LYFastLoginBtn.h"
@interface LYEssenceBottomVIew ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *dingBtn;
@property (nonatomic, strong) UIButton *caiBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *commitBtn;
@property (nonatomic, strong) NSMutableArray *btns;
@end
@implementation LYEssenceBottomVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}
- (void)setTopic:(LYEssenceTopic *)topic
{
    _topic = topic;
    [self.dingBtn setTitle:topic.love forState:(UIControlStateNormal)];
    [self.caiBtn setTitle:topic.cai forState:(UIControlStateNormal)];
    [self.shareBtn setTitle:topic.repost forState:(UIControlStateNormal)];
    [self.commitBtn setTitle:topic.comment forState:(UIControlStateNormal)];
    [self addVerticaiLine];
    
}
- (void)addVerticaiLine
{
    CGFloat width = self.width / self.btns.count;
    for (NSInteger i = 0; i < self.btns.count; i++) {
        UIImageView *line = [[UIImageView alloc] init];
        [self addSubview:line];
        line.image = [UIImage imageNamed:@"cell-button-line"];
        CGFloat X = i * width;
        CGFloat centerY = self.height * 0.5;
        CGFloat H = 29;
        CGFloat W = 1;
        line.x = X;
        line.width = W;
        line.height = H;
        line.centerY = centerY;
    }
}
- (UIView *)lineView
{
    if (_lineView == nil) {
        UIView *lineView = [[UIView alloc] init];
        [self addSubview:lineView];
        _lineView = lineView;
        _lineView.backgroundColor = LYDefaultColor;
    }
    return _lineView;
}
- (UIButton *)dingBtn
{
    if (_dingBtn == nil) {
        
        _dingBtn = [UIButton buttonWithTitle:nil highTitle:nil image:@"mainCellDing" highImage:@"mainCellDingClick" target:nil action:nil];
        [self.btns addObject:_dingBtn];

        [self addSubview:_dingBtn];
    }
    return _dingBtn;
}
- (UIButton *)caiBtn
{
    if (_caiBtn == nil) {
        _caiBtn = [UIButton buttonWithTitle:nil highTitle:nil image:@"mainCellCai" highImage:@"mainCellCaiClick" target:nil action:nil];
        [self.btns addObject:_caiBtn];
        [self addSubview:_caiBtn];
    }
    return _caiBtn;
}
- (UIButton *)shareBtn
{
    if (_shareBtn == nil) {
        _shareBtn = [UIButton buttonWithTitle:nil highTitle:nil image:@"mainCellShare" highImage:@"mainCellShareClick" target:nil action:nil];
        [self.btns addObject:_shareBtn];
        [self addSubview:_shareBtn];
    }
    return _shareBtn;
}
- (UIButton *)commitBtn
{
    if (_commitBtn == nil) {
        _commitBtn = [UIButton buttonWithTitle:nil highTitle:nil image:@"mainCellComment" highImage:@"mainCellCommentClick" target:nil action:nil];
        [self.btns addObject:_commitBtn];
        [self addSubview:_commitBtn];
    }
    return _commitBtn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.lineView.frame = CGRectMake(0, 0, self.width, 1);
    CGFloat btnW = self.width / 4;
    self.dingBtn.frame = CGRectMake(0, 1, btnW, self.height - 1);
    self.caiBtn.frame = CGRectMake(btnW, 1, btnW, self.height - 1);
    self.shareBtn.frame = CGRectMake(2 * btnW, 1, btnW, self.height - 1);
    self.commitBtn.frame = CGRectMake(3 * btnW, 1, btnW, self.height - 1);
   
}
@end
