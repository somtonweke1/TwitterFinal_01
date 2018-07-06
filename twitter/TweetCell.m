//
//  TweetCell.m
//  twitter
//
//  Created by Somtochukwu Nweke on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "User.h"
#import "Tweet.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTweet :(Tweet *)tweet {
    _tweet = tweet;
    
    self.nameLabel.text = self.tweet.user.name;
    self.tweetLabel.text= self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    self.usernameLabel.text = self.tweet.user.screenName;
    
    NSString *countedRetweets = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.retweetLabel.text = countedRetweets;
    self.retweetButton.selected = self.tweet.retweeted;
    
    NSString *countedFavorites = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.favoriteLabel.text = countedFavorites;
    self.favoriteButton.selected = self.tweet.favorited;
}
@end
