		//
//  ViewController.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-01-29.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "ViewController.h"
#import "TodoClass.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *submitBtn;
@property (weak, nonatomic) IBOutlet UIView *myMainView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *todoArray;
@property (nonatomic) NSString *inputText;
@property (nonatomic) TodoClass *currentTodo;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    [[NSUserDefaults standardUserDefaults] objectForKey:@"todos"];
    self.todoArray = [[NSMutableArray alloc] init];
    
}


-(void)viewWillAppear:(BOOL)animated{
    self.currentTodo.todoItemsArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"todoArray"]mutableCopy];
    [self loadView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitPressed:(id)sender {
    if (!self.currentTodo){
        self.currentTodo = [[TodoClass alloc] init];
    }
    [self.tableView setNeedsDisplay];
    
    self.inputText = self.textField.text;
    [self.currentTodo addItem:self.inputText];
    [self loadView];
}

-(void)loadView{
    [super loadView];
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
//self.syster = [[NSMutableArray alloc] init];
}

#pragma mark - Cell manipulation
- (IBAction)editBtnPressed:(id)sender {
    if ([self isEditing]) {
        [self setEditing:NO animated:YES];
    } else {
        [self setEditing:YES animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *stringToMove = self.currentTodo.todoItemsArray[sourceIndexPath.row];
    [self.currentTodo.todoItemsArray removeObjectAtIndex:sourceIndexPath.row];
    [self.currentTodo.todoItemsArray insertObject:stringToMove atIndex:destinationIndexPath.row];
    [self.currentTodo saveLists];
    [self loadView];
    
}

# pragma mark - TABLE SETUP

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0){
        return [self.currentTodo.todoItemsArray count];
    } else if (section == 1){
       // NSLog(@"yoo %@", self.currentTodo.importantTodos[0]);
        return [self.currentTodo.importantTodos count];
    } else if (section == 2){
        return [self.currentTodo.doneTodos count];
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    if (indexPath.section == 0){
        cell.textLabel.text = [[self.currentTodo todoItemsArray] objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1){
        cell.textLabel.text = [[self.currentTodo importantTodos] objectAtIndex:indexPath.row];
    } else if (indexPath.section == 2){
        cell.textLabel.text = [[self.currentTodo doneTodos] objectAtIndex:indexPath.row];
    }
        return cell;
    }

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return @"Active";
    }else if (section == 1){
        return @"Important";
    } else if (section == 2){
        return @"Done";
    } else return @"";
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.section == 0) {
            [self.currentTodo.todoItemsArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self loadView];
        } else  if (indexPath.section == 1){
            [self.currentTodo.importantTodos removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self loadView];
        } else if (indexPath.section == 2){
            [self.currentTodo.doneTodos removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self loadView];
        }
      
    }
}
#pragma mark - TABLEVIEW END

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UITableViewCell *cell = sender;
    int cellSection = (int) [self.tableView indexPathForCell:cell].section;

    if(cellSection != 2){
        
        if ([segue.identifier isEqualToString:@"detailSegue"]) {
            DetailViewController *details = [segue destinationViewController];

            //details.detailedList = self.todoDatabase;
            details.detailedList = self.currentTodo.todoItemsArray;
            details.currentTodo = self.currentTodo;
            details.title = cell.textLabel.text;
            details.objectIndex = [self.tableView indexPathForCell:cell].row;
            details.arrayIndex = [self.tableView indexPathForCell:cell].section;
        }
    }
}

@end
