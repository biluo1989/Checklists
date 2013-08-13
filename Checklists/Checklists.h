//
//  Checklists.h
//  Checklists
//
//  Created by APPLE on 13-8-12.
//  Copyright (c) 2013年 Yujiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklists : NSObject

@property(nonatomic, strong)NSString *text;
@property(nonatomic)BOOL checked;

- (void)toggleChecked;

@end
