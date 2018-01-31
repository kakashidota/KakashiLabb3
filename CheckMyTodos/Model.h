//
//  Model.h
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-29.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray *todoList;
-(void)addItem: (NSString*)text;
-(NSMutableArray*) getList;
-(void) deleteToDoItem: (NSInteger)index;
@end
