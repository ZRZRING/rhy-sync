package cn.Rhysync.musicserver.config;

import cn.Rhysync.musicserver.interceptors.UserInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

@RequiredArgsConstructor
@Configuration
public class WebConfig implements WebMvcConfigurer {
    private final UserInterceptor userInterceptor;
    //注入拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //  拦截所有请求路径交给userInterceptor来验证是否登录（放行登录方法）
        registry
                .addInterceptor(userInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/admin/login","/admin/register","/r/**");
    }

    //资源映射
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 使用绝对路径，确保路径正确
        String basePath = "file:D:/mres/";

        // 检查目录是否存在
        File songDir = new File(basePath + "song/");
        File imgDir = new File(basePath + "images/");

        System.out.println("静态资源映射配置:");
        System.out.println("音乐文件映射: /song/** -> " + basePath + "song/");
        System.out.println("图片文件映射: /img/** -> " + basePath + "images/");
        System.out.println("音乐目录是否存在: " + songDir.exists());
        System.out.println("图片目录是否存在: " + imgDir.exists());

        if (songDir.exists()) {
            File[] songFiles = songDir.listFiles();
            System.out.println("音乐目录下的文件数量: " + (songFiles != null ? songFiles.length : 0));
            if (songFiles != null) {
                for (File file : songFiles) {
                    System.out.println("音乐文件: " + file.getName());
                }
            }
        }

        //映射本地音乐文件
        registry.addResourceHandler("/song/**")
                .addResourceLocations(basePath + "song/");

        //映射本地图片文件
        registry.addResourceHandler("/img/**")
                .addResourceLocations(basePath + "images/");
    }
    //跨域配置
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedHeaders("*")
                .allowedMethods("*")
                .allowedOriginPatterns("*");
    }
}
