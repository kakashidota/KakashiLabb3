//
//  TodoClass.h
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-31.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoClass : NSObject
@property (nonatomic) NSMutableArray *todoItemsArray;
@property (nonatomic) NSMutableArray *importantTodos;
@property (nonatomic) NSMutableArray *doneTodos;
-(void)addItem:(NSString*) note;
-(void)deleteItem:(NSInteger)index;
-(void)saveTodos :(NSInteger) objectIndex arrayIndex:(NSInteger) arrayIndex;
-(void) moveToDone :(NSInteger) objectIndex arrayIndex:(NSInteger) arrayIndex;
-(void)saveLists;



@end
