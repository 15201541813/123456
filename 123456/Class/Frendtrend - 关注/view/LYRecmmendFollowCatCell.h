//
//  LYRecmmendFollowCatCell.h
//  123456
//
//  Created by 李艳 on 2018/11/1.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYRecommendFollowCategory;
NS_ASSUME_NONNULL_BEGIN

@interface LYRecmmendFollowCatCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong)LYRecommendFollowCategory *category;
@end

NS_ASSUME_NONNULL_END
