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

#import "ZXOneDReader.h"

extern const int ZX_UPC_EAN_START_END_PATTERN_LEN;
extern const int ZX_UPC_EAN_START_END_PATTERN[];
extern const int ZX_UPC_EAN_MIDDLE_PATTERN_LEN;
extern const int ZX_UPC_EAN_MIDDLE_PATTERN[];
extern const int ZX_UPC_EAN_L_PATTERNS_LEN;
extern const int ZX_UPC_EAN_L_PATTERNS_SUB_LEN;
extern const int ZX_UPC_EAN_L_PATTERNS[][4];
extern const int ZX_UPC_EAN_L_AND_G_PATTERNS_LEN;
extern const int ZX_UPC_EAN_L_AND_G_PATTERNS_SUB_LEN;
extern const int ZX_UPC_EAN_L_AND_G_PATTERNS[][4];

/**
 * Encapsulates functionality and implementation that is common to UPC and EAN families
 * of one-dimensional barcodes.
 */
@interface ZXUPCEANReader : ZXOneDReader

/**
 * Computes the UPC/EAN checksum on a string of digits, and reports
 * whether the checksum is correct or not.
 *
 * @param s string of digits to check
 * @return YES iff string of digits passes the UPC/EAN checksum algorithm
 * @return NO if the string does not contain only digits
 */
+ (BOOL)checkStandardUPCEANChecksum:(NSString *)s;

+ (int)standardUPCEANChecksum:(NSString *)s;

@end
