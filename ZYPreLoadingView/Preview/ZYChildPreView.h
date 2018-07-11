//
//  ZYChildPreView.h
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZYChildPreViewAnimationType)
{
    ZYChildPreViewAnimationTypeOpacity = 1,
    ZYChildPreViewAnimationTypeHor,
    ZYChildPreViewAnimationTypeVer,
};

@interface ZYChildPreView : UIView

/**
 动画类型
 */
@property (nonatomic, assign) ZYChildPreViewAnimationType animationType;

/**
 是否显示加载动画
 */
@property (nonatomic, assign) BOOL showWithAnimation;

@end
