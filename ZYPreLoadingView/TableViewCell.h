//
//  TableViewCell.h
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYPreviewProtocol.h"

@interface TableViewCell : UITableViewCell<ZYPreviewProtocol>

@property (nonatomic, strong) UILabel *lab1;
@property (nonatomic, strong) UILabel *lab2;
@property (nonatomic, strong) UILabel *lab3;

/**
 是否显示预加载
 */
@property (nonatomic, assign) BOOL isPreview;

/**
 加载类型
 */
@property (nonatomic, assign) NSInteger animationType;


@end
