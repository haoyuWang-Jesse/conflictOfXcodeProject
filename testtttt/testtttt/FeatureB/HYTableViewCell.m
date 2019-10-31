//
//  HYTableViewCell.m
//  testtttt
//
//  Created by 王浩宇 on 2019/7/2.
//  Copyright © 2019 王浩宇. All rights reserved.
//

#import "HYTableViewCell.h"

@interface HYTableViewCell()

@property (nonatomic, strong) UIImageView *image;

@end

@implementation HYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
     self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.image];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.image.frame = self.contentView.frame;
}

-(void)config {
    self.image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562065331158&di=2f2081a61f2647b64ff9a420b7f9ca22&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9d82d158ccbf6c8165f7ae67b23eb13532fa4079.jpg"]]];
}

@end
