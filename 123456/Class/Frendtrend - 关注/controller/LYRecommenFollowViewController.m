//
//  LYRecommenFollowViewController.m
//  123456
//
//  Created by 李艳 on 2018/11/1
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommenFollowViewController.h"
#import "LYRecmmendFollowCatCell.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "LYRecommendFollowCategory.h"
#import <MJExtension.h>
#import "LYRecommendFollowUsers.h"
#import "LYRecommendFollowUsersCell.h"
#import <MJRefresh.h>
#define rowIndex = [tableView indexPathForSelectedRow].row

@interface LYRecommenFollowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *cateTableView;
@property (nonatomic, weak) UITableView *usersTableView;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSMutableDictionary *param;

@end

@implementation LYRecommenFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicSetting];
    [self loadCategories];
    [self addRefresh];
}
- (void)addRefresh
{
    self.usersTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsersDatas)];
    [self.usersTableView.mj_header beginRefreshing];
    self.usersTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.usersTableView.mj_footer.hidden = YES;
}

- (NSMutableDictionary *)param
{
    if (_param == nil) {
        _param = [NSMutableDictionary dictionary];
    }return _param;
}
- (void)loadMoreUsers
{
    NSInteger index = [self.cateTableView indexPathForSelectedRow].row;
    LYRecommendFollowCategory *cate = self.categories[index];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"subscribe";
    param[@"category_id"] = cate.id;
    NSInteger page = self.currentPage + 1;
    param[@"page"] = @(page);
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.usersTableView.mj_header endRefreshing];
        NSArray *users = [LYRecommendFollowUsers mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [cate.users addObjectsFromArray:users];
        [self.usersTableView reloadData];
        if (cate.users.count >= [responseObject[@"total"] integerValue]) {
            [self.usersTableView.mj_footer endRefreshingWithNoMoreData];
        }else [self.usersTableView.mj_footer endRefreshing];
        self.currentPage += 1;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
        [self.usersTableView.mj_header endRefreshing];
        [self.usersTableView.mj_footer endRefreshing];
    }];
}
- (void)loadNewUsersDatas
{
    
     NSInteger index = [self.cateTableView indexPathForSelectedRow].row;
    LYRecommendFollowCategory *cate = self.categories[index];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"subscribe";
    param[@"category_id"] = cate.id;
    self.currentPage = 1;
    param[@"page"] = @(self.currentPage);
    if (self.param == param) return;
    else{
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self.usersTableView.mj_header endRefreshing];
            cate.users = [LYRecommendFollowUsers mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [self.usersTableView reloadData];
            if (cate.users.count >= [responseObject[@"total"] integerValue]) {
                [self.usersTableView.mj_footer endRefreshingWithNoMoreData];
            }else [self.usersTableView.mj_footer endRefreshing];
            self.currentPage = 1;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
            [self.usersTableView.mj_header endRefreshing];
        }];
    }
    
}
- (void)loadCategories
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"category";
    param[@"c"] = @"subscribe";
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.categories = [LYRecommendFollowCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.cateTableView reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.cateTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionTop)];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
    }];
}
- (void)basicSetting
{
    self.view.backgroundColor = LYDefaultColor;
    self.navigationItem.title = @"推荐关注";
}
- (UITableView *)cateTableView
{
    if (_cateTableView == nil) {
        UITableView *cate = [[UITableView alloc] init];
        [self.view addSubview:cate];
        _cateTableView = cate;
        _cateTableView.delegate = self;
        _cateTableView.dataSource = self;
        
        _cateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _cateTableView.backgroundColor = [UIColor clearColor];
        _cateTableView.frame = CGRectMake(0, 84, 100, LYScreenHeight);
    }
    return _cateTableView;
}

- (UITableView *)usersTableView
{
    if (_usersTableView == nil) {
        UITableView *contenTableView = [[UITableView alloc] init];
        [self.view addSubview:contenTableView];
        _usersTableView = contenTableView;
        _usersTableView.delegate = self;
        _usersTableView.dataSource = self;
        _usersTableView.backgroundColor = [UIColor clearColor];
        _usersTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _usersTableView.frame = CGRectMake(100, 84, LYScreenWidth - 100, LYScreenHeight);
        _usersTableView.contentInset = UIEdgeInsetsMake(0, 0, 104, 0);
    }
    return _usersTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger index = [self.cateTableView indexPathForSelectedRow].row;
    if (tableView == self.cateTableView) {
        return self.categories.count;
    }else {
        LYRecommendFollowCategory *cate = self.categories[index];
        if (cate.users.count) {
            self.usersTableView.mj_footer.hidden = NO;
        }else self.usersTableView.mj_footer.hidden = YES;
        return cate.users.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.cateTableView) {
        LYRecmmendFollowCatCell *cell = [LYRecmmendFollowCatCell cellWithTableView:tableView];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else if (tableView == self.usersTableView){
        NSInteger index = [self.cateTableView indexPathForSelectedRow].row;
        LYRecommendFollowCategory *cate = self.categories[index];
        LYRecommendFollowUsersCell *cell = [LYRecommendFollowUsersCell cellWithTableView:tableView];
            cell.user = cate.users[indexPath.row];
            return cell;
    }else return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecommendFollowCategory *cat = self.categories[indexPath.row];
    [self.usersTableView.mj_header endRefreshing];
    [self.usersTableView.mj_footer endRefreshing];
    [self.usersTableView reloadData];
    if (cat.users.count == 0) {
        [self.usersTableView.mj_header beginRefreshing];
    }else [self.usersTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.cateTableView) {
        return 45;
    }else{
        NSInteger index = [self.cateTableView indexPathForSelectedRow].row;
        LYRecommendFollowCategory *cate = self.categories[index];
        LYRecommendFollowUsers *user = cate.users[indexPath.row];
        return user.cellHeight;
    }
    
}
@end
