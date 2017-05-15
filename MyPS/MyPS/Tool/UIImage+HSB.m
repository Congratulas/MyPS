//
//  UIImage+HSB.m
//  MyPS
//
//  Created by congratulas on 2017/5/13.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "UIImage+HSB.h"

@implementation UIImage(HSB)

- (UIImage *)imageWithHue:(CGFloat)hue//色相
          saturation:(CGFloat)saturation//饱和度
          brightness:(CGFloat)brightness {//亮度
    CGImageRef img = [self CGImage];
    size_t width = CGImageGetWidth(img);
    size_t height = CGImageGetHeight(img);

    void *bitmapImageData = calloc(width * height, 4);
    if (!bitmapImageData) {
        return nil;
    }

    CGContextRef ctx = CGBitmapContextCreate(bitmapImageData, width, height, 8, width * 4, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast);

    CGContextDrawImage(ctx, CGRectMake(0, 0, width, height), img);

    CGBitmapContextGetData(ctx);

    unsigned char *imgPixel = CGBitmapContextGetData(ctx);

    int pixOff = 0;

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            unsigned char *red = &imgPixel[pixOff];
            unsigned char *green = &imgPixel[pixOff + 1];
            unsigned char *blue = &imgPixel[pixOff + 2];
//            unsigned char *alpha = &imgPixel[pixOff + 3];

            //色相
            int max = MAX(MAX(*red, *green), *blue);
            int min = MIN(MIN(*red, *green), *blue);
            CGFloat angle0 = 0;
            CGFloat x = (*green - *blue) * sqrtf(3.0f);
            CGFloat y = (2.0f * *red - *green - *blue);
            if (y == 0) {
                angle0 = 0;
            } else {
                angle0 = atan(x / y);
                if (y < -0.000001) {
                    angle0 += M_PI;
                }
            }

            CGFloat angle1 = angle0 + hue * M_PI * 2;
            int sec1 = (int)(angle1 / M_PI * 3);
            CGFloat per1 = (angle1 - sec1 * (M_PI / 3)) / (M_PI / 3);
            sec1 = sec1 % 6;
            int gap = max - min;

            switch (sec1) {
                case 0:
                    *red = max;
                    *green = min + per1 * gap;
                    *blue = min;
                    break;
                case 1:
                    *red = max - per1 * gap;
                    *green = max;
                    *blue = min;
                    break;
                case 2:
                    *red = min;
                    *green = max;
                    *blue = min + per1 * gap;
                    break;
                case 3:
                    *red = min;
                    *green = max - per1 * gap;
                    *blue = max;
                    break;
                case 4:
                    *red = min + per1 * gap;
                    *green = min;
                    *blue = max;
                    break;
                case 5:
                    *red = max;
                    *green = min;
                    *blue = max - per1 * gap;
                    break;

                default:
                    break;
            }

            //饱和度
            int r = *red, g = *green, b = *blue;

            if (saturation > 0) {
                r = r < 128 ? r - saturation * 128 : r + 128 * saturation;
                g = g < 128 ? g - saturation * 128 : g + 128 * saturation;
                b = b < 128 ? b - saturation * 128 : b + 128 * saturation;
            } else if (saturation < 0) {
                int max = MAX(r, MAX(g, b));
                if (r != max) r = r - (max - r) * saturation;
                if (g != max) g = g - (max - g) * saturation;
                if (b != max) b = b - (max - b) * saturation;
            }

            if (r < 0) r = 0;
            if (r > 255) r = 255;
            if (g < 0) g = 0;
            if (g > 255) g = 255;
            if (b < 0) b = 0;
            if (b > 255) b = 255;

            //明度
            r += 255 * brightness;
            g += 255 * brightness;
            b += 255 * brightness;
            if (r < 0) r = 0;
            if (r > 255) r = 255;
            if (g < 0) g = 0;
            if (g > 255) g = 255;
            if (b < 0) b = 0;
            if (b > 255) b = 255;
            *red = r;
            *green = g;
            *blue = b;

            pixOff += 4;
        }
    }

    img = CGBitmapContextCreateImage(ctx);

    free(bitmapImageData);

    return [UIImage imageWithCGImage:img];
}

@end
