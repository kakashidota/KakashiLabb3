//
//  DetailViewController.h
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-02-01.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "ViewController.h"
#import "TodoClass.h"

@interface DetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UITextView *detailView;
@property (nonatomic) NSMutableArray *detailArray;
@property (nonatomic) int detailIndex;
@property (nonatomic) TodoClass *currentTodo;
@property (nonatomic) NSInteger objectIndex;
@property (nonatomic) NSInteger arrayIndex;
@end
