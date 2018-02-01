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
        self.todoItemsArray= [[NSUserDefaults standardUserDefaults]objectForKey:@"todoArray"];
        if (self.todoItemsArray == nil) {
            self.todoItemsArray = [[NSMutableArray alloc] init];
        }
        
        if (self) {
            self.shopItemsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"shopArray"];
            if (self.shopItemsArray == nil) {
                self.shopItemsArray = [[NSMutableArray alloc] init];
            }
        }
        
        if(self){
            self.meetItemsArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"meetArray"];
            if (self.meetItemsArray == nil) {
                self.meetItemsArray = [[NSMutableArray alloc] init];
            }
        }
    }
    return self;

}

-(void)addItem:(NSString*)text: (NSString*)identifier{
    NSLog(@"kommer du hit?");
    if ([identifier isEqualToString:@"todo"]) {
        [self.todoItemsArray addObject:text];
    } else if ([identifier isEqualToString:@"shop"]){
        [self.shopItemsArray addObject:text];
    } else if ([identifier isEqualToString:@"meet"]){
        [self.meetItemsArray addObject:text];
    }
    [[NSUserDefaults standardUserDefaults] setObject:self.todoItemsArray forKey:@"todo"];
    [[NSUserDefaults standardUserDefaults] setObject:self.shopItemsArray forKey:@"shop"];
    [[NSUserDefaults standardUserDefaults]setObject:self.meetItemsArray forKey:@"meet"];
    [[NSUserDefaults standardUserDefaults] synchronize];


}


    @end
    
