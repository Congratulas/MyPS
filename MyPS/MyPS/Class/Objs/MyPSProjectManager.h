//
//  MyPSProjectManager.h
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface MyPSProject : NSObject

@property (nonatomic, strong) NSString * _Nonnull name;

@property (nonatomic, strong) NSString * _Nonnull path;

@property (nonatomic, strong) PHAsset * _Nullable asset;

@end

@interface MyPSProjectManager : NSObject

@property (nonatomic, strong) NSMutableArray<MyPSProject *> * _Nullable projects;

@property (nonatomic, strong) MyPSProject* _Nullable currentProject;

+ (instancetype _Nonnull )sharedInstance;

- (MyPSProject * _Nullable)createANewProject;

- (MyPSProject * _Nullable)createANewProjectFromAPhoto:(PHAsset * _Nonnull)asset;

- (void)openProject:(MyPSProject * _Nonnull)project;

@end
