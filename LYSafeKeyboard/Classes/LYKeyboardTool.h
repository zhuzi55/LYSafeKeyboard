//
//  LYKeyboardTool.h
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LYSafeKeyboardType) {
    LYSafeKeyboardTypeDefault = 0, //默认
    LYSafeKeyboardTypeIDCard = 1,  //身份正类型（带X）
};


@interface LYKeyboardTool : NSObject

+ (UIImage *)getImageWithResouce:(NSString *)resouce;

@end

NS_ASSUME_NONNULL_END
