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
@interface LYRecommenFollowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *cateTableView;
@property (nonatomic, weak) UITableView *usersTableView;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSMutableArray *users;

@end

@implementation LYRecommenFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicSetting];
    [self layoutSubviews];
    [self loadCategories];
    
    
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

- (NSMutableArray *)users
{
    if (_users == nil) {
        _users = [NSMutableArray array];
    }
    return _users;
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
    }
    return _usersTableView;
}
- (void)layoutSubviews
{
    
    self.cateTableView.frame = CGRectMake(0, 84, 100, LYScreenHeight);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecmmendFollowCatCell *cell = [LYRecmmendFollowCatCell cellWithTableView:tableView];
    cell.category = self.categories[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRecommendFollowCategory *cat = self.categories[indexPath.row];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"subscribe";
    param[@"category_id"] = cat.id;
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.users = [LYRecommendFollowUsers mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
    }];
}
@end
