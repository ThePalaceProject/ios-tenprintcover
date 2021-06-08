//
//  C64Converter.m
//  TenPrintCover
//
//  Created by Raman Singh on 2021-03-11.
//  Copyright © 2021 NYPL_Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C64Converter.h"

@implementation C64Converter

+ (NSString *)convert:(NSString *)value
{
  NSString *c64Letters = @" qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890.";
  
  if (value.length == 0) {
    uint32_t index = arc4random_uniform((uint32_t)c64Letters.length);
    unichar character = [c64Letters characterAtIndex:index];
    value = [NSString stringWithCharacters:&character length:1];
  }
  
  NSUInteger len = value.length;
  NSMutableString *result = [NSMutableString stringWithCapacity:len];
  char letter;
  for (int i=0; i<len; i++) {
    letter = [value characterAtIndex:i];
    NSRange range = [self indexOf:letter inString:c64Letters];
    //        NSLog(@"letter: %c num: %d range: %d", letter, (int)letter, range.length);
    if (range.length == 0) {
      int anIndex = (int)(letter % c64Letters.length);
      letter = [c64Letters characterAtIndex:anIndex];
    }
    [result appendString:[NSString stringWithFormat:@"%c", letter]];
  }
  return [NSString stringWithString:result];
}

+ (NSRange) indexOf:(char) searchChar inString:(NSString *)string {
  NSRange searchRange;
  searchRange.location=(unsigned int)searchChar;
  searchRange.length=1;
  NSCharacterSet *set = [NSCharacterSet characterSetWithRange:searchRange];
  
  // NSCharacterSet:characterSetWithRange by default is never supposed to
  // return nil. However, on iOS 14.5 beta, it is returning nil when the char
  // is non ASCII (e.g. accented character), causing the app to crash.
  if (set) {
    return [string rangeOfCharacterFromSet:set];
  }
  
  // This is only triggered when passed a non ASCII character e.g. ñ, ó
  searchRange.location = NSNotFound;
  searchRange.length = 0;
  return searchRange;
}

@end
