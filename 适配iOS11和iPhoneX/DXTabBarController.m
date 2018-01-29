//
//  DXTabBarController.m
//  适配iOS11和iPhoneX
//
//  Created by Darren  xu on 2018/1/7.
//  Copyright © 2018年 Darren  xu. All rights reserved.
//

#import "DXTabBarController.h"
#import "ViewController.h"

@interface DXTabBarController ()

@end

@implementation DXTabBarController

// 修改tabBarItem选中时title的颜色
+ (void)load{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabBar_essence_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_essence_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精选" image:[[UIImage imageNamed:@"tabBar_friendTrends_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    nav3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"回忆" image:[[UIImage imageNamed:@"tabBar_new_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_new_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    nav4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人" image:[[UIImage imageNamed:@"tabBar_me_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_me_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
//    [self addChildViewController:nav1];
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor darkGrayColor];
    [self.tabBar addSubview:line];
    
}


@end
