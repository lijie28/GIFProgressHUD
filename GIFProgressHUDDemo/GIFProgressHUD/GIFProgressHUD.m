//
//  GIFProgressHUD.m
//  GIFProgressHUDDemo
//
//  Created by 李杰 on 2017/2/22.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "GIFProgressHUD.h"

@implementation GIFProgressHUD

- (void)custom{
    
    
    //loading
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth =  [UIScreen mainScreen].bounds.size.width;
    
    UIImage *theImage =(refreshingImages.count == 0)? nil: refreshingImages[0];
    
    
    UIImageView *imgGif = [[UIImageView alloc]init];
    imgGif.backgroundColor = [UIColor clearColor];
    imgGif.animationImages = refreshingImages;
    imgGif.animationDuration = refreshingImages.count * 0.1;
    imgGif.frame = CGRectMake(0, 0, theImage.size.width, theImage.size.height) ;
    
    imgGif.center = CGPointMake(screenWidth/2, screenHeight/2);
    
    [imgGif startAnimating];
    
    
    //置顶
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:imgGif];
    
    //此时完事，但是有一个致命性问题，你看一下内存使用情况，已经要爆了吧，下面就是内存优化问题了
    //当动画播放结束时延迟一秒我们释放掉self.imageView.animationImages的image对象
    
    [imgGif performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:imgGif.animationDuration + 1.0f];
}

@end
