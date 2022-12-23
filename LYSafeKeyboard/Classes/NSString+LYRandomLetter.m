//
//  NSString+LYRandomLetter.m
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import "NSString+LYRandomLetter.h"

static NSString *letterString = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static NSString *letterOrderString = @"QWERTYUIOPASDFGHJKLZXCVBNM";

static NSString *fu = @"!@#$%^&*()'=_:;?~|·+-\\[]{}/,.<>€￡¥\""; //注意，\和"是特殊字符，\\是一个\，\"是一个"。总的字符是35个，别慌
static NSString *fuOrder = @"[]{}#%^*+=_-/:;()$&@.,?!'\\|~·<>€￡¥\"";

@implementation NSString (LYRandomLetter)

+ (NSString *)sentletterString {

    NSString *letter = letterString;
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [letter length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [letter getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSInteger j = (arc4random_uniform(numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    return result;
}
+ (NSString *)DYRandomLetterLowercase:(BOOL)islowercaseString {

    NSString *letter = [self sentletterString];
    
    if (islowercaseString) { // yes 小写
       
         NSString *str = [[letter lowercaseString] substringToIndex:1];
        return str;
    }else{// no 大写
      
        NSString *str =  [letter substringToIndex:1];
        return str;
    }
  
}

+ (NSMutableArray *)DYRandomAllLetterLowercase:(BOOL)islowercaseString {

    NSMutableArray *arr = [NSMutableArray array];
    NSString *letter = nil;
  
    if (islowercaseString) { // yes 小写
        letter =  [[self sentletterString] lowercaseString];
    }else{// no 大写
        letter =  [self sentletterString];
        
    }
    for (int i = 0; i < [letter length]; i++) {
        
        NSString *str = [letter substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:str];
    }

    return arr;

}

+ (NSMutableArray *)DYOrderAllLetterLowercase:(BOOL)islowercaseString{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *letter = nil;
  
    if (islowercaseString) { // yes 小写
        letter =  [letterOrderString lowercaseString];
    }else{// no 大写
        letter =  letterOrderString;
        
    }
    for (int i = 0; i < [letter length]; i++) {
        
        NSString *str = [letter substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:str];
    }

    return arr;
}

+ (NSString *)sentSymbol {
    
    NSMutableString *letter = [NSMutableString stringWithString:fu];
    
    //    [letter appendString:@"\"\""];
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [letter length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [letter getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSInteger j = (arc4random_uniform(numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    
    return result;
}

+ (NSString*)DYRandomSymbol {
    NSString *letter = [self sentSymbol];
    
    NSString *str =  [letter substringToIndex:1];
    return str;
}

+ (NSMutableArray *)DYRandomAllSymbol {
    
    NSMutableArray *arr = [NSMutableArray array];
    NSString *letter = nil;
    
    letter =  [self sentSymbol];
    
    for (int i = 0; i < [letter length]; i++) {
        
        NSString *str = [letter substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:str];
    }
    
    return arr;
    
}
+ (NSMutableArray *)DYOrderAllSymbol{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *letter = nil;
    letter = fuOrder;
    for (int i = 0; i < [letter length]; i++) {
        
        NSString *str = [letter substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:str];
    }
    
    return arr;
}

@end
