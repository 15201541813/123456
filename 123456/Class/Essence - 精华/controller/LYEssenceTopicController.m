//
//  LYEssenceTopicController.m
//  123456
//
//  Created by 李艳 on 2018/11/8.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceTopicController.h"
#import "LYEssenceCell.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "LYEssenceTopic.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import "LYNewViewController.h"
@interface LYEssenceTopicController ()
@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, strong) NSString *maxtime;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSMutableDictionary *param;
@end

@implementation LYEssenceTopicController
- (void)viewDidLoad {
    [super viewDidLoad];
    //界面基本设置
    [self basicSeting];
    //加载数据
    [self setRefresh];
}

#pragma mark - 界面基本设置
- (void)basicSeting
{
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.rowHeight = 300;
}
#pragma mark - setRefresh
- (void)setRefresh
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDatas)];
    self.tableView.mj_footer.hidden = YES;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    [self.tableView.mj_header beginRefreshing];
}

- (NSString *)a
{
    if ([self.parentViewController isKindOfClass:[LYNewViewController class]]) {
        return @"newlist";
    }else return @"list";
}
#pragma mark - loadMoreDatas上拉加载更多信息
- (void)loadMoreDatas
{
    [self.tableView.mj_header endRefreshing];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = [self a];
    param[@"c"] = @"data";
    param[@"maxtime"] = self.maxtime;
    param[@"type"] = @(self.type);
    NSInteger page = self.currentPage + 1;
    param[@"page"] = @(page);
    self.param = param;
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (self.param != param) return;
        self.currentPage = page;
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSArray *topic = [LYEssenceTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:topic];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
        [self.tableView.mj_footer endRefreshing];
    }];
    
}
- (NSMutableArray *)topics
{
    if (_topics == nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}
#pragma mark - loadNewDatas下拉加载最新数据
- (void)loadNewDatas
{
    [self.tableView.mj_footer endRefreshing];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = [self a];
    param[@"c"] = @"data";
    param[@"type"] = @(self.type);
    self.param = param;
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.param != param) return;
        [SVProgressHUD dismiss];
        [self.tableView.mj_header endRefreshing];
        self.currentPage = 0;
        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.topics = [LYEssenceTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
        if (self.param != param) return;
        [self.tableView.mj_header endRefreshing];
    }];
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.topics.count) {
        self.tableView.mj_footer.hidden = NO;
    }
    
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYEssenceCell *cell = [LYEssenceCell cellWithTableView:tableView];
    cell.topic = self.topics[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYEssenceTopic *topic = self.topics[indexPath.row];
    return topic.rowHeight;
}


@end
