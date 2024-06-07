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

#import "ZXCode39Reader.h"

unichar ZX_CODE39_ALPHABET[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
  'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
  'X', 'Y', 'Z', '-', '.', ' ', '$', '/', '+', '%'};
NSString *ZX_CODE39_ALPHABET_STRING = nil;


/**
 * These represent the encodings of characters, as patterns of wide and narrow bars.
 * The 9 least-significant bits of each int correspond to the pattern of wide and narrow,
 * with 1s representing "wide" and 0s representing narrow.
 */
const int ZX_CODE39_CHARACTER_ENCODINGS[] = {
  0x034, 0x121, 0x061, 0x160, 0x031, 0x130, 0x070, 0x025, 0x124, 0x064, // 0-9
  0x109, 0x049, 0x148, 0x019, 0x118, 0x058, 0x00D, 0x10C, 0x04C, 0x01C, // A-J
  0x103, 0x043, 0x142, 0x013, 0x112, 0x052, 0x007, 0x106, 0x046, 0x016, // K-T
  0x181, 0x0C1, 0x1C0, 0x091, 0x190, 0x0D0, 0x085, 0x184, 0x0C4, 0x0A8, // U-$
  0x0A2, 0x08A, 0x02A // /-%
};

const int ZX_CODE39_ASTERISK_ENCODING = 0x094;

@implementation ZXCode39Reader

+ (void)load {
  ZX_CODE39_ALPHABET_STRING = [[NSString alloc] initWithCharacters:ZX_CODE39_ALPHABET
                                                            length:sizeof(ZX_CODE39_ALPHABET) / sizeof(unichar)];
}

@end
