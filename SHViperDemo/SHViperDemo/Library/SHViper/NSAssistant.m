//
//  NSAssistant.m
//  wanzi
//
//  Created by wang kaiqing on 12-3-19.
//  Copyright 2012 yuedian. All rights reserved.
//

#import "NSAssistant.h"
#import <objc/runtime.h>

@implementation NSAssistant

+ (void)setVC:(UIViewController *)vc dic:(id)dic {
    if (!dic) {
        return;
    }
    vc.title = dic[@"title"];
    
    unsigned propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([vc class],&propertyCount);
    for(int i=0;i<propertyCount;i++){
        NSString * keySName;                              // key string  名字
        NSString * keySAtt;                               // key string  属性
        objc_property_t keyChar = properties[i];          // key Char 属性
        const char *keyCName = property_getName(keyChar); // key Char 名字
        keySName = [NSString stringWithCString:keyCName encoding:NSASCIIStringEncoding];

        @try {
            [dic objectForKey:keySName];
        }@catch (NSException * e) {
            DDLogVerbose(@"设置VC属性时候,dic取值错误:%@\n\n\n", keySName);
            continue;
        }
        
        const char * keyCAtt = property_getAttributes(keyChar); // key Char 属性
        keySAtt   = [NSString stringWithCString:keyCAtt encoding:NSASCIIStringEncoding];
        id value = [dic objectForKey:keySName];
        //DDLogVerbose(@"%s key:%@, value:%@", __func__, keySName, keySAtt);
        
        if (!value) continue;
        
        // 屏蔽系统参数
        // nsobject 的 hash
        if ([keySAtt hasPrefix:@"TQ,R"]) continue;
        // nsobject 的 superclass
        if ([keySAtt hasPrefix:@"T#,R"]) continue;
        // nsobject 的 describe, debugDescription
        if ([keySAtt hasPrefix:@"T@\"NSString\",R,C"]) continue;
        
        if ([keySAtt hasPrefix:@"Tc"]
            || [keySAtt hasPrefix:@"Ti"]
            || [keySAtt hasPrefix:@"TB"]) {
            [vc setValue:[NSNumber numberWithInt:[value intValue]] forKey:keySName];
            continue;
        }
        if ([keySAtt hasPrefix:@"Tf"]) {
            [vc setValue:[NSNumber numberWithFloat:[value floatValue]] forKey:keySName];
            continue;
        }
        // defalut
        [vc setValue:value forKey:keySName];
    }
    free(properties);
    
    //DDLogVerbose(@"\n\n");
}


@end

