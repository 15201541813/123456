//
//  LYFastLoginBtn.m
//  123456
//
//  Created by 李艳 on 2018/11/6.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYFastLoginBtn.h"

@implementation LYFastLoginBtn
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat Y = CGRectGetMaxY(self.imageView.frame);
    CGFloat H = self.height - self.imageView.height;
    CGFloat W = self.width;
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.titleLabel.frame = CGRectMake(0, Y, W, H);
}

@end
