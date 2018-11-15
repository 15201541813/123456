//
//  LYEssenceCommentCell.m
//  123456
//
//  Created by 李艳 on 2018/11/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceCommentCell.h"

@implementation LYEssenceCommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    LYEssenceCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[LYEssenceCommentCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ID"];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 10;
    frame.size.width = LYScreenWidth - 20;
    [super setFrame:frame];
}
@end
