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
@property (nonatomic, strong)NSMutableArray *recTags;
@end

@implementation LYRecommendTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐标签";
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [self.tableView.mj_header beginRefreshing];
   
}

- (NSMutableArray *)recTags
{
    if (_recTags == nil) {
        _recTags = [NSMutableArray array];
    }
    return _recTags;
}
#define mark - 加载数据
- (void)refreshData
{
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        self.recTags = [LYRecommendTag objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败!"];
    }];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"a"] = @"tag_recommend";
//    params[@"action"] = @"sub";
//    params[@"c"] = @"topic";
//
//    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [self.tableView.mj_header endRefreshing];
//        [SVProgressHUD dismiss];
//        self.recTags = [LYRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
//        [self.tableView reloadData];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self.tableView.mj_header endRefreshing];
//        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
//    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.recTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecommendTagCell *cell = [LYRecommendTagCell cellWithTableView:tableView];
    LYRecommendTag *recTag = self.recTags[indexPath.row];
    cell.recTag = recTag;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
    
}
@end
