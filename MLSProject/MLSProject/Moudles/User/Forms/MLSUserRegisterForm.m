//
//  MLSUserRegisterForm.m
//  MLSProject
//
//  Created by MinLison on 2017/12/12.
//  Copyright © 2017年 mlsproject. All rights reserved.
//

#import "MLSUserRegisterForm.h"
#import "MLSUserFormButtonCell.h"
#import "MLSUserAgreementCell.h"
#import "MLSUserFormPhoneCell.h"
#import "MLSUserFormSMSCell.h"
#import "MLSUserNextCell.h"
@implementation MLSUserRegisterForm

- (NSArray *)fields
{
        return @[
                 @{FXFormFieldKey : @keypath(self,mobile), FXFormFieldTitle : @"", FXFormFieldCell : [MLSUserFormPhoneCell class], FXFormFieldPlaceholder : [NSString aPP_PhoneNum]},
                 @{FXFormFieldKey : @keypath(self,sms_code), FXFormFieldTitle : @"", FXFormFieldCell : [MLSUserFormSMSCell class], FXFormFieldPlaceholder : @"验证码",FXFormFieldAction: @"getSmsCode"},
                 ];
}
- (void)setMobile:(NSString *)mobile
{
        _mobile = mobile;
        MLSUserManager.mobile = mobile;
}
- (void)setSms_code:(NSString *)sms_code
{
        _sms_code = sms_code;
        MLSUserManager.sms_code = sms_code;
}
- (void)setAgreement:(BOOL)agreement
{
        _agreement = agreement;
        MLSUserManager.checkAgreement = agreement;
}
- (NSArray *)extraFields
{
        return @[
                 @{FXFormFieldTitle : @"下一步", FXFormFieldCell : [MLSUserNextCell class], FXFormFieldAction: @"next"},
                 @{FXFormFieldKey : @keypath(self,agreement), FXFormFieldTitle : @"", FXFormFieldCell : [MLSUserAgreementCell class], FXFormFieldAction: @"readAgreement",FXFormFieldDefaultValue : @(MLSUserManager.isCheckAgreement)}
                 ];
}

- (void)dealloc
{
        MLSUserManager.sms_code = nil;
        MLSUserManager.checkAgreement = NO;
}
@end
