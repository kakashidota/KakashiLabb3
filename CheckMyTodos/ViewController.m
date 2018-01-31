//
//  ViewController.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-29.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TodoClass.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *submitBtn;
@property (weak, nonatomic) IBOutlet UIView *myMainView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *taskView;
@property (weak, nonatomic) IBOutlet UIButton *todoBtn;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
@property (weak, nonatomic) IBOutlet UIButton *meetBtn;
@property (nonatomic) BOOL shop;
@property (nonatomic) BOOL meet;
@property (nonatomic) NSMutableArray *todoDatabase;
@property(nonatomic) Model *engine;
@property (nonatomic) NSString *inputText;
@property (nonatomic)NSMutableArray *syster;
//TODOKLASS RELATED

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSUserDefaults standardUserDefaults] objectForKey:@"todos"];
    self.engine = [[Model alloc] init];
    self.todoDatabase = [[NSMutableArray alloc]init];
    self.todoDatabase = self.engine.todoList;

    [self css];
    self.taskView.hidden = YES;

}

-(void)css{
    self.todoBtn.layer.cornerRadius = 7;
    self.shopBtn.layer.cornerRadius = 7;
    self.meetBtn.layer.cornerRadius = 7;
    self.submitBtn.layer.cornerRadius = 7;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      
        [self.engine deleteToDoItem:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitPressed:(id)sender {
    [self.tableView setNeedsDisplay];
    self.inputText = [[NSString alloc] init];
    self.inputText = self.textField.text;

    self.taskView.hidden = NO;
    [self loadView];
    
    
}

- (IBAction)todoPressed:(id)sender {
    TodoClass *currentTodo =[[TodoClass alloc]initName:self.inputText type:@"todoType" isComplete:NO];
    [self.engine addItem:currentTodo.name];
    [self loadView];
    self.taskView.hidden = YES;
}


- (IBAction)shopPressed:(id)sender {
    self.shop = YES;
    TodoClass *currentTodo =[[TodoClass alloc]initName:self.inputText type:@"shopType" isComplete:NO];
    [self.engine addItem:currentTodo.name];
    [self loadView];
    self.taskView.hidden = YES;
}

- (IBAction)meetPressed:(id)sender {
    self.meet = YES;
    TodoClass *currentTodo =[[TodoClass alloc]initName:self.inputText type:@"meetType" isComplete:NO];
    [self.engine addItem:currentTodo.name];
    [self loadView];
    self.taskView.hidden = YES;
}



-(void)loadView{
    [super loadView];
    self.todoDatabase = self.engine.todoList;
    [self.tableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    self.syster = [[NSMutableArray alloc] init];
   self.syster = [self.engine getList];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.engine.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    
      cell.textLabel.text = [self.engine.getList objectAtIndex:indexPath.row];
    
    
    return cell;
}

@end
