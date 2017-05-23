//
//  MyPSCanvas.m
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "MyPSCanvas.h"
#import "MyPSPaintLayer.h"
#import "MyPSProjectManager.h"


@interface MyPSCanvas ()

@property (nonatomic, strong) MyPSPaintLayer *rootLayer;

@property (nonatomic, strong) NSMutableArray<MyPSPaintLayer *> *layers;

@property (nonatomic, strong) UIView *motionLayer;

@property (nonatomic, weak)   MyPSPaintLayer *currentLayer;

@end

@implementation MyPSCanvas

static MyPSCanvas *obj = nil;
+ (instancetype)currentCanvas {
    return obj;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initiate];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initiate];
    }

    return self;
}

- (void)initiate {
    self.rootLayer = [[MyPSPaintLayer alloc] initWithFrame:self.frame];
    [self addSubview:self.rootLayer];


    MyPSProject *project = [MyPSProjectManager sharedInstance].currentProject;
    if (project.asset) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        // 同步获得图片, 只会返回1张图片
        options.synchronous = YES;

        // 是否要原图
        BOOL original = YES;
        CGSize size = original ? CGSizeMake(project.asset.pixelWidth, project.asset.pixelHeight) : CGSizeZero;

        // 从asset中获得图片
        [[PHImageManager defaultManager] requestImageForAsset:project.asset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {

        }];
    } else {

    }
}

- (void)newLayerWithData:(NSData *)data {

}

@end
