//
//  LYEssenceCell.h
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYEssenceTopic;
NS_ASSUME_NONNULL_BEGIN

@interface LYEssenceCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) LYEssenceTopic *topic;
@end

NS_ASSUME_NONNULL_END
