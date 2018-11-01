//
//  LYRecommendTagController.m
//  123456
//
//  Created by 李艳 on 2018/10/31.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommendTagController.h"
#import "LYRecommendTagCell.h"
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "LYRecommendTag.h"
@interface LYRecommendTagController ()
@property (nonatomic, strong)NSArray *recTags;
@end

@implementation LYRecommendTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    //界面基本设置
    [self basicSetting];
}
#pragma mark - basicSetting界面基本设置
- (void)basicSetting
{
    self.navigationItem.title = @"推荐标签";
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    [self refreshData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [self.tableView.mj_header beginRefreshing];
}
#define mark - refreshData加载数据
- (void)refreshData
{
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";

    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
        self->_recTags = [LYRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.recTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecommendTagCell *cell = [LYRecommendTagCell cellWithTableView:tableView];
    cell.recTag = self.recTags[indexPath.row];
    return cell;
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecommendTag *recTag = self.recTags[indexPath.row];
    return [recTag.rowHeight integerValue];
    
}
@end
