//
//  LYSafeTextField.h
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LYSafeTextField;

@protocol LYSafeTextFieldDelegate <NSObject>

@optional

- (void)textFieldEventEditingChanged;
- (void)textFiledChangedWithText:(NSString *)text;
- (void)textFiledDoneActon:(LYSafeTextField*)textField;

@end


@interface LYSafeTextField : UITextField

@property (nonatomic, weak) id<LYSafeTextFieldDelegate> safeDelegate;
/// 英文字母是否按正常键盘顺序排列 默认NO(乱序排列)
@property (nonatomic, assign) BOOL letterIsOrder;
/// 符号是否按照正常顺序排列 默认NO(乱序排列)
@property (nonatomic, assign) BOOL symbolIsOrder;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
