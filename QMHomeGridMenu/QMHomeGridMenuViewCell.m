//
//  QMHomeGridMenuViewCell.m
//
//  Created by HeQichang on 15/3/31.
//  Copyright (c) 2015年 HeQichang. All rights reserved.
//

#import "QMHomeGridMenuViewCell.h"

@implementation QMHomeGridMenuViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellImageView = [[UIImageView alloc] init];
        self.cellTitleLabel = [[UILabel alloc] init];
        self.cellTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.cellTitleLabel.font = [UIFont systemFontOfSize:14];
        self.cellTitleLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        [self addSubview:self.cellImageView];
        [self addSubview:self.cellTitleLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
