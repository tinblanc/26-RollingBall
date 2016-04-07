//
//  ViewController.m
//  RollingBall
//
//  Created by Tin Blanc on 4/7/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle; // góc quay
    CGFloat ballRadius;
    BOOL redirect;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBall];
    angle = 0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                    target:self
                                  selector:@selector(rollBall)
                                  userInfo:nil
                                   repeats:true];
    
    
}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    ballRadius = 32.0; // ảnh cỡ 64x64
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    
    [self.view addSubview:ball];
}

-(void) rollBall{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat deltaAngle = 0.1; // góc quay delta
   
    if (ball.center.x >= mainViewSize.width - ballRadius) {
        redirect = true;
    } else if (ball.center.x < ballRadius) {
        redirect = false;
    }
    
    if (redirect) {
        angle -= deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle); // xoay quả bóng 1 góc angle
        ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle , ball.center.y);
    }else {
        angle += deltaAngle;
        ball.transform = CGAffineTransformMakeRotation(angle); // xoay quả bóng 1 góc angle
        ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle,
                                  ball.center.y );
    }
    
    
    NSLog(@"Toa do x : %3.1f - %3.1f", ball.center.x , mainViewSize.width - 32.0);
    
    
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}



@end
