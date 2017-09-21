//
//  ViewController.m
//  FlexibilityButton
//
//  Created by cherry on 2017/9/21.
//  Copyright © 2017年 YaoJing. All rights reserved.
//

#import "ViewController.h"
#import "FL_Button.h"
#import "Masonry.h"
#define AppFont(a,b) [UIFont fontWithName:a size:b]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define RandColorView(v) v.backgroundColor = RandColor

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self createTopView];
}

- (void)initProperty{

}

- (void)createTopView
{
    
    
    NSArray *titleAry = @[@"左图标右文本 居中显示", @"图标在左，文本在右(靠左显示)", @"左文本右图标 靠左显示", @"左文本右图标 居中显示", @"左文本右图标 靠右显示", @"图标在上，文本在下(居中)", @"图标在下，文本在上(居中)"];
    NSArray *imageAry = @[@"buy", @"buy", @"buy", @"buy", @"buy", @"buy", @"buy"];
    NSArray *statusAry = @[@(FLAlignmentStatusNormal), @(FLAlignmentStatusImageLeft), @(FLAlignmentStatusLeft), @(FLAlignmentStatusCenter), @(FLAlignmentStatusRight), @(FLAlignmentStatusTop), @(FLAlignmentStatusBottom)];
    
    
    WS(weakSelf);
    FL_Button *clowBtn;
    
    for (int i = 0; i < titleAry.count; i++) {
        
        FL_Button *button1 = [FL_Button buttonWithType:UIButtonTypeCustom];
        button1.titleLabel.font = AppFont(@"PingFangSC-Regular", 10);
        [button1 setTitle:titleAry[i] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:imageAry[i]] forState:UIControlStateNormal];
        button1.status = [statusAry[i] floatValue];
        button1.fl_padding = 10;
        RandColorView(button1);
        [self.view addSubview:button1];
        if (clowBtn) {
            [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(clowBtn.mas_bottom);
                make.left.equalTo(clowBtn);
                make.width.equalTo(clowBtn);
                make.height.equalTo(clowBtn);
            }];
        }else{
            [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(weakSelf.view);
                make.left.equalTo(weakSelf.view);
                make.width.equalTo(@(SCREENWIDTH));
                make.height.equalTo(@(SCREENHEIGHT/(titleAry.count)));
            }];
        }
        
        clowBtn = button1;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
