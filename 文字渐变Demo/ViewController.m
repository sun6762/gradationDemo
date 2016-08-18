//
//  ViewController.m
//  文字渐变Demo
//
//  Created by 孙博 on 16/8/18.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)CAGradientLayer *gradient;

@property (nonatomic, strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 0, 0)];
//    label.backgroundColor = [UIColor redColor];
    label.text = @"我 是 人 间 惆 怅 客";
    [label sizeToFit];
    [self.view addSubview:label];

    // 创建渐变层
    self.gradient = [[CAGradientLayer alloc]init];
    self.gradient.frame = label.frame;
    
    self.gradient.locations = @[@0.5];
    self.gradient.startPoint = CGPointMake(0, 0);
    self.gradient.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:self.gradient];
    
    self.gradient.mask = label.layer;
    label.frame = self.gradient.bounds;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
}

- (UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

- (void)changeColor{
   self.gradient.colors = @[(id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
