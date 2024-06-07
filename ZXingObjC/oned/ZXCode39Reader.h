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

extern unichar ZX_CODE39_ALPHABET[];
extern NSString *ZX_CODE39_ALPHABET_STRING;
extern const int ZX_CODE39_CHARACTER_ENCODINGS[];
extern const int ZX_CODE39_ASTERISK_ENCODING;

/**
 * Reads Code 39 barcodes. Supports "Full ASCII Code 39" if USE_CODE_39_EXTENDED_MODE is set.
 */
@interface ZXCode39Reader : ZXOneDReader


@end
