//
//  LYRecommendTagCell.h
//  123456
//
//  Created by 李艳 on 2018/10/31.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYRecommendTag;
NS_ASSUME_NONNULL_BEGIN

@interface LYRecommendTagCell : UITableViewCell
@property (nonatomic, assign)CGFloat cellHeight;
@property (nonatomic, strong) LYRecommendTag *recTag;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
