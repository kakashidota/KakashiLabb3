//
//  Model.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-29.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "Model.h"
#import "TodoClass.h"

@implementation Model
-(void)addItem: (TodoClass*)text{
    [self.todoList addObject:text];
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:self.todoList forKey:@"hejsan"];
    [settings synchronize];
}
-(void) deleteToDoItem: (NSInteger)index{
    [self.todoList removeObjectAtIndex:index];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.todoList = [[NSMutableArray alloc ] init];
        
        self.todoList = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"hejsan"] mutableCopy];
        if (self.todoList.count == 0){
            self.todoList = @[@"Hund", @"Vaska Skump", @"Köra hoj"].mutableCopy;
        }
    }
    
    return self;
}


-(NSMutableArray*) getList{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSMutableArray *syster = [settings objectForKey:@"hejsan"];
    return syster;
}

-(void)deleteItem{
    
}
@end
