/**
 * Created by Administrator on 2017/3/27.
 */
//引入gulp和gulp插件
var gulp = require('gulp'),
    assetRev = require('gulp-asset-rev'),
    runSequence = require('run-sequence'),
    rev = require('gulp-rev'),
    stripDebug = require('gulp-strip-debug'),
    revCollector = require('gulp-rev-collector');

//定义css、js源文件路径
var cssSrc = '/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp/**/*.css',
    jsSrc = '/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp/**/*.js',
    jsDist = '/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp';
    //cssSrc = 'css/alert/*.css',
    //jsSrc = 'js/**/*.js';
    

/*//为css中引入的图片/字体等添加hash编码
gulp.task('assetRev', function(){
    return gulp.src(cssSrc)  //该任务针对的文件
        .pipe(assetRev()) //该任务调用的模块
        .pipe(gulp.dest('src/css')); //编译后的路径
});*/

//CSS生成文件hash编码并生成 rev-manifest.json文件名对照映射
gulp.task('revCss', function(){
    return gulp.src(cssSrc)
        .pipe(rev())
        .pipe(rev.manifest())
        .pipe(gulp.dest('rev/css'));
});


//js生成文件hash编码并生成 rev-manifest.json文件名对照映射
gulp.task('revJs', function(){
    return gulp.src(jsSrc)
        .pipe(rev())
        .pipe(rev.manifest())
        .pipe(gulp.dest('rev/js'));
});


//Html替换css、js文件版本
gulp.task('revHtml', function () {
    //return gulp.src(['rev/**/*.json','WEB-INF/**/*.jsp'])
    return gulp.src(['rev/**/*.json','/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp/WEB-INF/pages/**/*.jsp'])
        .pipe(revCollector())
        //.pipe(gulp.dest('WEB-INF'));
        .pipe(gulp.dest('/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp/WEB-INF/pages'));
});

//删除js文件中的console.log调试命令
gulp.task('stripDebug', function () {
    return gulp.src('/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp/**/*.js')
        .pipe(stripDebug())
        .pipe(gulp.dest('/Work/应用开发团/2015-网运大数据平台/NOCE/src/main/webapp'));
});

//开发构建
gulp.task('default', function (done) {
    condition = false;
    runSequence(    //需要说明的是，用gulp.run也可以实现以上所有任务的执行，只是gulp.run是最大限度的并行执行这些任务，而在添加版本号时需要串行执行（顺序执行）这些任务，故使用了runSequence.
        ['revCss'],
        ['revJs'],
        ['revHtml'],
//        ['stripDebug'],
        done);
});
