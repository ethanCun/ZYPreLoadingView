//
//  TableViewCell.m
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+SetPreview.h"
#import "ZYChildPreView.h"
#import "ZYChildPreViewFeatures.h"

@interface TableViewCell ()



@end

@implementation TableViewCell

- (void)setIsPreview:(BOOL)isPreview
{
    _isPreview = isPreview;
    
    if (isPreview) {
        
        [self beginPreview];
        
    }else{
        
        [self endPreview];
        
        /**
         移除cell复用可能存在的预加载蒙层
         */
        for (UIView *subView in self.subviews) {
            
            if ([subView isKindOfClass:[ZYChildPreView class]]) {
                
                ZYChildPreView *view = (ZYChildPreView *)subView;
                
                [view removeFromSuperview];
                view = nil;
            }
        }
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
    }
    return self;
}

- (void)setupCell
{
    self.lab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    self.lab1.backgroundColor = [UIColor grayColor];
    [self addSubview:self.lab1];
    
    self.lab2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lab1.frame)+10, 10, [UIScreen mainScreen].bounds.size.width-(CGRectGetMaxX(self.lab1.frame)+10+10), 15)];
    [self addSubview:self.lab2];
    
    self.lab3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lab1.frame)+10, 10+20, [UIScreen mainScreen].bounds.size.width-(CGRectGetMaxX(self.lab1.frame)+10+10), 15)];
    [self addSubview:self.lab3];
}

#pragma mark - ZYPreviewProtocol
- (NSArray *)childViewsFrameAndBackgroundColorForPreview
{
    NSMutableArray *features = [NSMutableArray array];
    NSArray *frames = @[[NSValue valueWithCGRect:CGRectMake(5, 5, 50, 50)], [NSValue valueWithCGRect:CGRectMake(70, 5, [UIScreen mainScreen].bounds.size.width-70-10*2, 20)], [NSValue valueWithCGRect:CGRectMake(70, 30, [UIScreen mainScreen].bounds.size.width-70-10*2, 20)]];
    NSArray *backgroundColors = @[[UIColor lightGrayColor], [UIColor lightGrayColor], [UIColor lightGrayColor]];
    NSArray *cornerRadius = @[@(25), @(0), @(0)];
    NSArray *showAnimations = @[@(YES), @(YES), @(YES)];
    NSArray *animationTypes = @[@(self.animationType), @(self.animationType), @(self.animationType)];
    
    for (NSInteger i=0; i<frames.count; i++) {
        
        ZYChildPreViewFeatures *feature = [ZYChildPreViewFeatures new];
        feature.frame = [frames[i] CGRectValue];
        feature.backgroundColor = backgroundColors[i];
        feature.cornerRadius = [cornerRadius[i] floatValue];
        feature.showWithAnimation = [showAnimations[i] boolValue];
        feature.animationType = [animationTypes[i] integerValue];
        
        [features addObject:feature];
    }
    
    return features;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
