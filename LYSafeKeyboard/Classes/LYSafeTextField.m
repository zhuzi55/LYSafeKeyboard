//
//  LYSafeTextField.m
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import "LYSafeTextField.h"

#import "LYKeyboardInputView.h"
#import "LYKeyboardAccessoryView.h"

#define STATUSHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define IPHONEX STATUSHEIGHT>20?YES:NO

@interface LYSafeTextField ()<LYKeyboardDelegate>

@property (nonatomic, strong) LYKeyboardInputView *keyboard;
@property (nonatomic, strong) NSMutableString *passWord;

@end

@implementation LYSafeTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.userInteractionEnabled = YES;
    
    [self addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFiledEditingChanged) forControlEvents:UIControlEventEditingChanged];
    
}

#pragma mark -- overwrite
-(void)textFiledDidBegin:(UITextField*)filed{
//    NSLog(@"%s",__func__);
    
    CGFloat x = 0;
    CGFloat h = 216;
    if (IPHONEX) {
        h = 291; //x系列291  其他216
    }
    CGFloat y = [UIScreen mainScreen].bounds.size.height - h;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    self.inputAccessoryView = [[LYKeyboardAccessoryView alloc] init];
    self.keyboard = [[LYKeyboardInputView alloc] initWithFrame:CGRectMake(x, y, w, h) letterIsOrder:self.letterIsOrder symbolIsOrder:self.symbolIsOrder safeKeyboardType:self.safeKeyboardType];
    self.keyboard.delegate = self;
    self.inputView = self.keyboard;
    
    self.passWord = nil;
    [self.passWord appendString:self.text];
}

/// 点击clearBtn清空
-(void)textFiledEditingChanged{
    NSUInteger loc = self.passWord.length;
    if (loc == 0){
        return;
    }
    NSRange range = NSMakeRange(0, loc);
    [self.passWord deleteCharactersInRange:range];
    
    if ([self.safeDelegate respondsToSelector:@selector(textFieldEventEditingChanged)]) {
        [self.safeDelegate textFieldEventEditingChanged];
    }
}

#pragma mark - SMYKeyboardDelegate
- (void)keyboard:(LYKeyboardInputView *)keyboard didClickButton:(UIButton *)button {
    NSUInteger loc = [self selectedRange].location;
    if (self.passWord.length > 0) {
        [self.passWord insertString:button.currentTitle atIndex:loc];
        self.text = self.passWord;
        //光标位置调整
        NSRange rangeCurrent = NSMakeRange(loc + 1, 0);
        [self setSelectedRange:rangeCurrent];
    }else{
        [self.passWord appendString:button.currentTitle];
        self.text = self.passWord;
    }
    if ([self.safeDelegate respondsToSelector:@selector(textFiledChangedWithText:)]) {
        [self.safeDelegate textFiledChangedWithText:self.text];
    }
}

- (void)keyboard:(LYKeyboardInputView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn {
    //获取光标位置
    NSUInteger loc = [self selectedRange].location;
    NSUInteger length = [self selectedRange].length;
    if (loc == 0 && length == 0) {
        return;
    }
    if (length > 0) {
        NSRange range = NSMakeRange(loc, length);
        [self.passWord deleteCharactersInRange:range];
        self.text = self.passWord;
        //光标位置调整
        NSRange rangeCurrent = NSMakeRange(loc, 0);
        [self setSelectedRange:rangeCurrent];
    }else{
        NSRange range = NSMakeRange(loc - 1, 1);
        [self.passWord deleteCharactersInRange:range];
        self.text = self.passWord;
        //光标位置调整
        NSRange rangeCurrent = NSMakeRange(loc -1, 0);
        [self setSelectedRange:rangeCurrent];
    }
    
    if ([self.safeDelegate respondsToSelector:@selector(textFiledChangedWithText:)]) {
        [self.safeDelegate textFiledChangedWithText:self.text];
    }
}
- (void)keyboard:(LYKeyboardInputView *)keyboard didClickReturnBtn:(UIButton *)returnBtn
{
    [self resignFirstResponder];
    
    if ([self.safeDelegate respondsToSelector:@selector(textFiledDoneActon:)]) {
        [self.safeDelegate textFiledDoneActon:self];
    }
}
#pragma mark - 需要
- (NSMutableString *)passWord {
    if (!_passWord) {
        _passWord = [[NSMutableString alloc]init];
    }
    return _passWord;
}

- (BOOL)isEmptyStr:(NSString*)str {
    if (str==nil) {
        return YES;
    }
    
    BOOL isEmpty = NO;
    NSString *copyStr = [str copy];
    
    if((![copyStr isKindOfClass:[NSNull class]]) && (![copyStr isKindOfClass:[NSString class]]) && (![copyStr isKindOfClass:[NSMutableString class]]))
    {
        copyStr = [NSString stringWithFormat:@"%@", copyStr];
    }
    
    if (copyStr == nil || [@"" isEqualToString:copyStr] || [@" " isEqualToString:copyStr]|| [copyStr isKindOfClass:[NSNull class]]) {
        return YES;
    } else if ([[copyStr substringToIndex:1] isEqualToString:@" "]) {
        isEmpty = [self isEmptyStr:[copyStr substringFromIndex:1]];
    }
    
    return isEmpty;
}

- (NSRange)selectedRange
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}
- (void)setSelectedRange:(NSRange) range
{
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end
