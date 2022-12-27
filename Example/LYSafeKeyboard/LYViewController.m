//
//  LYViewController.m
//  LYSafeKeyboard
//
//  Created by liyz on 08/31/2022.
//  Copyright (c) 2022 liyz. All rights reserved.
//

#import "LYViewController.h"

#import "LYSafeTextField.h"

@interface LYViewController ()<LYSafeTextFieldDelegate>

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self creatUI];
    
}

/// 创建视图
-(void)creatUI{
    
    LYSafeTextField *tf = [[LYSafeTextField alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    tf.center = self.view.center;
    tf.backgroundColor = [UIColor whiteColor];
//    tf.clearButtonMode = UITextFieldViewModeAlways;
//    tf.secureTextEntry = YES;
    tf.safeDelegate = self;
    [self.view addSubview:tf];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan ==");
    [self.view endEditing:YES];
}

#pragma mark - 输入框回调事件
- (void)textFiledChangedWithText:(NSString *)text{
    NSLog(@"输入框内容 == %@", text);
}

@end
