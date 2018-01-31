//
//  TodoClass.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-31.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "TodoClass.h"

@implementation TodoClass

- (instancetype)initName:(NSString*)name type:(NSString*)type isComplete:(BOOL)isComplete
{
    self = [super init];
    if (self) {
        self.name = name;
        self.type = type;
        self.isComplete = isComplete;
    }
    return self;
}


@end
