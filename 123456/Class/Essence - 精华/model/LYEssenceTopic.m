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
      CGSize maxSize = CGSizeMake(LYScreenWidth - 40, MAXFLOAT);
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGFloat textLabelHeight = [self.text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attribute context:nil].size.height;
        _rowHeight = 40 + 40 + textLabelHeight;
        self.textLabelFrame = CGRectMake(10, 60, LYScreenWidth - 40, textLabelHeight);
    }
    return _rowHeight;
}
@end
