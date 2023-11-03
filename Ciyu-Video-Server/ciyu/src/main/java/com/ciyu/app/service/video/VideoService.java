package com.ciyu.app.service.video;

import com.qiniu.storage.model.FileInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface VideoService {
    /**
     * 上传单个文件
     * @param file 上传的文件
     * @return key 文件存储的路径
     */
    String uploadFile(MultipartFile file) throws RuntimeException, IOException;

    /**
     * 删除文件
     * @param key 文件的key
     * @return 删除成功返回true, 否则返回false
     */
    Boolean deleteFile(String key) throws RuntimeException;

    /**
     * 获取文件外链访问地址
     * @param key 文件存储的相对路径，即 子文件夹/xx.mp4，由 upload 方法得到
     * @return 文件的外链访问地址
     */
    String getFileAskingPath(String key);

    /**
     * 检查文件是否存在于七牛云
     * @param key 文件的key
     * @return 文件信息，若为null代表不存在
     */
    FileInfo checkFile(String key);

    /**
     * 根据文件名查找key并得到外链地址
     * @param id 文件名
     * @return 文件外链访问地址
     */
    String searchById(String id);
}
