//
//  MyPSCanvas.h
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPSCanvas : UIView

+ (instancetype)currentCanvas;

- (void)newLayerWithData:(NSData *)data;

@end
