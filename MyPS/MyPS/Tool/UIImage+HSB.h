//
//  UIImage+HSB.h
//  MyPS
//
//  Created by congratulas on 2017/5/13.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import <UIKit/UIImage.h>

@interface UIImage (HSB)

- (UIImage *)imageWithHue:(CGFloat)hue//色相
               saturation:(CGFloat)saturation//饱和度
               brightness:(CGFloat)brightness;//亮度

@end
