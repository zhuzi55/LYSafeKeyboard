//
//  LYKeyboardTool.m
//  LYSafeKeyboard
//
//  Created by liyz on 2022/8/31.
//

#import "LYKeyboardTool.h"

@implementation LYKeyboardTool

+ (UIImage *)getImageWithResouce:(NSString *)resouce{
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [currentBundle pathForResource:resouce ofType:nil inDirectory:@"LYSafeKeyboard.bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, h, w) resizingMode:UIImageResizingModeStretch];
    return newImage;
}

@end
