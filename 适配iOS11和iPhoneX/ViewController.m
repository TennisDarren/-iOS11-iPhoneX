//
//  ViewController.m
//  适配iOS11和iPhoneX
//
//  Created by Darren  xu on 2017/12/30.
//  Copyright © 2017年 Darren  xu. All rights reserved.
//
static NSString * const MYCELL = @"mycell";

#import "ViewController.h"
#import "DXTableViewCell.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 适配 MJRefresh
    if (@available(iOS 11.0, *)) {
        self.tab.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
    [self setupNav];
    
    [self.tab registerClass:[DXTableViewCell class] forCellReuseIdentifier:MYCELL];
    [self.view addSubview:self.tab];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 4;
    }
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MYCELL forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeader = [UIView new];
    sectionHeader.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
//    sectionHeader.backgroundColor = [UIColor blackColor];
    return sectionHeader;
}

- (void)setupNav{
//  [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationItem.title = @"适配iPhone X";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(doSomething)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doSomething)];
}

- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tab.backgroundColor = [UIColor lightGrayColor];
        _tab.contentInset = UIEdgeInsetsMake(SafeAreaTopHeight, 0, SafeAreaBottomHeight, 0);
        _tab.delegate = self;
        _tab.dataSource = self;
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            NSLog(@"开始刷新");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"停止刷新");
                [_tab.mj_header endRefreshing];
            });
        }];
        _tab.mj_header = header;
    }
    return _tab;
}

- (void)doSomething{
    NSLog(@"点击按钮");
}


@end
