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

#import "ZXQRCodeErrorCorrectionLevel.h"
#import "ZXQRCodeFormatInformation.h"

const int ZX_FORMAT_INFO_MASK_QR = 0x5412;

/**
 * Offset i holds the number of 1 bits in the binary representation of i
 */
const int ZX_BITS_SET_IN_HALF_BYTE[] = {0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4};

@implementation ZXQRCodeFormatInformation

- (id)initWithFormatInfo:(int)formatInfo {
  if (self = [super init]) {
    _errorCorrectionLevel = [ZXQRCodeErrorCorrectionLevel forBits:(formatInfo >> 3) & 0x03];
    _dataMask = (int8_t)(formatInfo & 0x07);
  }

  return self;
}

+ (int)numBitsDiffering:(int)a b:(int)b {
  a ^= b;
  return ZX_BITS_SET_IN_HALF_BYTE[a & 0x0F] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 4 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 8 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 12 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 16 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 20 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 24 & 0x0F)] +
      ZX_BITS_SET_IN_HALF_BYTE[((int)((unsigned int)a) >> 28 & 0x0F)];
}

- (NSUInteger)hash {
  return (self.errorCorrectionLevel.ordinal << 3) | (int)self.dataMask;
}

- (BOOL)isEqual:(id)o {
  if (![o isKindOfClass:[ZXQRCodeFormatInformation class]]) {
    return NO;
  }
  ZXQRCodeFormatInformation *other = (ZXQRCodeFormatInformation *)o;
  return self.errorCorrectionLevel == other.errorCorrectionLevel && self.dataMask == other.dataMask;
}

@end
