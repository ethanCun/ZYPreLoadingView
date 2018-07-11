//
//  ZYChildPreView.m
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import "ZYChildPreView.h"

const static float gradientLayerWidth = 60;

@interface ZYChildPreView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ZYChildPreView

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.65].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.32].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.85].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.1].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.58].CGColor,
                                 (id)[[UIColor whiteColor] colorWithAlphaComponent:0.63].CGColor];
        self.gradientLayer = gradientLayer;
    }
    return _gradientLayer;
}


- (void)setShowWithAnimation:(BOOL)showWithAnimation
{
    _showWithAnimation = showWithAnimation;
    
    if (_showWithAnimation == NO) {
        
        [self.layer removeAllAnimations];
    }
}

- (void)setAnimationType:(ZYChildPreViewAnimationType)animationType
{
    _animationType = animationType;
    
    switch (_animationType) {
        case ZYChildPreViewAnimationTypeOpacity:{
            
            CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            basicAnimation.fromValue = @(1.0);
            basicAnimation.toValue = @(0.6);
            basicAnimation.repeatCount = MAXFLOAT;
            basicAnimation.duration = 0.5f;
            basicAnimation.autoreverses = YES;
            basicAnimation.removedOnCompletion = NO;
            [self.layer addAnimation:basicAnimation forKey:@"opacity"];
            
            break;
        }
        case ZYChildPreViewAnimationTypeHor:
        {
            CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
            basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-gradientLayerWidth/2, self.frame.size.height/2)];
            basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(gradientLayerWidth/2+self.frame.size.width, self.frame.size.height/2)];
            basicAnimation.repeatCount = MAXFLOAT;
            basicAnimation.duration = 2.0f;

            self.gradientLayer.frame = CGRectMake(0, 0, 10, self.frame.size.height);
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 0);
            [self.gradientLayer addAnimation:basicAnimation forKey:@"positionHor"];
            
            [self.layer addSublayer:self.gradientLayer];
            
            break;
        }
        case ZYChildPreViewAnimationTypeVer:
        {
            CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
            basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, -self.frame.size.height)];
            basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 2*self.frame.size.height)];
            basicAnimation.repeatCount = MAXFLOAT;
            basicAnimation.duration = 2.0f;
            
            self.gradientLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*2, self.frame.size.height/2);
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
            [self.gradientLayer addAnimation:basicAnimation forKey:@"positionHor"];
            
            [self.layer addSublayer:self.gradientLayer];

            break;
        }
        default:
        {
            
            
            break;
        }
    }
}

@end








