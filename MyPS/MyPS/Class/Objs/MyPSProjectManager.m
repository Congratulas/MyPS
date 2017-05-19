//
//  MyPSProjectManager.m
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "MyPSProjectManager.h"
#import "MyPSMainViewController.h"

@implementation MyPSProject

- (void)getImage {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    // 同步获得图片, 只会返回1张图片
    options.synchronous = YES;

    // 是否要原图
    BOOL original = YES;
    CGSize size = original ? CGSizeMake(self.asset.pixelWidth, self.asset.pixelHeight) : CGSizeZero;

    // 从asset中获得图片
    [[PHImageManager defaultManager] requestImageForAsset:self.asset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {

    }];
}

@end

@implementation MyPSProjectManager

+ (instancetype)sharedInstance {
    static MyPSProjectManager *obj = nil;
    if (!obj) {
        obj = [[MyPSProjectManager alloc] init];
    }

    return obj;
}

- (MyPSProject *)createANewProject {
    MyPSProject *obj = [[MyPSProject alloc] init];

    if (obj) {
        [self.projects addObject:obj];
        [self openProjectInterface:obj];
    }

    return obj;
}

- (MyPSProject *)createANewProjectFromAPhoto:(PHAsset *)asset {
    MyPSProject *obj = [[MyPSProject alloc] init];

    if (obj) {
        obj.asset = asset;
        [self.projects addObject:obj];
        [self openProjectInterface:obj];
    }

    return obj;
}

- (void)openProject:(MyPSProject *)project {
    [self openProjectInterface:project];
}

- (void)openProjectInterface:(MyPSProject *)project {
    [MyPSMainViewController presentProject:project];
}

@end
