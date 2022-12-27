
## 效果图
![效果图](assets/%E6%95%88%E6%9E%9C%E5%9B%BE.gif)


## 使用方式

可以通过pod导入，也可以下载demo后把LYSafeKeyboard文件夹导入。

```
pod 'LYSafeKeyboard', '~> 0.0.3'
```

```
如果pod repo update后还pod search不到，可以运行如下命令清下缓存后应该就可以了。
rm ~/Library/Caches/CocoaPods/search_index.json
```

```
在使用的控制器中，

遵守<LYSafeTextFieldDelegate>
    
LYSafeTextField *tf = [[LYSafeTextField alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
tf.center = self.view.center;
tf.backgroundColor = [UIColor whiteColor];
tf.safeDelegate = self;
[self.view addSubview:tf];
    
#pragma mark - 输入框回调事件
- (void)textFiledChangedWithText:(NSString *)text{
    NSLog(@"输入框内容 == %@", text);
}
```



