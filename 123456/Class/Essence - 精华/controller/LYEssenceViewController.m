//
//  LYEssenceViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceViewController.h"
#import "UIBarButtonItem+extension.h"
#import "LYRecommendTagController.h"
#import "LYEssenceWordController.h"
#import "LYEssenceAllController.h"
#import "LYEssenceVideoController.h"
#import "LYEssencePictureController.h"
#import "LYEssenceVoiceController.h"
@interface LYEssenceViewController ()<UIScrollViewDelegate>
/**标题view*/
@property (nonatomic, strong) UIView *titleView;
/**内容的ScrollView*/
@property (nonatomic, strong) UIScrollView *topicScrollView;
/**标题view中的红色指示器*/
@property (nonatomic, weak)UIView *indicater;
/**存储被选则的标题view中的按钮*/
@property (nonatomic, strong)UIButton *selectedBtn;
/**存放标题view中的所有按钮的数组*/
@property (nonatomic, strong) NSMutableArray *titles;
@end

@implementation LYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //界面基本设置
    [self basicSetting];
    //添加子控制器
    [self addChildViewControllers];
    //添加控件
    [self addSubviews];
}
#pragma mark - addSubviews添加控件
- (void)addSubviews
{
    [self.view addSubview:self.titleView];
    [self.view insertSubview:self.topicScrollView atIndex:0];
}
#pragma mark - basicSetting界面基本设置
- (void)basicSetting
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(buttonClick)];
}

#pragma mark - addChildViewControllers添加所有的自控制器
- (void)addChildViewControllers
{
    [self addChildviewControllersWithController:[[LYEssenceWordController alloc] init] title:@"段子"];
    [self addChildviewControllersWithController:[[LYEssenceAllController alloc] init] title:@"全部"];
    [self addChildviewControllersWithController:[[LYEssencePictureController alloc] init] title:@"图片"];
    [self addChildviewControllersWithController:[[LYEssenceVideoController alloc] init] title:@"视频"];
    [self addChildviewControllersWithController:[[LYEssenceVoiceController alloc] init] title:@"声音"];
    
}
#pragma mark - 添加每个自控制器
- (void)addChildviewControllersWithController:(UIViewController *)controller title:(NSString *)title
{
    [self addChildViewController:controller];
    controller.title = title;
}
#pragma mark - buttonClick
- (void)buttonClick
{
    LYRecommendTagController *tag = [[LYRecommendTagController alloc] init];
    [self.navigationController pushViewController:tag animated:YES];
}

#pragma mark - 标题view中button的布局
- (void)layoutTitles
{
    NSInteger count = self.childViewControllers.count;
    CGFloat W = LYScreenWidth / count;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *title = [[UIButton alloc] init];
        [title setTitle:self.childViewControllers[i].title forState:(UIControlStateNormal)];
        [_titleView addSubview:title];
        [self.titles addObject:title];
        [title setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [title setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        title.titleLabel.font = [UIFont systemFontOfSize:14];
        [title addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchDown)];
        title.x = W * i;
        [title sizeToFit];
        title.centerY = _titleView.height * 0.5;
        title.width = W;
        if (i == 0) {
            title.selected = YES;
            self.selectedBtn = title;
            [title setNeedsLayout];
            [title layoutIfNeeded];
            self.indicater.width = title.titleLabel.width;
            self.indicater.centerX = title.centerX;
            self.indicater.height = 2;
            self.indicater.y = _titleView.height - 2;
        }
    }
}
#pragma mark - 控件懒加载
- (UIView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[UIView alloc] init];
        _titleView.frame = CGRectMake(0, 85, LYScreenWidth, 44);
        _titleView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.6];
        [self layoutTitles];
        
    }
    return _titleView;
}

- (NSMutableArray *)titles
{
    if (_titles == nil) {
        _titles = [NSMutableArray array];
    }
    return _titles;
}
- (UIView *)indicater
{
    if (_indicater == nil) {
        UIView *indicater = [[UIView alloc] init];
        [self.titleView addSubview:indicater];
        _indicater = indicater;
        _indicater.backgroundColor = [UIColor redColor];
        
    }
    return _indicater;
}

- (UIScrollView *)topicScrollView
{
    if (_topicScrollView == nil) {
        _topicScrollView = [[UIScrollView alloc] init];
        _topicScrollView.pagingEnabled = YES;
        _topicScrollView.showsHorizontalScrollIndicator = NO;
        _topicScrollView.showsVerticalScrollIndicator = NO;
        _topicScrollView.backgroundColor = [UIColor clearColor];
        _topicScrollView.frame = self.view.bounds;
        _topicScrollView.contentSize = CGSizeMake(LYScreenWidth * self.childViewControllers.count, 0);
        _topicScrollView.delegate = self;
        [self scrollViewDidEndScrollingAnimation:_topicScrollView];
        
    }
    return _topicScrollView;
}
#pragma mark - buttonClick:点击标题按钮
- (void)buttonClick:(UIButton *)button
{
    NSInteger index = [self.titles indexOfObject:button];
    CGPoint point = CGPointMake(LYScreenWidth * index, 0);
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    self.indicater.width = button.titleLabel.width;
    self.indicater.height = 2;
    self.indicater.y = self.titleView.height - 2;
    [UIView animateWithDuration:0.25 animations:^{
        self.indicater.centerX = button.centerX;
        [self.topicScrollView setContentOffset:point animated:YES];
    }];
    [self.topicScrollView setContentOffset:point animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //[self scrollViewDidEndDecelerating:scrollView];
    CGFloat Y = CGRectGetMaxY(self.titleView.frame);
    CGPoint point = scrollView.contentOffset;
    NSInteger index = point.x / LYScreenWidth;
    UITableViewController *vc = self.childViewControllers[index];
    [self.topicScrollView addSubview:vc.view];
    CGFloat X = index * LYScreenWidth;
    vc.tableView.frame = CGRectMake(X, 0, LYScreenWidth, LYScreenHeight);
    vc.tableView.contentInset = UIEdgeInsetsMake(Y, 0, 0, 0);
    vc.tableView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSInteger index = point.x / LYScreenWidth;
    UIButton *btn = self.titles[index];
    [self buttonClick:btn];
    
}
@end
