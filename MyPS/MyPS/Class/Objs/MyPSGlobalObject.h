//
//  MyPSGlobalObject.h
//  MyPS
//
//  Created by congratulas on 2017/5/18.
//  Copyright © 2017年 congratulas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface MyPSGlobalObject : NSObject

@property (nonatomic, strong) PHAsset *currentAsset;

@property (nonatomic, strong) NSMutableDictionary *currentProject;

@end
