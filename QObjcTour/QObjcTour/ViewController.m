//
//  ViewController.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/29.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

/*view层代码规范：
 在viewDidload里面只做addSubview的事情，然后在viewWillAppear里面做布局的事情（勘误1），最后在viewDidAppear里面做Notification的监听之类的事情。至于属性的初始化，则交给getter去做。
 
 比如这样：
 */

#import "ViewController.h"
#import "QBlock.h"
#import "PThread.h"


@interface ViewController (){
    UIImageView *_imageView;
    UIButton *_pressBtn;

}

@end

@implementation ViewController

#pragma lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [QBlock inlineBlock];
//    LaunchThread();
//    newPthread();
    
    [self layoutUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _pressBtn.frame = CGRectMake(0, 0, 100, 20);
    _pressBtn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Delegate

#pragma event response

-(void)loadImageWithMultiThread{
    //方法1：使用对象方法
    //创建一个线程，第一个参数是请求的操作，第二个参数是操作方法的参数
    //    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
    //    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
    //    [thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}


#pragma private methods

-(void)layoutUI{
    _imageView =[[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


-(void)updateImage:(NSData *)imageData{
    UIImage *image=[UIImage imageWithData:imageData];
    _imageView.image=image;
}

-(NSData *)requestData{
    //对于多线程操作建议把线程操作放到@autoreleasepool中
    @autoreleasepool {
        NSURL *url=[NSURL URLWithString:@"http://images.apple.com/iphone-6/overview/images/biggest_right_large.png"];
        NSData *data=[NSData dataWithContentsOfURL:url];
        return data;
    }
}

-(void)loadImage{
    //请求数据
    NSData *data= [self requestData];
    /*将数据显示到UI控件,注意只能在主线程中更新UI,
     另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     Object：代表调用方法的参数,不过只能传递一个参数(如果有多个参数请使用对象进行封装)
     waitUntilDone:是否线程任务完成执行
     */
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

#pragma getters and setters


@end
