//
//  ZYPreviewProtocol.h
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ZYPreviewProtocol <NSObject>

/**
 所有预加载需要显示的子视图
 在这个协议中设置好子视图frame 颜色等；
 */
- (NSArray *)childViewsFrameAndBackgroundColorForPreview;


@end
