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
@property (nonatomic) NSMutableArray *shopItemsArray;
@property (nonatomic) NSMutableArray *meetItemsArray;
@property (nonatomic) NSMutableArray *detailedArray;

-(void)addItem:(NSString*)text: (NSString*)identifier;

@end
