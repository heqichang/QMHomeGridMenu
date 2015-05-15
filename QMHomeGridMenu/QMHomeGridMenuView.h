//
//  QMHomeGridMenuView.h
//
//  Created by HeQichang on 15/3/31.
//  Copyright (c) 2015年 HeQichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QMHomeGridMenuViewCell;
@class QMHomeGridMenuView;

// GridMenu 数据源
@protocol QMHomeGridMenuViewDataSource <NSObject>

//要求强制实现
@required
/**
 *  一共有多少数据
 */
- (NSUInteger)numberOfCellsInGridMenuView:(QMHomeGridMenuView *)gridMenuView;

/**
 *  返回index位置对应的cell
 */
- (QMHomeGridMenuViewCell *)gridMenuView:(QMHomeGridMenuView *)gridMenuView cellAtIndex:(NSUInteger)index;

@end

@protocol QMHomeGridMenuViewDelegate <UIScrollViewDelegate>

@optional

/**
 *  选中第index位置的cell
 */
- (void)gridMenuView:(QMHomeGridMenuView *)gridMenuView didSelectAtIndex:(NSUInteger)index;

@end


@interface QMHomeGridMenuView : UIScrollView

@property (nonatomic, weak) id<QMHomeGridMenuViewDataSource> dataSource;

// UIScrollView有个delegate属性
@property (nonatomic, weak) id<QMHomeGridMenuViewDelegate> gridDelegate;

/**
 *  刷新数据
 */
- (void)reloadData;

@end



