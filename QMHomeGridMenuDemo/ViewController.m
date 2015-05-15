//
//  ViewController.m
//  QMHomeGridMenuDemo
//
//  Created by HeQichang on 15/5/14.
//  Copyright (c) 2015年 heqichang. All rights reserved.
//

#import "ViewController.h"
#import "QMHomeGridMenuView.h"
#import "QMHomeGridMenuViewCell.h"

@interface ViewController ()<QMHomeGridMenuViewDataSource, QMHomeGridMenuViewDelegate>

@property (nonatomic, strong) NSArray *gridMenus;
@property (nonatomic, strong) QMHomeGridMenuView *menuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gridMenus = @[
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_foodCategory"], @"title": @"美食", @"id": @"101"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_fastfoodCategory"], @"title": @"小吃美食", @"id": @"102"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_hotelCategory"], @"title": @"酒店", @"id": @"103"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_KTVCategory"], @"title": @"KTV", @"id": @"104"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_dailyNewDealCategory"], @"title": @"今日新单", @"id": @"105"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_travellingCategory"], @"title": @"旅游", @"id": @"106"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_CouponCategory"], @"title": @"代金券", @"id": @"107"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_movieCategory"], @"title": @"电影", @"id": @"108"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_entertainmentCategory"], @"title": @"休闲娱乐", @"id": @"109"},
                           @{@"icon": [UIImage imageNamed:@"icon_homepage_moreCategory"], @"title": @"更多", @"id": @"110"}
                      ];
    
    
    self.menuView = [[QMHomeGridMenuView alloc] init];
    self.menuView.dataSource = self;
    self.menuView.gridDelegate = self;
    
    [self.view addSubview:self.menuView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - QMHomeGridMenuViewDataSource

/**
 *  一共有多少数据
 */
- (NSUInteger)numberOfCellsInGridMenuView:(QMHomeGridMenuView *)gridMenuView {
    return [self.gridMenus count];
}

/**
 *  返回index位置对应的cell
 */
- (QMHomeGridMenuViewCell *)gridMenuView:(QMHomeGridMenuView *)gridMenuView cellAtIndex:(NSUInteger)index {
    QMHomeGridMenuViewCell *cell = [[QMHomeGridMenuViewCell alloc] init];
    cell.cellImageView.image = self.gridMenus[index][@"icon"];
    cell.cellTitleLabel.text = self.gridMenus[index][@"title"];
    return cell;
}


#pragma mark - QMHomeGridMenuViewDelegate
- (void)gridMenuView:(QMHomeGridMenuView *)gridMenuView didSelectAtIndex:(NSUInteger)index {
    NSString *title = self.gridMenus[index][@"title"];
    NSString *menuId = self.gridMenus[index][@"id"];
    
    NSLog(@"title: %@, id: %@", title, menuId);
}

@end
