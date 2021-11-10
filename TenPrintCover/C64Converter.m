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

/// Converts a string to a string that uses only the ASCII 64 letter set.
/// @param value String to convert.
+ (NSString *)convert:(NSString *)value {

  NSString *c64Letters = @" qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890.";
  
  if (value.length == 0) {
    uint32_t index = arc4random_uniform((uint32_t)c64Letters.length);
    unichar character = [c64Letters characterAtIndex:index];
    value = [NSString stringWithCharacters:&character length:1];
  }

  // returns a string with all the c64-letter available in the title or a random set if none
  int i, len = (int)value.length;
  NSMutableString *result = [NSMutableString stringWithCapacity:len];
  unichar letter;
  for (i=0; i<len; i++) {
    letter = [value characterAtIndex:i];
    if (![self isCharacter:letter inString:c64Letters]) {
      int anIndex = (int)(letter % c64Letters.length);
      letter = [c64Letters characterAtIndex:anIndex];
    }
    [result appendString:[NSString stringWithFormat:@"%c", letter]];
  }
  return [NSString stringWithString:result];
}

/// Looks for a unicode charachter in string.
/// @param searchChar Unicode character.
/// @param string String to search in.
+ (BOOL) isCharacter:(unichar)searchChar inString:(NSString *)string {
  NSRange searchCharRange = NSMakeRange(searchChar, 1);
  NSCharacterSet *set = [NSCharacterSet characterSetWithRange:searchCharRange];
  NSRange result = [string rangeOfCharacterFromSet:set];
  return result.location != NSNotFound;
}

@end
