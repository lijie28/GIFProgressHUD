//
//  GIFProgressHUD.m
//  GIFProgressHUDDemo
//
//  Created by 李杰 on 2017/2/22.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "GIFProgressHUD.h"

typedef NS_ENUM(NSUInteger,GIFProgressAction) {
    GIFProgressActionStart,
    GIFProgressActionEnd
};

@interface GIFProgressHUD ()
@property (nonatomic, strong) GIFProgressHUD *globalGIFProgressHUD;
@property (nonatomic, strong) UIImageView *imgGif;
@end

@implementation GIFProgressHUD

static id _pngFrame;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ \
        _pngFrame = [super allocWithZone:zone];
    });
    return _pngFrame;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _pngFrame;
}


+(instancetype)start
{
    _pngFrame = [[self alloc] initWithAction:0];
    return _pngFrame;
}

+(instancetype)end
{
    
    _pngFrame = [[self alloc] initWithAction:1];
    return _pngFrame;
}


- (instancetype)initWithAction:(GIFProgressAction)action
{
    switch (action) {
        case GIFProgressActionStart:
            [self start];
            break;
            
        case GIFProgressActionEnd:
            [self end];
            break;
            
        default:
            break;
    }
    return [self init];
}


- (void)start
{
    if ([_imgGif isAnimating]) {
        
    }else{
        
        if (!_imgGif.animationImages) {
            //置顶
            UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
            [window addSubview:self.imgGif];
            [window makeKeyAndVisible];
            [self.imgGif startAnimating];
            
        }else{
            
            //置顶
            UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
            [window bringSubviewToFront:self.imgGif];
            [self.imgGif startAnimating];
            
        }
    }
    
    
    NSLog(@"-----start--%p",self);
    
}

- (void)end
{
    
    [self.imgGif stopAnimating];
//    [self.imgGif setAnimationImages:nil];
//    self.imgGif = nil;
    NSLog(@"-----end--%p",self);
}


- (void)setRefreshingImages:(NSMutableArray *)refreshingImages
{
    _refreshingImages = refreshingImages;
    self.imgGif.animationImages = _refreshingImages;
    
}



- (UIImageView *)imgGif
{
    if (!_imgGif) {
        
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
        
        
        _imgGif = imgGif;
    }
    return _imgGif;
}
@end
