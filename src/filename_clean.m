//
//  filename_clean.m
//  FilePathCleaner
//
//  Created by Nakazi_w0w on 2019/02/04.
//

#import "filename_clean.h"
#import <Foundation/Foundation.h>

void filename_clean(const char *filePath, void (*print_log)(const char *)) {
    NSString *filePathString = [NSString stringWithUTF8String:filePath];
    
    NSString *dir = [filePathString stringByDeletingLastPathComponent];
    NSString *filename = [filePathString lastPathComponent];
    
    NSMutableString *asciiCharacters = [NSMutableString string];
    for (char c = 32; c < 127; c++)  {
        if('/' == c) {
            continue;
        }
        [asciiCharacters appendFormat:@"%c", c];
    }
    NSCharacterSet *ascii = [NSCharacterSet characterSetWithCharactersInString:asciiCharacters];
    NSCharacterSet *non_ascii = [ascii invertedSet];
    NSString* clean_filename = [[filename componentsSeparatedByCharactersInSet:non_ascii] componentsJoinedByString:@""];
    
    if([filename isEqualToString:clean_filename] == NO) {
        NSString *clean_filePathString = [dir stringByAppendingPathComponent:clean_filename];

        NSFileManager *fm = [NSFileManager defaultManager];
        NSError *e;
        if([fm moveItemAtPath:filePathString toPath:clean_filePathString error:&e] == NO) {
            NSString *textlog = [NSString stringWithFormat:@"failed to clean... %s", clean_filename.UTF8String];
            (*print_log)(textlog.UTF8String);
        } else {
            NSString *textlog = [NSString stringWithFormat:@"cleaned: %s", clean_filename.UTF8String];
            (*print_log)(textlog.UTF8String);
        }
    } else {
        NSString *textlog = [NSString stringWithFormat:@"already clean: %s", clean_filename.UTF8String];
        (*print_log)(textlog.UTF8String);
    }
}
