//
//  MLSUserNextCell.m
//  MLSProject
//
//  Created by MinLison on 2017/12/12.
//  Copyright © 2017年 mlsproject. All rights reserved.
//

#import "MLSUserNextCell.h"

@implementation MLSUserNextCell

- (void)setUp
{
        [super setUp];
        [self adjustButtonEnable];
        @weakify(self);
        [self.KVOController observe:MLSUserManager keyPath:@keypath(MLSUserManager,canRegister) options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionOld) block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
                @strongify(self);
                [self adjustButtonEnable];
        }];
}
- (void)adjustButtonEnable
{
        if (self.button.isEnabled != MLSUserManager.canRegister) {
                self.button.enabled = MLSUserManager.canRegister;
        }
        
}
@end
