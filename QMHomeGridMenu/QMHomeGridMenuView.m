//
//  QMHomeGridMenuView.m
//
//  Created by HeQichang on 15/3/31.
//  Copyright (c) 2015年 HeQichang. All rights reserved.
//

#import "QMHomeGridMenuView.h"
#import "QMHomeGridMenuViewCell.h"

@interface QMHomeGridMenuView ()

@property (nonatomic, strong) NSMutableArray *cells;
@property (nonatomic, strong) UIPageControl *navPC;

@end

@implementation QMHomeGridMenuView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cells = [[NSMutableArray alloc] init];
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.backgroundColor = [UIColor whiteColor];
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    self.frame = CGRectMake(0, 0, mainRect.size.width, 180);
    self.contentSize = CGSizeMake(mainRect.size.width, 180);
    
    self.navPC = [[UIPageControl alloc] init];
    
    self.navPC.frame =  CGRectMake(0,
                                   self.frame.size.height - 20,
                                   self.frame.size.width,
                                   20);
    self.navPC.numberOfPages = 1;
    self.navPC.currentPage = 0;
    self.navPC.backgroundColor = [UIColor whiteColor];
    self.navPC.pageIndicatorTintColor = [UIColor grayColor];
    self.navPC.currentPageIndicatorTintColor = [UIColor colorWithRed:235.0/255.0 green:88.0/255.0 blue:78.0/255.0 alpha:1];
    [self addSubview:self.navPC];
    self.navPC.hidden = YES;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self reloadData];
}

- (void)reloadData {
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    NSInteger numberOfCell = [self.dataSource numberOfCellsInGridMenuView:self];
    NSInteger page = ceil(numberOfCell * 1.0 / 8) ;
    CGFloat contentWidth = mainRect.size.width * page;
    self.contentSize = CGSizeMake(contentWidth, 180);
    
    if (page > 1) {
        self.navPC.hidden = NO;
        self.navPC.numberOfPages = page;
    }
    
    CGFloat cellWidth = mainRect.size.width / 4;
    CGFloat cellHeight = 75;
    CGFloat cellX = 0;
    CGFloat cellY = 0;
    NSInteger currentPage = 0;
    NSInteger currentRow = 0;
    for (NSInteger index = 0; index < numberOfCell; index++) {
        
        // 计算每个cell的frame
        if (index / 8 > currentPage) {
            currentPage++;
            currentRow = 0;
            cellY = 0;
            cellX = currentPage * mainRect.size.width;
        } else {
            if (index % 4 == 0) {
                cellX = currentPage * mainRect.size.width;
                cellY = index % 8 == 0 ? 0 : cellHeight;
            } else {
                cellX = currentPage * mainRect.size.width + cellWidth * (index % 4);
            }
        }

        QMHomeGridMenuViewCell *cell = [self.dataSource gridMenuView:self cellAtIndex:index];
        cell.frame = CGRectMake(cellX, cellY, cellWidth, cellHeight);
        [self addSubview:cell];
        [self.cells addObject:cell];
        cell.cellImageView.frame = CGRectMake(cellWidth / 2  - 20, cellHeight / 2 - 20, 40, 40);
        cell.cellTitleLabel.frame = CGRectMake(0, cellHeight / 2 + 25, cellWidth, 20);
    }
}

// 滚动时触发这个函数
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    
    CGRect navPCRect = self.navPC.frame;
    navPCRect.origin.x = self.contentOffset.x;
    self.navPC.frame = navPCRect;
    
    float currentPage = self.contentOffset.x / mainRect.size.width;
    self.navPC.currentPage = ceil(currentPage);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.gridDelegate respondsToSelector:@selector(gridMenuView:didSelectAtIndex:)]) {
        return;
    }else{
        UITouch *touch = [touches anyObject];
        
        CGPoint point = [touch locationInView:self];
        __block NSInteger selectIndex = -1;
        [self.cells enumerateObjectsUsingBlock:^(QMHomeGridMenuViewCell *cell, NSUInteger idx, BOOL *stop) {
            if (CGRectContainsPoint(cell.frame, point)) {
                selectIndex = idx;
                *stop = YES;
            }
        }];
        
        if (selectIndex > -1) {
            [self.gridDelegate gridMenuView:self didSelectAtIndex:selectIndex];
        }
    }
}





@end
