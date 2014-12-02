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

- (void)awakeFromNib {
	self.stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
	self.stateLabel.center = CGPointMake(-40, CGRectGetHeight(self.frame) / 2);
	self.stateLabel.textColor = [UIColor redColor];
	[self addSubview:self.stateLabel];

	[self addObserver:self forKeyPath:kMySelectedKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
	[self removeObserver:self forKeyPath:kMySelectedKeyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([keyPath isEqual:kMySelectedKeyPath]) {
		self.textLabel.text = self.mySelected ? @"选中" : @"未选中";
		self.stateLabel.text = self.mySelected ? @"√" : @"×";
	}
}

- (void)hideEditControl {
	UIView *editControl = [self searchEditControlWith:self];
	editControl.hidden = true;
}

- (UIView *)searchEditControlWith:(UIView *)currentView {
	UIView *editControl;
	for (UIView *subView in currentView.subviews) {
		{
			if ([subView isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]) {
				editControl = subView;
			}
			else {
				editControl = [self searchEditControlWith:subView];
			}
		}
	}
	return editControl;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];

	[self hideEditControl];


	if (editing) {
		[UIView animateWithDuration:0.25 animations: ^{
		    self.stateLabel.center = CGPointMake(40, CGRectGetHeight(self.frame) / 2);
		} completion: ^(BOOL finished) {
		}];
	}
	else {
		[UIView animateWithDuration:0.25 animations: ^{
		    self.stateLabel.center = CGPointMake(-40, CGRectGetHeight(self.frame) / 2);
		} completion: ^(BOOL finished) {
		}];
	}
}

@end
