//
//  UIView+SetPreview.h
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYChildPreView.h"
#import "ZYPreviewProtocol.h"

@interface UIView (SetPreview)<ZYPreviewProtocol>

/**
 显示在当前视图上的视图容器
 */
@property (nonatomic, strong) ZYChildPreView *containerView;

/**
 开始预加载
 */
- (void)beginPreview;

/**
 结束预加载
 */
- (void)endPreview;

@end
