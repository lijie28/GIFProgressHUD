//
//  GIFProgressHUD.h
//  GIFProgressHUDDemo
//
//  Created by 李杰 on 2017/2/22.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GIFProgressHUD : NSObject

/** set refreshing images' names */
@property (nonatomic, strong) NSMutableArray *refreshingImages;


+ (instancetype)start;

+ (instancetype)end;

- (void)start;

- (void)end;

@end
