//
//  WBPopMenuView.m
//  QQ_PopMenu_Demo
//
//  Created by Transuner on 16/3/17.
//  Copyright © 2016年 吴冰. All rights reserved.
//

#import "WBPopMenuView.h"
#import "WBTableViewDataSource.h"
#import "WBTableViewDelegate.h"
#import "WBTableViewCell.h"
#import "WBPopMenuModel.h"
#import "WBPopMenuSingleton.h"

//原来是6
#define WBNUMBER 5

@interface WBPopMenuView ()
@property (nonatomic, strong) WBTableViewDataSource * tableViewDataSource;
@property (nonatomic, strong) WBTableViewDelegate   * tableViewDelegate;
@end

@implementation WBPopMenuView

- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
                     menuWidth:(CGFloat)menuWidth
                         items:(NSArray *)items
                        action:(void(^)(NSInteger index))action {
    if (self = [super initWithFrame:frame]) {
        self.menuWidth = menuWidth;
        self.menuItem = items;
        self.action = [action copy];

        self.tableViewDataSource = [[WBTableViewDataSource alloc]initWithItems:items cellClass:[WBTableViewCell class] configureCellBlock:^(WBTableViewCell *cell, WBPopMenuModel *model) {
            WBTableViewCell * tableViewCell = (WBTableViewCell *)cell;
            tableViewCell.textLabel.text = model.title;
            tableViewCell.imageView.image = [UIImage imageNamed:model.image];
        }];
        self.tableViewDelegate = [[WBTableViewDelegate alloc]initWithDidSelectRowAtIndexPath:^(NSInteger indexRow) {
            if (self.action) {
                self.action(indexRow);
            }
        }];


        self.tableView = [[UITableView alloc]initWithFrame:[self menuFrame] style:UITableViewStylePlain];
        self.tableView.dataSource = self.tableViewDataSource;
        self.tableView.delegate   = self.tableViewDelegate;
        self.tableView.layer.cornerRadius = 10.0f;
        CGRect oldFrame = self.tableView.frame;
        NSLog(@"%f",self.tableView.layer.position.x);
        NSLog(@"%f",self.tableView.frame.origin.x);
        NSLog(@"%f",self.tableView.frame.origin.y);


        self.tableView.layer.anchorPoint = CGPointMake(1.0, 0);
//      前后相差0.5个width 0.5个height
//      frame.origin.x = position.x - anchorPoint.x * bounds.size.width；
//      frame.origin.y = position.y - anchorPoint.y * bounds.size.height；
        NSLog(@"%f",self.tableView.layer.position.x);
        NSLog(@"%f",self.tableView.frame.origin.x);
        NSLog(@"%f",self.tableView.frame.origin.y);
        NSLog(@"position.x%f",self.tableView.layer.position.x);
        NSLog(@"position.y%f",self.tableView.layer.position.y);
        //重新设置一遍frame就可以达到目的，这时position就会自动进行相应的改变。
        self.tableView.frame = oldFrame;
        NSLog(@"position.x%f",self.tableView.layer.position.x);
        NSLog(@"position.y%f",self.tableView.layer.position.y);
//      可以单独修改position 配合 anchorPoint 决定 origin
//        self.tableView.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width, 64);
        self.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        self.tableView.rowHeight = 40;
        [self addSubview:self.tableView];
        
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
    }
    return self;
}

- (CGRect)menuFrame {
    //    CGFloat menuX = [UIScreen mainScreen].bounds.size.width - 130;
    //    CGFloat menuY = 180 - 20 * WBNUMBER;
 
        CGFloat menuX = [UIScreen mainScreen].bounds.size.width - self.menuWidth;
        CGFloat menuY = 64 ;
    //      frame.origin.x = position.x - anchorPoint.x * bounds.size.width；
    //      frame.origin.y = position.y - anchorPoint.y * bounds.size.height；
    //      anchorPoint(1,0)时候x多减了0.5width所以最初的时候多加frame应该多postion应该多0.5width
    //      但是两者是互不影响的 所以origin.x需要比正常增加0.5width
    //      y少减了0.5height所以postion应该少0.5height 所以orgin.y需要少比正常0.5height
    
//    CGFloat menuX = [UIScreen mainScreen].bounds.size.width - self.menuWidth/2;
//    CGFloat menuY = 64 - 100;

    CGFloat width = self.menuWidth;
    CGFloat heigh = 40 * WBNUMBER;
    return (CGRect){menuX,menuY,width,heigh};
}

#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
//    CGFloat location = [UIScreen mainScreen].bounds.size.width-55;
    CGFloat location = [UIScreen mainScreen].bounds.size.width-8;

    CGContextMoveToPoint(context,
                         location -  10 , 164-20 * WBNUMBER);//设置起点
    
    CGContextAddLineToPoint(context,
                            location - 2*10  ,  154-20 * WBNUMBER);
    
    CGContextAddLineToPoint(context,
                            location - 10 * 3 , 164-20 * WBNUMBER);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[WBPopMenuSingleton shareManager]hideMenu];
}

@end
