//
//  NSString+LYRandomLetter.h
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LYRandomLetter)

/**
 *  返回单个随机大小字母 如果yes是小写 反之大写
 *
 *  @param islowercaseString  如果yes是小写 反之大写
 *
 *  @return 返回大小写字母字符串
 */
+ (NSString *)DYRandomLetterLowercase:(BOOL)islowercaseString;

/**
 *  返回26字母全部随机   大小字母 如果yes是小写 反之大写
 *
 *  @param islowercaseString  如果yes是小写 反之大写
 *
 *  @return 返回大小写字母字数组
 */
+ (NSMutableArray *)DYRandomAllLetterLowercase:(BOOL)islowercaseString;
/**
 *  返回26字母   大小字母 如果yes是小写 反之大写
 *
 *  @param islowercaseString  如果yes是小写 反之大写
 *
 *  @return 返回大小写字母字数组
 */
+ (NSMutableArray *)DYOrderAllLetterLowercase:(BOOL)islowercaseString;

+ (NSString*)DYRandomSymbol;

+ (NSMutableArray *)DYRandomAllSymbol;
+ (NSMutableArray *)DYOrderAllSymbol;

@end

NS_ASSUME_NONNULL_END
