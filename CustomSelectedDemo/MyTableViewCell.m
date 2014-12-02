//
//  MyTableViewCell.m
//  CustomSelectedDemo
//
//  Created by 孙博弘 on 14/12/2.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

#import "MyTableViewCell.h"

#define kMySelectedKeyPath   @"mySelected"
@implementation MyTableViewCell

-(void)awakeFromNib
{
    [self addObserver:self forKeyPath:kMySelectedKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:kMySelectedKeyPath];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath  isEqual: kMySelectedKeyPath]) {
        self.titleLabel.text = self.mySelected ? @"选中":@"未选中";
        self.stateLabel.text = self.mySelected ? @"√":@"×";
    }
}

@end
