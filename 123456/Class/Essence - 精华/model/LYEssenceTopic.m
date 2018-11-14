//
//  LYEssenceTopic.m
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceTopic.h"

@implementation LYEssenceTopic
- (CGFloat)rowHeight
{
    if (!_rowHeight) {
        CGFloat textWidth = LYScreenWidth - 40;
        CGSize maxSize = CGSizeMake(LYScreenWidth - 40, MAXFLOAT);
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGFloat textLabelHeight = [self.text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attribute context:nil].size.height;
        _rowHeight = 40 + 40 + textLabelHeight + 44;
        self.textLabelFrame = CGRectMake(10, 60, textWidth, textLabelHeight);
        CGFloat textLabelMaxY = CGRectGetMaxY(self.textLabelFrame);
        if (self.type == LYEssenceOfTopicPicture) {
            CGFloat pictureW = textWidth;
            CGFloat pictureH = pictureW * self.height / self.width;
            if (pictureH > 800) {
                self.isBigPicture = YES;
                pictureH = 250;
            }else self.isBigPicture = NO;
            self.pictureFrame = CGRectMake(10, textLabelMaxY + 10, pictureW, pictureH);
            _rowHeight += pictureH + 10;
        }
        if (self.type == LYEssenceOfTopicVideo) {
            CGFloat pictureW = textWidth;
            CGFloat pictureH = pictureW * self.height / self.width;
            self.videoFrame = CGRectMake(10, textLabelMaxY + 10, pictureW, pictureH);
            _rowHeight += pictureH + 10;
        }
        self.bottomViewFrame = CGRectMake(0, _rowHeight - 54, LYScreenWidth - 20, 44);
    }
    return _rowHeight;
}
@end
