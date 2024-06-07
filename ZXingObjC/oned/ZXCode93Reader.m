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

#import "ZXCode93Reader.h"

const NSString *ZX_CODE93_ALPHABET_STRING = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*";
const unichar ZX_CODE93_ALPHABET[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
  'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
  'X', 'Y', 'Z', '-', '.', ' ', '$', '/', '+', '%', 'a', 'b', 'c', 'd', '*'};

/**
 * These represent the encodings of characters, as patterns of wide and narrow bars.
 * The 9 least-significant bits of each int correspond to the pattern of wide and narrow.
 */
const int ZX_CODE93_CHARACTER_ENCODINGS[] = {
  0x114, 0x148, 0x144, 0x142, 0x128, 0x124, 0x122, 0x150, 0x112, 0x10A, // 0-9
  0x1A8, 0x1A4, 0x1A2, 0x194, 0x192, 0x18A, 0x168, 0x164, 0x162, 0x134, // A-J
  0x11A, 0x158, 0x14C, 0x146, 0x12C, 0x116, 0x1B4, 0x1B2, 0x1AC, 0x1A6, // K-T
  0x196, 0x19A, 0x16C, 0x166, 0x136, 0x13A, // U-Z
  0x12E, 0x1D4, 0x1D2, 0x1CA, 0x16E, 0x176, 0x1AE, // - - %
  0x126, 0x1DA, 0x1D6, 0x132, 0x15E, // Control chars? $-*
};

const int ZX_CODE93_ASTERISK_ENCODING = 0x15E;

@implementation ZXCode93Reader

@end
