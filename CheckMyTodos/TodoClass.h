//
//  TodoClass.h
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-31.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoClass : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *type;
@property (nonatomic) BOOL isComplete;
- (instancetype)initName:(NSString*)name type:(NSString*)type isComplete:(BOOL)isComplete;
@end
