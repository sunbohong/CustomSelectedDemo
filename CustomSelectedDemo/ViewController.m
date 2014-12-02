//
//  ViewController.m
//  CustomSelectedDemo
//
//  Created by 孙博弘 on 14/12/2.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

#import "ViewController.h"

#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableSet *selctedIndexPathSet;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	//初始化
	self.selctedIndexPathSet = [NSMutableSet set];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	cell.mySelected = [self.selctedIndexPathSet containsObject:indexPath];
	return cell;
}

#pragma mark-

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:true];
	MyTableViewCell *cell = (MyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
	cell.mySelected = !cell.mySelected;
	if ([self.selctedIndexPathSet containsObject:indexPath]) {
		[self.selctedIndexPathSet removeObject:indexPath];
	}
	else {
		[self.selctedIndexPathSet addObject:indexPath];
	}
}

@end
