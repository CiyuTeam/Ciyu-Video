package com.ciyu.app.util;
import com.ciyu.app.security.IgnoreSecurity;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.*;
import com.qiniu.storage.model.BatchStatus;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author: wyf
 * @create: 2023-11-03
 * @Description: 七牛云对象存储kodo配置与工具类
 */

@Component
public class QiniuKodoUtil {
    // 配置华东地区机房
    public Configuration cfg = new Configuration(Region.regionCnEast2());
    @Value("${qiniu.kodo.accessKey}")
    public String accessKey;
    @Value("${qiniu.kodo.secretKey}")
    public String secretKey;
    @Value("${qiniu.kodo.bucket}")
    public String bucket;      // 存储空间
    @Value("${qiniu.kodo.domain}")
    public String domain;      // 域名
    @Value("${qiniu.file.allowed}")
    public String[] allowed; // 允许的扩展名
    public String folder = "video";
    /**
     * 文件名前缀
     */
    String prefix = "";
    /**
     * 每次迭代的长度限制，最大1000，推荐值 1000
     */
    int limit = 1000;
    /**
     * 指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
     */
    String delimiter = "";

    /*
    构建一个七牛上传工具实例
    */
    @Bean
    public UploadManager uploadManager() {
        return new UploadManager(cfg);
    }

    /*
     认证信息实例
     */
    @Bean
    public Auth auth() {
        return Auth.create(accessKey, secretKey);
    }

    /*
     构建七牛空间管理实例
     */
    @Bean
    public BucketManager bucketManager(Auth auth) {
        return new BucketManager(auth, cfg);
    }

    /**
     * 生成文件的唯一key（uuid），作为七牛云存储key 及 数据库存储id
     * @param fileName 原文件名
     * @return 云服务器存储用的文件名（唯一key）
     */
    public static String getRandomFileName(String fileName) throws IllegalArgumentException {
        int index = fileName.lastIndexOf(".");
        // 校验文件名合法 eg : xx.mp4
        if (fileName.isEmpty() || index == -1) {
            throw new IllegalArgumentException();
        }
        // 获取文件后缀
        String suffix = fileName.substring(index).toLowerCase();
        // 生成UUID
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        // 拼接新的名称：uuid.mp4
        return uuid + suffix;
    }

    /**
     * 列举空间文件列表
     */
    @IgnoreSecurity
    public List<String> listSpaceFiles() throws QiniuException {
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(bucket, prefix, limit, delimiter);
        List<String> res = new ArrayList<>();
        String str = "";

        while (fileListIterator.hasNext()) {
            //处理获取的file list结果
            FileInfo[] items = fileListIterator.next();
            for (FileInfo item : items) {
                str = item.key + ", " + item.fsize / 1024 + "kb" + ", " + item.mimeType;
                System.out.println(str);
                res.add(str);
            }
        }
        return res;
    }

    /**
     * 批量删除空间中的文件
     * @param fileList 文件名称列表 -- 子目录/xx.mp4
     * @return 删除数量
     */
    public int deleteFile(String[] fileList) {
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        int res = 0;
        try {
            //单次批量请求的文件数量不得超过1000
            BucketManager.BatchOperations batchOperations = new BucketManager.BatchOperations();
            batchOperations.addDeleteOp(bucket, fileList);
            Response response = bucketManager.batch(batchOperations);
            BatchStatus[] batchStatusList = response.jsonToObject(BatchStatus[].class);
            for (int i = 0; i < fileList.length; i++) {
                BatchStatus status = batchStatusList[i];
                String key = fileList[i];
                System.out.print(key + "\t");
                if (status.code == 200)
                    res++;
            }
        } catch (QiniuException ex) {
            System.err.println(ex.response.toString());
        }
        return res;
    }

    public static String getTodayDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        return simpleDateFormat.format(new Date());
    }
}
