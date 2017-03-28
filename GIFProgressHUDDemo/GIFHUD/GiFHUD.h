//
//  GiFHUD.h
//  GifProgress
//
//  Created by Jevon on 14/11/26.
//  Copyright (c) 2014年 Jevon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiFHUD : UIView

+ (void)show;
+ (void)showWithOverlay;

+ (void)dismiss;

+ (void)setGifWithImages:(NSArray *)images;
+ (void)setGifWithImageName:(NSString *)imageName;
+ (void)setGifWithURL:(NSURL *)gifUrl;

@end
