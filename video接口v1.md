# Pojo

### Video

短视频实体。标题，视频描述，视频transcript，时长等信息存储在es article中。

| Name        | Type          | Description             | Notes                                  |
| ----------- | ------------- | ----------------------- | -------------------------------------- |
| **id**      | String        | es中存储的视频id        | 同时作为云存储文件的唯一key与数据库key |
| userId      | String        | 上传者                  |                                        |
| path        | String        | 七牛云存储视频路径      | 源文件路径，不要通过这个链接访问       |
| cover       | String        | 七牛云存储封面路径      | 封面通过视频截帧获得                   |
| articleId   | String        | 对应描述性信息articleId |                                        |
| type        | Integer       | 所属类别                |                                        |
| view        | Long          | 浏览量                  |                                        |
| createdTime | LocalDatetime | 上传时间                |                                        |
| deleted     | boolean       | 是否删除                |                                        |

### VideoLike

用户like视频

| Name        | Type          | Description        | Notes |
| ----------- | ------------- | ------------------ | ----- |
| **videoId** | String        | 视频id             |       |
| **userId**  | String        | 点赞用户id         |       |
| likeTime    | LocalDatetime | 点赞时间           |       |
| deleted     | boolean       | 点赞状态，是否取消 |       |

### VideoCollect

用户收藏视频

| Name        | Type          | Description        | Notes |
| ----------- | ------------- | ------------------ | ----- |
| **videoId** | String        | 视频id             |       |
| **userId**  | String        | 收藏视频用户id     |       |
| collectTime | LocalDatetime | 收藏时间           |       |
| deleted     | boolean       | 收藏状态，是否取消 |       |

### VideoComment

用户评论视频

| Name        | Type          | Description            | Notes                      |
| ----------- | ------------- | ---------------------- | -------------------------- |
| **id**      | String        | 评论id                 |                            |
| superId     | String        | 上级评论id（回复评论） | 默认为null，即直接评论视频 |
| videoId     | String        | 视频id                 |                            |
| userId      | String        | 用户id                 |                            |
| content     | String        | 评论内容               |                            |
| commentTime | LocalDatetime | 评论时间               |                            |
| deleted     | boolean       | 评论状态，是否取消     |                            |

# VideoController

## 接口

| Method              | HTTP request                     | Description                          | Notes |
| ------------------- | -------------------------------- | ------------------------------------ | ----- |
| uploadVideo         | **POST**  /api/v1/video          | 上传单个短视频                       |       |
| getVideos           | **GET**  /api/v1/video/ids       | 获取videos的id列表（非推荐，仅按序） |       |
| getBestVideos       | **GET**  /api/v1/video/recommend | 获取推荐视频id列表                   |       |
| playVideo           | **GET**  /api/v1/video           | 播放特定id短视频                     |       |
| getClassifiedVideos | **GET**  /api/v1/video/list      | 视频内容分类页                       |       |
| searchVideos        | **GET**  /api/v1/video/search    | 根据关键字搜索videos                 |       |
| removeVideo         | **DELETE**  /api/v1/video        | 删除用户上传的某个视频               |       |

## uploadVideo

用户上传短视频文件到七牛云OSS，链接到数据库

### **POST**  /api/v1/video

### 参数

| Name        | Type   | Description                              | Notes                         |
| ----------- | ------ | ---------------------------------------- | ----------------------------- |
| user        | User   | 用户鉴权                                 |                               |
| file        | byte[] | 视频文件的字节流，便于存储时直接转码切片 | 直接传文件multipartfile也可以 |
| title       | String | 标题                                     |                               |
| description | String | 视频描述                                 |                               |

### 返回值

**UploadDto**。如果上传后不需要立刻访问，不要返回值也行。

| Name     | Type   | Description                                                  | Notes      |
| -------- | ------ | ------------------------------------------------------------ | ---------- |
| id       | String | 视频id                                                       |            |
| filePath | String | 七牛云私有空间文件云存储的外链访问地址，由返回的body解析key得到 | 源文件路径 |

## getVideos

分页缓存若干video的链接list，在上下滑动访问视频（非推荐机制）时使用该接口

### **GET**  /api/v1/video/ids

### 参数

| Name | Type    | Description | Notes                               |
| ---- | ------- | ----------- | ----------------------------------- |
| user | User    | 用户鉴权    |                                     |
| page | Integer | 当前页码    |                                     |
| size | Integer | 每页数量    |                                     |
| type | Integer | 视频类型    | 为0表示不分类，从全部项目list中获取 |

### 返回值

| Name | Type          | Description            | Notes                                         |
| ---- | ------------- | ---------------------- | --------------------------------------------- |
| ids  | List<Integer> | 当前页码videos的id列表 | 在实际访问到特定视频时再调用playvideo获取详情 |

## getBestVideos

基于推荐机制的视频list获取

### **GET**  /api/v1/video/recommend

### 参数

| Name             | Type         | Description                | Notes  |
| ---------------- | ------------ | -------------------------- | ------ |
| user             | User         | 用户，推荐基础             |        |
| pageable         | Pageable     | 分页查询                   |        |
| excludedVideoIds | List<String> | 根据用户最近浏览来过滤推荐 |        |
| source           | String       | 视频源，过滤指标           | 可为空 |

### 返回值

| Name | Type          | Description      | Notes                                         |
| ---- | ------------- | ---------------- | --------------------------------------------- |
| ids  | List<Integer> | 推荐视频的id列表 | 在实际访问到特定视频时再调用playvideo获取详情 |

## getClassifiedVideos

视频内容分类页，展示一组视频列表，涉及封面、标题、描述、浏览量等信息

### **GET**  /api/v1/video/list

### 参数

| Name | Type    | Description | Notes                           |
| ---- | ------- | ----------- | ------------------------------- |
| user | User    | 用户鉴权    |                                 |
| page | Integer | 当前页码    |                                 |
| size | Integer | 每页数量    |                                 |
| type | Integer | 视频类型    | 为0表示不分类，从全部项目中获取 |

### 返回值

**List<VideoInfoDto>**

| Name        | Type    | Description | Notes                          |
| ----------- | ------- | ----------- | ------------------------------ |
| video       | Video   | Video实体   |                                |
| article     | Article | Article实体 | 存储视频的文本信息如标题，介绍 |
| likes       | Integer | 点赞数      |                                |
| comments    | Integer | 评论数      |                                |
| collections | Integer | 收藏数      |                                |

## playVideo

播放特定的短视频

### **GET**  /api/v1/video

### 参数

| Name | Type   | Description | Notes |
| ---- | ------ | ----------- | ----- |
| user | User   |             |       |
| id   | String | 视频id      |       |

### 返回值

**VideoDto**

| Name          | Type          | Description   | Notes                                             |
| ------------- | ------------- | ------------- | ------------------------------------------------- |
| video         | Video         | Video实体     |                                                   |
| article         | Article         | Article实体     | 存储视频的文本信息如标题，介绍 |
| transcription | String        | 转写结果      | 从es中读取                                        |
| pieces        | Lisst<String> | 切片m3u8 list | 短视频（<15s），该属性为null，直接在video中读path |
| likes         | Integer       | 点赞数        |                                                   |
| comments      | Integer       | 评论数        |                                                   |
| collections   | Integer       | 收藏数        |                                                   |

## searchVideos

根据关键字搜索video

### **GET**  /api/v1/video/search

### 参数

| Name | Type    | Description | Notes |
| ---- | ------- | ----------- | ----- |
| user | User    |             |       |
| key  | String  | 搜索内容    |       |
| page | Integer | 划动页数    |       |
| size | Integer | 每页数量    |       |

### 返回值

**List<VideoInfoDto>**

| Name        | Type    | Description | Notes |
| ----------- | ------- | ----------- | ----- |
| video       | Video   | Video实体   |       |
| article         | Article         | Article实体     | 存储视频的文本信息如标题，介绍 |
| likes       | Integer | 点赞数      |       |
| comments    | Integer | 评论数      |       |
| collections | Integer | 收藏数      |       |

## removeVideo

用户删除个人上传的video（仅做flag，不删数据）

### DELETE  /api/v1/video

### 参数

| Name | Type   | Description | Notes |
| ---- | ------ | ----------- | ----- |
| user | User   |             |       |
| id   | String | 视频id      |       |

### 返回值

| Name | Type   | Description  | Notes |
| ---- | ------ | ------------ | ----- |
| res  | String | 删除提示信息 |       |

# HistoryController

## getVideoLikeHistories

用户个人点赞列表

## getVideoCollectionHistories

用户收藏

## getReplyHistories

回复用户的信息