//
//  C64Converter.h
//  TenPrintCover
//
//  Created by Raman Singh on 2021-03-11.
//  Copyright © 2021 NYPL_Labs. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface C64Converter: NSObject

/// Converts a string to a string that uses only the ASCII 64 letter set.
///
/// If the input string is empty, a random string will be returned.
/// @param value The string to convert.
/// @return A non-zero length string that employs only ASCII characters.
+ (nonnull NSString *)convert: (nullable NSString *)value;

@end
