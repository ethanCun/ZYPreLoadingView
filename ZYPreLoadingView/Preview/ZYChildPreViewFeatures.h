//
//  ZYChildPreViewFeatures.h
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYChildPreViewFeatures : NSObject

/**
 frame
 */
@property (nonatomic, assign) CGRect frame;

/**
 bgColor
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 圆角
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 动画类型
 */
@property (nonatomic, assign) NSInteger animationType;

/**
 是否显示动画
 */
@property (nonatomic, assign) BOOL showWithAnimation;


@end
