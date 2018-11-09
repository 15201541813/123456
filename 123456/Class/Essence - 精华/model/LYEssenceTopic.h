//
//  LYEssenceTopic.h
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYEssenceTopic : NSObject
/**帖子的被评论数量*/
@property (nonatomic, strong) NSString *comment;
/**帖子顶的数量*/
@property (nonatomic, strong) NSString *love;
/**发帖人的昵称*/
@property (nonatomic, strong) NSString *screen_name;
/**帖子的内容*/
@property (nonatomic, strong) NSString *text;
/**系统审核通过后创建帖子的时间*/
@property (nonatomic, strong) NSString *created_at;
/**踩的人数*/
@property (nonatomic, strong) NSString *cai;
/**转发的数量*/
@property (nonatomic, strong) NSString *repost;
/**头像的图片url地址*/
@property (nonatomic, strong) NSString *profile_image;
/**cell高度*/
@property (nonatomic, assign) CGFloat rowHeight;
/**正文label的frame*/
@property (nonatomic, assign) CGRect textLabelFrame;
/**数据返回的类型*/
@property (nonatomic, assign)LYEssenceOfTopic type;
/**显示在页面中的视频图片的url*/
@property (nonatomic, strong) NSString *image1;
/**返回图片的高度*/
@property (nonatomic, assign) CGFloat height;
/**返回图片的w宽度*/
@property (nonatomic, assign) CGFloat width;
/**是否是gif动画*/
@property (nonatomic, strong) NSString *is_gif;
/**是否是新浪会员*/
@property (nonatomic, assign) int sina_v;
/**返回的图片是否是大图*/
@property (nonatomic, assign) int isBigPicture;
@property (nonatomic, assign) CGRect pictureFrame;
@end

NS_ASSUME_NONNULL_END
