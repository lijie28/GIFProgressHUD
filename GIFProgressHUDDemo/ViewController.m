//
//  ViewController.m
//  GIFProgressHUDDemo
//
//  Created by 李杰 on 2017/2/22.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "ViewController.h"
#import "GIFProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 50);
    [btn addTarget:self action:@selector(showProgress) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    UIButton *btnEnd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnEnd.frame = CGRectMake(100, 300, 200, 50);
    [btnEnd addTarget:self action:@selector(endProgress) forControlEvents:UIControlEventTouchUpInside];
    btnEnd.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btnEnd];
}


- (void)showProgress
{
   GIFProgressHUD *gitHud =  [[GIFProgressHUD alloc]init];
    [gitHud start];
//    gitHud setRefreshingImages:<#(NSMutableArray *)#>
}

- (void)endProgress
{
    GIFProgressHUD *gitHud = [[GIFProgressHUD alloc]init];
    [gitHud end];
}






- (void)old
{
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
    
    [window bringSubviewToFront:imgGif];
    
    [window makeKeyAndVisible];
}


@end
