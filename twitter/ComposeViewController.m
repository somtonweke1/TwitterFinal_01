//
//  ComposeViewController.m
//  twitter
//
//  Created by Somtochukwu Nweke on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import  "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *TextView;

@end





@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)TweetButton:(id)sender {
    
    //Getting whatever the user types in
    NSString *text = self.TextView.text;
    
    NSLog(@"Im Tweeting%@", text);
    [[APIManager shared] postStatusWithText:text completion:^(Tweet *PostedTweet, NSError *MyError) {
        NSLog(@"Tweet Posted");
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }];

    
}
     //This closes the view controller
- (IBAction)CloseButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
    
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
