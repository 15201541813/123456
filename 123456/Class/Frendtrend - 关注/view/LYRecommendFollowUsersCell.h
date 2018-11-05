//
//  LYRecommendFollowUsersCell.h
//  123456
//
//  Created by 李艳 on 2018/11/5.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYRecommendFollowUsers.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYRecommendFollowUsersCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) LYRecommendFollowUsers *user;
@end

NS_ASSUME_NONNULL_END
