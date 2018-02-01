//
//  DetailViewController.m
//  CheckMyTodos
//
//  Created by Robin kamo on 2018-02-01.
//  Copyright © 2018 Robin kamo. All rights reserved.
//

#import "DetailViewController.h"
#import "TodoClass.h"
#import "Model.h"
#import "ViewController.h"

@interface DetailViewController ()
@property (nonatomic) TodoClass *currentTodo;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) Model *engine;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailedList = [self.engine getList];
    [self showDetails];
    // Do any additional setup after loading the view.
}

-(void)showDetails{
    self.textField.text = self.detailedList[self.detailIndex];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
