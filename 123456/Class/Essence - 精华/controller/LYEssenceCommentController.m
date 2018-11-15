//
//  LYEssenceCommentController.m
//  123456
//
//  Created by 李艳 on 2018/11/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceCommentController.h"
#import "LYEssenceCell.h"
#import "LYEssenceTopic.h"
#import "LYEssenceCommentCell.h"
@interface LYEssenceCommentController ()

@end

@implementation LYEssenceCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicSetting];
    [self addTableViewHeaderView];

}
- (void)basicSetting
{
    self.title = @"评论";
    self.tableView.backgroundColor = LYDefaultColor;
    self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 20, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)addTableViewHeaderView
{
    UIView *header = [[UIView alloc] init];
    self.tableView.tableHeaderView = header;
    header.backgroundColor = [UIColor redColor];
    header.height = self.topic.rowHeight + 10;
    
    LYEssenceCell *cell = [LYEssenceCell cellWithTableView:self.tableView];
    cell.backgroundColor = [UIColor whiteColor];
    cell.topic = self.topic;
    [header addSubview:cell];
    cell.size = CGSizeMake(LYScreenWidth - 20, self.topic.rowHeight);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }if (section == 1) {
        return 4;
    }else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYEssenceCommentCell *cell = [LYEssenceCommentCell cellWithTableView:tableView];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] init];
    
    [view addSubview:label];

    label.width = LYScreenWidth;
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"最新评论";
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    return view;
}


@end
