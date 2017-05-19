//
//  ViewController.m
//  MyPS
//
//  Created by congratulas on 2017/5/8.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import "ViewController.h"
#import "MyPSGuideViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[MyPSGuideViewController alloc] init]];
    nav.navigationBarHidden =YES;
    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
