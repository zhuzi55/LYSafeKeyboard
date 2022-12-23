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
    
    LYSafeTextField *tf = [[LYSafeTextField alloc] initWithFrame:CGRectMake(0, 100, 300, 50)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.safeDelegate = self;
    [self.view addSubview:tf];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"==");
    [self.view endEditing:YES];
}

- (void)textFiledChangedWithText:(NSString *)text{
    NSLog(@"输入框 == %@", text);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
