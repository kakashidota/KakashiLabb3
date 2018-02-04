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
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISwitch *completeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *importantSwitch;
@property (nonatomic) Model *engine;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailedList = [self.engine getList];
    [self showDetails];
    NSString *temp = [[NSUserDefaults standardUserDefaults] objectForKey:@"description"];
    [self.textView setText: temp];
    //self.textView = [[NSUserDefaults standardUserDefaults] objectForKey:@"description"];
}

- (IBAction)savePressed:(id)sender {
    NSString *inputtext = self.textView.text;
    [[NSUserDefaults standardUserDefaults] setObject:inputtext forKey:@"description"];
}

-(void)showDetails{
    self.textField.text = self.detailedList[self.detailIndex];
    
}
- (IBAction)importantSwitch:(id)sender {
    if (self.arrayIndex != 1){
        
        if ([sender isOn]) {
            [self.currentTodo saveTodos:self.objectIndex arrayIndex:self.arrayIndex];
            
        }
    }
}

- (IBAction)switchOff:(id)sender {
    if (self.arrayIndex != 2){
        if([sender isOn]){
            [self.currentTodo moveToDone:self.objectIndex arrayIndex:self.arrayIndex];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
