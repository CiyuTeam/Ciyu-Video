package com.ciyu.app.controller;

import com.ciyu.app.security.IgnoreSecurity;
import com.ciyu.app.util.QiniuKodoUtil;
import com.qiniu.common.QiniuException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author: wyf
 * @create: 2023-11-03
 * @Description: 云存储空间文件管理，提供开发者内部接口
 */

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/bucket")
public class BucketController {
    @Resource
    private final QiniuKodoUtil qiniuKodoUtil;

    /**
     * @Description: 列举七牛云bucket空间文件列表
     * @return 文件信息（key值，大小，所属类型类型）集合
     */
    @RequestMapping("/list")
    @IgnoreSecurity
    public List<String> listSpaceFiles() throws QiniuException {
        return qiniuKodoUtil.listSpaceFiles();
    }

    @DeleteMapping("/delete")
    @IgnoreSecurity
    public int deleteFile(@RequestBody String[] fileList) {
        return qiniuKodoUtil.deleteFile(fileList);
    }


}
