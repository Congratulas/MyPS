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
