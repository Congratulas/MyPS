//
//  MyPSGuideViewController.m
//  MyPS
//
//  Created by congratulas on 2017/5/17.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "MyPSGuideViewController.h"
#import <Photos/Photos.h>
#import "MyPSProjectManager.h"

@interface PHButton : UIButton
@property (nonatomic, strong) PHAsset *asset;
@end
@implementation PHButton
@end

@interface MyPSGuideViewController ()

@property (nonatomic, strong) UIScrollView *recentPrjView;

@property (nonatomic, strong) NSMutableArray<NSDictionary *> *recentPrjs;

@property (nonatomic, strong) UIScrollView *recentPicView;

@property (nonatomic, strong) PHFetchResult<PHAsset *> *recentPics;

@end

@implementation MyPSGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self loadElements];
    [self getRecentPics];
}

- (void)loadElements {
    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];

    CGFloat width = [UIApplication sharedApplication].keyWindow.bounds.size.width - 40;

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(20, 20, width, [UIApplication sharedApplication].keyWindow.bounds.size.height - 40)];
    [self.view addSubview:container];
    container.backgroundColor = [UIColor whiteColor];
    container.layer.cornerRadius = 5;
    container.layer.shadowOpacity = 0.5f;

    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, width - 20, 20)];
    [container addSubview:lb];
    lb.text = @"最近编辑的工程：";
    NSMutableArray *recentProjects = nil;
    for (int i = 0; i < recentProjects.count; i++) {

    }

    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(10, 89, width - 20, 1)];
    [container addSubview:separator];
    separator.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];

    lb = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, width - 20, 20)];
    [container addSubview:lb];
    lb.text = @"最近的照片：";

    self.recentPicView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 130, width, 80)];
    [container addSubview:self.recentPicView];
}

- (void)getRecentPrjs {

}

- (void)getRecentPics {
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.recentPics = [PHAsset fetchAssetsWithOptions:option];
    NSInteger count = MIN(20, self.recentPics.count);
    __block CGFloat leftPoint = 0;
    for (int i = 0; i < count; i++) {
        PHButton *btn = [PHButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.recentPicView addSubview:btn];
        btn.backgroundColor = [UIColor redColor];
        [btn addTarget:self action:@selector(choosePic:) forControlEvents:UIControlEventTouchUpInside];
        PHAsset *asset = [self.recentPics objectAtIndex:i];
        // 是否要原图
        BOOL original = NO;
        CGSize size = original ? CGSizeMake(asset.pixelWidth, asset.pixelHeight) : CGSizeZero;

        // 从asset中获得图片
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            /*
             info:
             PHImageFileOrientationKey = 0;
             PHImageResultDeliveredImageFormatKey = 4031;
             PHImageResultIsDegradedKey = 0;
             PHImageResultRequestIDKey = 1;
             PHImageResultWantedImageFormatKey = 4031;
             */
            btn.asset = asset;
            [btn setBackgroundImage:result forState:UIControlStateNormal];
            btn.frame = CGRectMake(leftPoint + 10, 0, 80 * asset.pixelWidth / asset.pixelHeight, 80);
            leftPoint += 10 + 80 * asset.pixelWidth / asset.pixelHeight;
            self.recentPicView.contentSize = CGSizeMake(leftPoint, 80);
        }];
    }
}

- (void)choosePic:(PHButton *)sender {
    [[MyPSProjectManager sharedInstance] createANewProjectFromAPhoto:sender.asset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
