package com.ciyu.app.service.video;

import com.ciyu.app.util.QiniuKodoUtil;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;

import com.qiniu.util.Auth;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Objects;
import java.util.UUID;
import static com.ciyu.app.util.QiniuKodoUtil.getRandomFileName;

/**
 * @author: 短视频service
 * @create: 2023-11-03 15:29
 * @Description:
 */
@Service @RequiredArgsConstructor
public class VideoServiceImpl implements VideoService{
    @Autowired
    private Auth auth;

    @Autowired
    private UploadManager uploadManager;

    @Autowired
    private BucketManager bucketManager;

    @Autowired
    private QiniuKodoUtil qiniuKodoUtil;

    /**
     * @Description: 上传单个文件到七牛云存储空间
     * @param file  要上传的文件
     * @return 文件存储的相对路径
     */
    @Override
    public String uploadFile(MultipartFile file) throws RuntimeException, IOException {
        //获取原始文件名
        String originalFileName = Objects.requireNonNull(file.getOriginalFilename());
        //判断文件是否允许上传
        if (!isFileAllowed(originalFileName)) throw new IllegalArgumentException();
        //生成文件名-uuid
        String fileName = getRandomFileName(originalFileName);
        byte[] uploadBytes = file.getBytes();
        String upToken = auth.uploadToken(qiniuKodoUtil.bucket);
        // 文件存储路径：bucket/folder/date/uuid.mp4
        String key = qiniuKodoUtil.folder + "/" + QiniuKodoUtil.getTodayDate() + "/" + fileName;
        try {
            Response response = uploadManager.put(uploadBytes, key, upToken);
            // 解析上传成功的结果，获取存储地址key
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println("file key : " + putRet.key);
        } catch (QiniuException ex) {
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
            }
        }
        return key;
    }

    /**
     * @param key 文件的key，即存储地址 子文件夹/xx.mp4
     * @return 删除成功返回true, 否则抛出异常
     * @throws RuntimeException
     */
    @Override
    public Boolean deleteFile(String key) throws RuntimeException {
        if (Objects.isNull(checkFile(key))) {
            return true;
        } else {
            try {
                bucketManager.delete(qiniuKodoUtil.bucket, key);
                return true;
            } catch (QiniuException e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public FileInfo checkFile(String key) {
        FileInfo fileInfo = null;
        try {
            fileInfo = bucketManager.stat(qiniuKodoUtil.bucket, key);
        } catch (QiniuException ignored) {
            // ignore
        }
        return fileInfo;
    }

    /**
     * 判断文件是否被允许上传
     */
    private boolean isFileAllowed(String fileName) {
        // 获取后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        for (String allow : qiniuKodoUtil.allowed) {
            if (allow.equals(suffixName)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件外链访问地址
     * @param key 文件存储的相对路径，即 子文件夹/xx.mp4
     * @return 文件的外链访问地址
     */
    @Override
    public String getFileAskingPath(String key) {
     //   return qiniuKodoUtil.domain + "/" + filePath;
        String encodedFileName = null;
        String finalUrl = null;
        try {
            encodedFileName = URLEncoder.encode(key, "utf-8").replace("+", "%20");
            String publicUrl = String.format("%s/%s",  "http://" + qiniuKodoUtil.domain, encodedFileName);
            long expireInSeconds = 3600;    //1小时，自定义链接过期时间
            finalUrl = auth.privateDownloadUrl(publicUrl, expireInSeconds);
            System.out.println("final url : " + finalUrl);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return finalUrl;
    }

    @Override
    public String searchById(String id) {
        // TODO 这里还有问题
        BucketManager bucketManager = new BucketManager(auth, qiniuKodoUtil.cfg);
        try {
            FileInfo fileInfo = bucketManager.stat(qiniuKodoUtil.bucket, id);
            System.out.println(fileInfo.key);
            System.out.println(fileInfo.fsize);
            System.out.println(fileInfo.mimeType);
            System.out.println(fileInfo.putTime);
            return fileInfo.key;
        } catch (QiniuException ex) {
            System.err.println(ex.response.toString());
            return ex.response.toString();
        }
    }
}
