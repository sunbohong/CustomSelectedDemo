//
//  MyTableViewCell.h
//  CustomSelectedDemo
//
//  Created by 孙博弘 on 14/12/2.
//  Copyright (c) 2014年 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property BOOL mySelected;

//表示状态
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;

 

@end
