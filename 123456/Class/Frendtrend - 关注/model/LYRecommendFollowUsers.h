//
//  LYRecommendFollowUsers.h
//  123456
//
//  Created by 李艳 on 2018/11/2.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**uid    string    推荐的用户id
 fans_count    string    所推荐用户的被关注量
 is_follow    int    是否是我关注的用户
 gender    int    性别,0为男，1为女
 screen_name    string    所推荐的用户昵称
 header    string    所推荐的用户的头像url
 introduction    string    用户描述
 tiezi_count    int    所发表的贴子数量
 total    int    一共加载了多少个推荐用户
 next_page    int    下一页的页码
 total_page    int    总共页码数
*/
@interface LYRecommendFollowUsers : NSObject
@property (nonatomic, strong)NSString *header;
@property (nonatomic, strong)NSString *screen_name;
@property (nonatomic, strong)NSString *fans_count;
@property (nonatomic, assign)CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
