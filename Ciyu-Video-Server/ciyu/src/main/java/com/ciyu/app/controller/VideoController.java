package com.ciyu.app.controller;

import com.ciyu.app.security.IgnoreSecurity;
import com.ciyu.app.service.video.VideoService;
import com.ciyu.app.util.QiniuKodoUtil;
import com.qiniu.common.QiniuException;
import com.qiniu.util.Auth;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/video")
public class VideoController {
    @Resource
    private final QiniuKodoUtil qiniuKodoUtil;
    private final VideoService videoService;

    /**
     * @Description: 上传文件
     * @param file 源文件
     * @return 返回文件的外链访问地址
     */
    @PostMapping
    @IgnoreSecurity
    public String uploadVideo(@RequestParam MultipartFile file) {
        try {
            return videoService.getFileAskingPath(videoService.uploadFile(file));
        } catch (RuntimeException e) {
            return e.getMessage();
        } catch (IOException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    /**
     * @Description: 获取指定文件名（id）的外链访问地址
     * @param id 文件名，即uuid
     * @return 外链地址
     */
    // TODO 没完成
    @RequestMapping("/get")
    @IgnoreSecurity
    public String getFileUrl(@RequestParam String id) {
        return videoService.searchById(id);
    }
}
