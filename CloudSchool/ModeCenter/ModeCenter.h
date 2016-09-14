//
//  ModeCenter.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CourseDetail_M;
@interface ModeCenter : NSObject

@end


/**
 *  课程模型
 */
@interface Course_M : NSObject

@property (nonatomic, copy) NSString *courseCredit;

@property (nonatomic, copy) NSString *courseId;

@property (nonatomic, copy) NSString *teacherName;

@property (nonatomic, copy) NSString *courseCategory;

@property (nonatomic, copy) NSString *alertDays;

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *courseCharacter;

@property (nonatomic, copy) NSString *courseName;

@end

/**
 *  课程列表
 */
@interface Course_M_List : NSObject

@property (nonatomic, strong) NSArray *ownCourses;

@property (nonatomic, copy) NSString *totalScores;

@property (nonatomic, copy) NSString *profileUrl;

@property (nonatomic, strong) NSArray<Course_M *> *selectCourses;

@property (nonatomic, copy) NSString *userName;

+ (NSDictionary *)mj_objectClassInArray;

@end



@interface StudentView : NSObject

@property (nonatomic, assign) BOOL joined;

@property (nonatomic, assign) NSInteger processRate;

@property (nonatomic, assign) BOOL marked;

@end


/**
 *  课程详情
 */
@interface CourseDetail_M : NSObject


@property (nonatomic, copy) NSString *courseClass;

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *teacher;

@property (nonatomic, copy) NSString *liveTeacherView;

@property (nonatomic, copy) NSString *teacherFaculty;

@property (nonatomic, copy) NSString *teacherHospital;

@property (nonatomic, copy) NSString *courseCategory;

@property (nonatomic, copy) NSString *teachingObjective;

@property (nonatomic, copy) NSString *alertDays;

@property (nonatomic, copy) NSString *teacherName;

@property (nonatomic, strong) StudentView *studentView;

@property (nonatomic, copy) NSString *teacherTitle;

@property (nonatomic, copy) NSString *knoledgePoint;

@property (nonatomic, copy) NSString *courseName;

@property (nonatomic, copy) NSString *teacherPosition;

@property (nonatomic, copy) NSString *courseId;

@property (nonatomic, copy) NSString *courseCharacter;

@property (nonatomic, copy) NSString *teacherProfileUrl;

@property (nonatomic, copy) NSString *courseCredit;

@property (nonatomic, copy) NSString *beginDate;

@end


