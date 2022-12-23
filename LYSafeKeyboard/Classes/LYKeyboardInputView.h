//
//  LYKeyboardInputView.h
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import <UIKit/UIKit.h>

#import "UIView+LYExtension.h"
#import "LYKeyboardAccessoryView.h"

NS_ASSUME_NONNULL_BEGIN

@class LYKeyboardInputView;

@protocol LYKeyboardDelegate <NSObject>

@optional
/** 点击了数字按钮 */
- (void)keyboard:(LYKeyboardInputView *)keyboard didClickButton:(UIButton *)button;
/** 点击删除按钮 */
- (void)keyboard:(LYKeyboardInputView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn;
/** 点击return按钮 */
- (void)keyboard:(LYKeyboardInputView *)keyboard didClickReturnBtn:(UIButton *)returnBtn;

@end

@interface LYKeyboardInputView : UIView

@property (nonatomic, assign) id<LYKeyboardDelegate> delegate;
//英文字母是否按正常键盘顺序排列 默认NO(乱序排列)
@property (nonatomic, assign) BOOL letterIsOrder;
//符号是否按照正常顺序排列 默认NO(乱序排列)
@property (nonatomic, assign) BOOL symbolIsOrder;

//- (instancetype)initWithFrame:(CGRect)frame letterIsOrder:(BOOL)letterIsOrder;
- (instancetype)initWithFrame:(CGRect)frame letterIsOrder:(BOOL)letterIsOrder symbolIsOrder:(BOOL)symbolIsOrder;

@end

NS_ASSUME_NONNULL_END
