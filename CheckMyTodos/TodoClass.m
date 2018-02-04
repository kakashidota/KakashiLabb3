//
//  TodoClass.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-31.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "TodoClass.h"

@implementation TodoClass

-(instancetype)init{
    self = [super init];
    if (self) {
        self.todoItemsArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"todoArray"]mutableCopy];
        if (self.todoItemsArray == nil) {
            self.todoItemsArray = [[NSMutableArray alloc] init];
        }
    }
    if (self){
        self.importantTodos = [[[NSUserDefaults standardUserDefaults]objectForKey:@"importantTodos"] mutableCopy];
        if (self.importantTodos == nil) {
            self.importantTodos = [[NSMutableArray alloc] init];
        }
    }
    if (self){
        self.doneTodos = [[[NSUserDefaults standardUserDefaults]objectForKey:@"doneTodos"]mutableCopy ];
        if (self.doneTodos == nil) {
            self.doneTodos = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

-(void)addItem:(NSString*) note{
    [self.todoItemsArray addObject:note];
    [self saveLists];
}

-(void)deleteItem:(NSInteger) index{
    [self.todoItemsArray removeObjectAtIndex:index];
    [self saveLists];
}
-(void) moveToDone :(NSInteger) objectIndex arrayIndex:(NSInteger) arrayIndex{
    
        if (arrayIndex == 0) {
            [self.doneTodos addObject: self.todoItemsArray[objectIndex]];
            [self.todoItemsArray removeObjectAtIndex:objectIndex];
        } else if(arrayIndex == 1){
            [self.doneTodos addObject:self.importantTodos[objectIndex]];
            [self.importantTodos removeObjectAtIndex:objectIndex];
        } else if (arrayIndex == 2){
            [self.doneTodos addObject:self.todoItemsArray[objectIndex]];
            [self.doneTodos removeObjectAtIndex:objectIndex];
        }
        [self saveLists];
    
}
-(void)saveTodos :(NSInteger) objectIndex arrayIndex:(NSInteger) arrayIndex{
    if (arrayIndex == 0) {
        [self.importantTodos addObject: self.todoItemsArray[objectIndex]];
        [self.todoItemsArray removeObjectAtIndex:objectIndex];
    } else if(arrayIndex == 1){
        [self.importantTodos addObject:self.importantTodos[objectIndex]];
        [self.importantTodos removeObjectAtIndex:objectIndex];
    } else if (arrayIndex == 2){
        [self.importantTodos addObject:self.todoItemsArray[objectIndex]];
        [self.doneTodos removeObjectAtIndex:objectIndex];
    }
    [self saveLists];
}

-(void)saveLists{

    [[NSUserDefaults standardUserDefaults] setObject:self.todoItemsArray forKey:@"todoArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantTodos forKey:@"importantTodos"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneTodos forKey:@"doneTodos"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


    @end
    
