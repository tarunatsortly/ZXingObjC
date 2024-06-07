/*
 * Copyright 2012 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "ZXBitArray.h"
#import "ZXErrors.h"
#import "ZXIntArray.h"
#import "ZXUPCEANReader.h"

static float ZX_UPC_EAN_MAX_AVG_VARIANCE = 0.48f;
static float ZX_UPC_EAN_MAX_INDIVIDUAL_VARIANCE = 0.7f;

/**
 * Start/end guard pattern.
 */
const int ZX_UPC_EAN_START_END_PATTERN_LEN = 3;
const int ZX_UPC_EAN_START_END_PATTERN[ZX_UPC_EAN_START_END_PATTERN_LEN] = {1, 1, 1};

/**
 * Pattern marking the middle of a UPC/EAN pattern, separating the two halves.
 */
const int ZX_UPC_EAN_MIDDLE_PATTERN_LEN = 5;
const int ZX_UPC_EAN_MIDDLE_PATTERN[ZX_UPC_EAN_MIDDLE_PATTERN_LEN] = {1, 1, 1, 1, 1};

/**
 * "Odd", or "L" patterns used to encode UPC/EAN digits.
 */
const int ZX_UPC_EAN_L_PATTERNS_LEN = 10;
const int ZX_UPC_EAN_L_PATTERNS_SUB_LEN = 4;
const int ZX_UPC_EAN_L_PATTERNS[ZX_UPC_EAN_L_PATTERNS_LEN][ZX_UPC_EAN_L_PATTERNS_SUB_LEN] = {
  {3, 2, 1, 1}, // 0
  {2, 2, 2, 1}, // 1
  {2, 1, 2, 2}, // 2
  {1, 4, 1, 1}, // 3
  {1, 1, 3, 2}, // 4
  {1, 2, 3, 1}, // 5
  {1, 1, 1, 4}, // 6
  {1, 3, 1, 2}, // 7
  {1, 2, 1, 3}, // 8
  {3, 1, 1, 2}  // 9
};

/**
 * As above but also including the "even", or "G" patterns used to encode UPC/EAN digits.
 */
const int ZX_UPC_EAN_L_AND_G_PATTERNS_LEN = 20;
const int ZX_UPC_EAN_L_AND_G_PATTERNS_SUB_LEN = 4;
const int ZX_UPC_EAN_L_AND_G_PATTERNS[ZX_UPC_EAN_L_AND_G_PATTERNS_LEN][ZX_UPC_EAN_L_AND_G_PATTERNS_SUB_LEN] = {
  {3, 2, 1, 1}, // 0
  {2, 2, 2, 1}, // 1
  {2, 1, 2, 2}, // 2
  {1, 4, 1, 1}, // 3
  {1, 1, 3, 2}, // 4
  {1, 2, 3, 1}, // 5
  {1, 1, 1, 4}, // 6
  {1, 3, 1, 2}, // 7
  {1, 2, 1, 3}, // 8
  {3, 1, 1, 2}, // 9
  {1, 1, 2, 3}, // 10 reversed 0
  {1, 2, 2, 2}, // 11 reversed 1
  {2, 2, 1, 2}, // 12 reversed 2
  {1, 1, 4, 1}, // 13 reversed 3
  {2, 3, 1, 1}, // 14 reversed 4
  {1, 3, 2, 1}, // 15 reversed 5
  {4, 1, 1, 1}, // 16 reversed 6
  {2, 1, 3, 1}, // 17 reversed 7
  {3, 1, 2, 1}, // 18 reversed 8
  {2, 1, 1, 3}  // 19 reversed 9
};

@implementation ZXUPCEANReader

+ (BOOL)checkStandardUPCEANChecksum:(NSString *)s {
  int length = (int)[s length];
  if (length == 0) {
    return NO;
  }
  int check = [[s substringWithRange:NSMakeRange((length - 1), 1)] intValue];
  return [self standardUPCEANChecksum:[s substringWithRange:NSMakeRange(0, length - 1)]] == check;
}

+ (int)standardUPCEANChecksum:(NSString *)s {
  int length = (int)[s length];
  int sum = 0;

  for (int i = length - 1; i >= 0; i -= 2) {
    int digit = (int)[s characterAtIndex:i] - (int)'0';
    if (digit < 0 || digit > 9) {
      return NO;
    }
    sum += digit;
  }

  sum *= 3;

  for (int i = length - 2; i >= 0; i -= 2) {
    int digit = (int)[s characterAtIndex:i] - (int)'0';
    if (digit < 0 || digit > 9) {
      return NO;
    }
    sum += digit;
  }

  return (1000 - sum) % 10;
}

@end
