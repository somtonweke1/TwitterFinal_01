//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "TweetCell.h"
#import "ComposeViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *timelineTweets;
@property (nonatomic,strong)  UIRefreshControl*refreshControl;


@end

@implementation TimelineViewController

- (void)didTweet:(Tweet *)tweet{
    
    [self.timelineTweets addObject:tweet];
    [self.tableView reloadData];
    
}




-(void)beginRefresh{
    //get data
    [self fetchTimeline];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create refresh
    self.refreshControl = [[UIRefreshControl alloc ]init];
    
    //Getting infromation and beginning to refresh
    
    [self.refreshControl addTarget:self action:@selector(beginRefresh) forControlEvents:UIControlEventValueChanged];
    
    //tells it where it begins to refresh at in the table View
    
    [self.tableView insertSubview:self.refreshControl atIndex:0];

    
    //self.tableView.delegate = self;
    self.tableView.dataSource = self;//(get information from viewcontroller- tweets)
    
    // Get timeline

    [self fetchTimeline];
    
}


- (void)fetchTimeline {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.timelineTweets = tweets;
            [self.tableView reloadData];
        } else {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    cell.tweet = self.timelineTweets[indexPath.row];
    
    return cell;
 
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.timelineTweets.count;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

@end

