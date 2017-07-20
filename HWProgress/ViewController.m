//
//  ViewController.m
//  HWProgress
//
//  Created by sxmaps_w on 2017/3/3.
//  Copyright © 2017年 hero_wqb. All rights reserved.
//

#import "ViewController.h"
#import "HWWaveView.h"
#import "HWCircleView.h"
#import "HWProgressView.h"
#import "HWInstallView.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) HWWaveView *waveView;
@property (nonatomic, weak) HWCircleView *circleView;
@property (nonatomic, weak) HWProgressView *progressView;
@property (nonatomic, weak) HWInstallView *installView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建控件
    [self creatControl];
    
    //添加定时器
    [self addTimer];
}

- (void)creatControl
{
    //波浪
    HWWaveView *waveView = [[HWWaveView alloc] initWithFrame:CGRectMake(30, 100, 150, 150)];
    [self.view addSubview:waveView];
    self.waveView = waveView;
    
    //圆圈
    HWCircleView *circleView = [[HWCircleView alloc] initWithFrame:CGRectMake(220, 100, 150, 150)];
    [self.view addSubview:circleView];
    self.circleView = circleView;
    
    //进度条
    HWProgressView *progressView = [[HWProgressView alloc] initWithFrame:CGRectMake(30, 365, 150, 20)];
    [self.view addSubview:progressView];
    self.progressView = progressView;
    
    //加载安装效果
    HWInstallView *installView = [[HWInstallView alloc] initWithFrame:CGRectMake(220, 300, 150, 150)];
    [self.view addSubview:installView];
    self.installView = installView;
}

- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction
{
    _waveView.progress += 0.01;
    _circleView.progress += 0.01;
    _progressView.progress += 0.01;
    _installView.progress += 0.01;
    
    if (_waveView.progress >= 1) {
        [self removeTimer];
        NSLog(@"完成");
    }
}

- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}

@end
