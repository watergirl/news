//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"
#import "VideoViewModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)VideoViewModel *videoVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController


- (VideoViewModel *)videoVM {
    if(_videoVM == nil) {
        _videoVM = [[VideoViewModel alloc] init];
    }
    return _videoVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableView reloadData];
            [_tableView.header endRefreshing];
        }];
    }];
    
    _tableView.footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView reloadData];
            [_tableView.footer endRefreshing];
        }];
    }];
    [_tableView.header beginRefreshing];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource

//注意是 group 格式以 section 区分

//设置 section 的头部高度.至少1
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置脚步高度9
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}
//row 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = kWindowW *540.0/720;
    return height;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLable.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLable.text =[self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL = [self.videoVM videoURLForRow:indexPath.section];
    
    return cell;
}







@end
