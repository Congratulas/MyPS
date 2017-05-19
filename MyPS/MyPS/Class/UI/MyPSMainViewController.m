//
//  MyPSMainViewController.m
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "MyPSMainViewController.h"
#import "MyPSCanvas.h"
#import "MyPSProjectManager.h"

@interface MyPSMainViewController ()

@end

@implementation MyPSMainViewController

+ (void)presentProject:(MyPSProject *)project {
    [MyPSProjectManager sharedInstance].currentProject = project;

    MyPSMainViewController *vc = [[MyPSMainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self loadElements];
}

- (void)loadElements {
    self.navigationController.navigationBarHidden = YES;

    [self loadTopMenuBar];
    [self loadToolBox];
    [self loadToolSettingView];
    [self loadCanvas];
}

- (void)loadTopMenuBar {
    UIScrollView *topBar = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.bounds.size.width, 60)];
    [self.view addSubview:topBar];
    topBar.backgroundColor = [UIColor lightGrayColor];
}

- (void)loadToolBox {
    UIScrollView *topBar = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height - 100, [UIApplication sharedApplication].keyWindow.bounds.size.width, 40)];
    [self.view addSubview:topBar];
    topBar.backgroundColor = [UIColor lightGrayColor];
}

- (void)loadToolSettingView {
    UIScrollView *topBar = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height - 60, [UIApplication sharedApplication].keyWindow.bounds.size.width, 60)];
    [self.view addSubview:topBar];
    topBar.backgroundColor = [UIColor lightGrayColor];
}

- (void)loadCanvas {
    MyPSCanvas *canvas = [[MyPSCanvas alloc] initWithFrame:CGRectMake(0, 60, [UIApplication sharedApplication].keyWindow.bounds.size.width, [UIApplication sharedApplication].keyWindow.bounds.size.height - 60)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
