//
//  FAViewController.m
//  FaceUI
//
//  Created by 杨朋亮 on 29/10/14.
//  Copyright (c) 2014年 daibou007. All rights reserved.
//

#import "FAViewController.h"
#import "ANBlurredImageView.h"

@interface FAViewController ()


@property(nonatomic, assign) BOOL isCaller;
@property(nonatomic) UIButton *hangUpButton;
@property(nonatomic) UIButton *acceptButton;
@property(nonatomic) UIButton *refuseButton;
@property (nonatomic) UIButton *changeStateButton;
@property (nonatomic) ANBlurredImageView *bkview;

@end

@implementation FAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.bkview =  [[ANBlurredImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.bkview setImage:[UIImage imageNamed:@"bk"]];
    [self.bkview setBlurTintColor:[UIColor clearColor]];
     [self.bkview setFramesCount:20];
    [self.bkview setBlurAmount:1.0f];

   
    
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [imgView setImage:[UIImage imageNamed:@"bk"]];
//    [self.bkview addSubview:imgView];
    
    [self.view addSubview:self.bkview];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 120)/2, 80, 120, 120)];
//    [headView sd_setImageWithURL:[[NSURL alloc] initWithString:@""] placeholderImage:[UIImage imageNamed:@"manHeader"]];
    CALayer *imageLayer = [headView layer];   //获取ImageView的层
    [imageLayer setMasksToBounds:YES];
    [imageLayer setCornerRadius:headView.frame.size.width/2];
    [self.view addSubview: headView];
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.backgroundColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
    moreButton.frame = CGRectMake(30.0f, self.view.frame.size.height - 50.0f - 50.0f , 100, 50);
    [moreButton setTitle:@"挂断" forState:UIControlStateNormal];
    [moreButton  setBackgroundColor:[UIColor redColor]];
    [moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(hangUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreButton];
    self.hangUpButton = moreButton;
    
    moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.backgroundColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
    moreButton.frame = CGRectMake(30.0f, self.view.frame.size.height - 50.0f - 50.0f, 100, 50);
    [moreButton setTitle:@"接听" forState:UIControlStateNormal];
    [moreButton setBackgroundColor:[UIColor greenColor]];
    [moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(acceptCall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreButton];
    self.acceptButton = moreButton;
    
    moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.backgroundColor = [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
    moreButton.frame = CGRectMake(150.0f, self.view.frame.size.height - 50.0f - 50.0f, 100, 50);
    [moreButton setTitle:@"拒绝" forState:UIControlStateNormal];
    [moreButton setBackgroundColor:[UIColor redColor]];
    [moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(refuseCall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreButton];
    self.refuseButton = moreButton;
    
    CGRect frame = CGRectMake(240, self.view.frame.size.height - 50.0f - 50.0f, 60, 60);
    self.changeStateButton = [[UIButton alloc] initWithFrame:frame];
    
    [self.changeStateButton setBackgroundImage:[UIImage imageNamed:@"loader.png"] forState:UIControlStateNormal];
    [self.changeStateButton addTarget:self action:@selector(changelistenState:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.changeStateButton];
    
    if (self.isCaller) {
        self.acceptButton.hidden = YES;
        self.refuseButton.hidden = YES;
    } else {
        self.hangUpButton.hidden = YES;
    }
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.bkview generateBlurFramesWithCompletion:^{
        [self.bkview blurInAnimationWithDuration:3.2f];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
