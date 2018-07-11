//
//  UIView+SetPreview.m
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import "UIView+SetPreview.h"
#import <objc/message.h>
#import "ZYChildPreView.h"
#import "ZYChildPreViewFeatures.h"

const char *containerViewId = "containerViewId";

@implementation UIView (SetPreview)

- (void)setContainerView:(ZYChildPreView *)containerView
{
    objc_setAssociatedObject(self, &containerViewId, containerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZYChildPreView *)containerView
{
    return objc_getAssociatedObject(self, &containerViewId);
}

#pragma mark - 开始预加载
- (void)beginPreview
{
    if (![self respondsToSelector:@selector(childViewsFrameAndBackgroundColorForPreview)]) {
        
        return;
    }
    
    self.containerView = [[ZYChildPreView alloc] initWithFrame:self.bounds];
    
    //给一个背景颜色
    self.containerView.backgroundColor = [UIColor whiteColor];
    
    //背景不添加动画
    self.containerView.showWithAnimation = NO;
    
    [self addSubview:self.containerView];

    //将containerView放到最前面
    [self bringSubviewToFront:self.containerView];
    
    NSArray *features = [self childViewsFrameAndBackgroundColorForPreview];
    
    [self setupContainerViewAndChildPreviews:features];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - 添加所有子视图
- (void)setupContainerViewAndChildPreviews:(NSArray *)features
{
    for (NSInteger i=0; i<features.count; i++) {
        
        ZYChildPreViewFeatures *feature = features[i];
        
        ZYChildPreView *childView = [ZYChildPreView new];
        childView.frame = feature.frame;
        childView.backgroundColor = feature.backgroundColor;

        //默认显示动画
        if (!feature.showWithAnimation) {
            
            childView.showWithAnimation = YES;
        }else{
            
            childView.showWithAnimation = feature.showWithAnimation;
        }
        
        //加载的动画类型
        if (!feature.animationType) {
            
            childView.animationType = 1;
        }else{
            
            childView.animationType = feature.animationType;
        }
        
        //圆角
        if (feature.cornerRadius) {
            
            childView.layer.cornerRadius = feature.cornerRadius;
            childView.layer.masksToBounds = YES;
        }
        
        [self.containerView addSubview:childView];
    }
}

#pragma mark - 结束预加载
- (void)endPreview
{
    [self removeContainerViewAndChildPreviews];
}

#pragma mark - 移除所有子视图
- (void)removeContainerViewAndChildPreviews
{
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.containerView removeFromSuperview];
    self.containerView = nil;
}





@end
