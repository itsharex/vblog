/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : 110.42.224.240:3306
 Source Schema         : vblog

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 30/08/2022 01:05:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `BLOB_DATA`     blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `CALENDAR`      blob                                                          NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TIME_ZONE_ID`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.ArticleCountJob', 'Article', '0 0 12 * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.HelloJob', 'Hello', '0/2 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ENTRY_ID`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `TRIGGER_NAME`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `FIRED_TIME`        bigint(13)                                                    NOT NULL,
    `SCHED_TIME`        bigint(13)                                                    NOT NULL,
    `PRIORITY`          int(11)                                                       NOT NULL,
    `STATE`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `DESCRIPTION`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `JOB_CLASS_NAME`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `IS_DURABLE`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `IS_UPDATE_DATA`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `JOB_DATA`          blob,
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.ArticleCountJob', 'Article', NULL, 'com.jzj.vblog.job.ArticleCountJob',
        '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `QRTZ_JOB_DETAILS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.HelloJob', 'Hello', NULL, 'com.jzj.vblog.job.HelloJob', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`
(
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `LOCK_NAME`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS`
VALUES ('VblogScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `LAST_CHECKIN_TIME` bigint(13)                                                    NOT NULL,
    `CHECKIN_INTERVAL`  bigint(13)                                                    NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `REPEAT_COUNT`    bigint(7)                                                     NOT NULL,
    `REPEAT_INTERVAL` bigint(12)                                                    NOT NULL,
    `TIMES_TRIGGERED` bigint(10)                                                    NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `STR_PROP_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `STR_PROP_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `STR_PROP_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `INT_PROP_1`    int(11)                                                       DEFAULT NULL,
    `INT_PROP_2`    int(11)                                                       DEFAULT NULL,
    `LONG_PROP_1`   bigint(20)                                                    DEFAULT NULL,
    `LONG_PROP_2`   bigint(20)                                                    DEFAULT NULL,
    `DEC_PROP_1`    decimal(13, 4)                                                DEFAULT NULL,
    `DEC_PROP_2`    decimal(13, 4)                                                DEFAULT NULL,
    `BOOL_PROP_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL,
    `BOOL_PROP_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`
(
    `SCHED_NAME`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_NAME`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `TRIGGER_GROUP`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `JOB_NAME`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `JOB_GROUP`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `DESCRIPTION`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `NEXT_FIRE_TIME` bigint(13)                                                    DEFAULT NULL,
    `PREV_FIRE_TIME` bigint(13)                                                    DEFAULT NULL,
    `PRIORITY`       int(11)                                                       DEFAULT NULL,
    `TRIGGER_STATE`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `TRIGGER_TYPE`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `START_TIME`     bigint(13)                                                    NOT NULL,
    `END_TIME`       bigint(13)                                                    DEFAULT NULL,
    `CALENDAR_NAME`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `MISFIRE_INSTR`  smallint(2)                                                   DEFAULT NULL,
    `JOB_DATA`       blob,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX `SCHED_NAME` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.ArticleCountJob', 'Article', 'com.jzj.vblog.job.ArticleCountJob',
        'Article', NULL, 1661832000000, 1661745600000, 5, 'WAITING', 'CRON', 1661255313000, 0, NULL, 0, '');
INSERT INTO `QRTZ_TRIGGERS`
VALUES ('VblogScheduler', 'com.jzj.vblog.job.HelloJob', 'Hello', 'com.jzj.vblog.job.HelloJob', 'Hello', NULL,
        1661249656000, 1661249654000, 5, 'PAUSED', 'CRON', 1661170536000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`
(
    `id`           bigint(11) UNSIGNED ZEROFILL                                  NOT NULL AUTO_INCREMENT,
    `username`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `password`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `phone`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `avatar`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
    `create_time`  datetime(0)                                                   NOT NULL,
    `update_time`  datetime(0)                                                   NOT NULL,
    `roles`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `introduction` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '管理员用户表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user`
VALUES (00000000001, 'admin', '9bda42f78a579ca9e9397936c9558338', '18176702572',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/adminAvatar/2022/08/19/80b086d23aac408c95517bd5ebc4eea3.jpg',
        '2022-06-07 15:06:24', '2022-08-19 15:18:37', 'admin', 'I am a super administrator');

-- ----------------------------
-- Table structure for article_content
-- ----------------------------
DROP TABLE IF EXISTS `article_content`;
CREATE TABLE `article_content`
(
    `id`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容id',
    `content`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文章内容',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '文章内容'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_content
-- ----------------------------
INSERT INTO `article_content`
VALUES ('0c5081f8f05d8d74ea7e33a3bba20898',
        '#### [27. 移除元素](https://leetcode-cn.com/problems/remove-element/)\n\n**题目描述**\n\n> 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\n>\n> 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。\n>\n> 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。\n\n**示例 1:**\n\n> 给定 nums = [3,2,2,3], val = 3,\n>\n> 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。\n>\n> 你不需要考虑数组中超出新长度后面的元素。\n\n**示例 2:**\n\n> 给定 nums = [0,1,2,2,3,0,4,2], val = 2,\n>\n> 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。\n>\n> 注意这五个元素可为任意顺序。\n>\n> 你不需要考虑数组中超出新长度后面的元素。\n\n**暴力法**\n\n**解析**\n\n该题目也算是简单题目，适合新手来做，然后大家也不要看不起暴力解法，我们可以先写出暴力解法，然后再思考其他方法，这对于我们的编码能力有很大的帮助。我们来解析一下这个题目的做题思路，他的含义就是让我们删除掉数组中的元素，然后将数组后面的元素跟上来。最后返回删除掉元素的数组长度即可。比如数组长度为 10，里面有 2 个目标值，我们最后返回的长度为 8，但是返回的 8 个元素，需要排在数组的最前面。那么暴力解法的话则就需要两个 for 循环，一个用来找到删除，另一个用来更新数组。\n\n![移除数组元素暴力法](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/移除数组元素.lhuefelqd5o.png)\n\n总体思路就是这样的，后面的会不断往前覆盖。暴力解法也是不超时的，实现也不算太简单主要需要注意两个地方。\n\n（1）需要先定义变量 len 获取数组长度，因为后面我们的返回的数组长度是改变的，所以不可以用 nums.length 作为上界\n\n（2）我们每找到一个需要删除的值的时候，需要 i--，防止出现多个需要删除的值在一起的情况，然后漏删。\n\n**题目代码**\n\nJava Code:\n\n```java\nclass Solution {\n    public int removeElement(int[] nums, int val) {\n        //获取数组长度\n        int len = nums.length;\n        if (len == 0) {\n            return 0;\n        }\n        int i = 0;\n        for (i = 0; i < len; ++i) {\n            //发现符合条件的情况\n            if (nums[i] == val) {\n                //前移一位\n                for (int j = i; j < len-1; ++j) {\n                    nums[j] = nums[j+1];\n                }\n                i--;\n                len--;\n            }\n        }\n        return i;\n    }\n}\n```\n\nPython3 Code:\n\n```python\nfrom typing import List\nclass Solution:\n    def removeElement(self, nums: List[int], val: int)->int:\n        # 获取数组长度\n        leng = len(nums)\n        if 0 == leng:\n            return 0\n        i = 0\n        while i < leng:\n            # 发现符合条件的情况\n            if nums[i] == val:\n                # 前移一位\n                for j in range(i, leng - 1):\n                    nums[j] = nums[j + 1]\n                i -= 1\n                leng -= 1\n            i += 1\n        return i\n```\n\n**双指针**\n\n快慢指针的做法比较有趣，只需要一个 for 循环即可解决，时间复杂度为 O(n) ,总体思路就是有两个指针，前面一个后面一个，前面的用于搜索需要删除的值，当遇到需要删除的值时，前指针直接跳过，后面的指针不动，当遇到正常值时，两个指针都进行移动，并修改慢指针的值。最后只需输出慢指针的索引即可。\n\n**动图解析:**\n\n![](https://img-blog.csdnimg.cn/20210317194638700.gif#pic_center)\n\n**题目代码：**\n\nJava Code:\n\n```java\nclass Solution {\n    public int removeElement(int[] nums, int val) {\n          int len = nums.length;\n          if (len == 0) {\n              return 0;\n          }\n          int i = 0;\n          for (int j = 0; j < len; ++j) {\n                //如果等于目标值，则删除\n                if (nums[j] == val) {\n                    continue;\n                }\n                // 不等于目标值时，则赋值给nums[i],i++\n                nums[i++] = nums[j];\n          }\n          return i;\n    }\n}\n```\n\nPython3 Code:\n\n```python\nclass Solution:\n    def removeElement(self, nums: List[int], val: int) -> int:\n        i = 0\n        for j in range(len(nums)):\n            if nums[j] != val:\n                nums[i] = nums[j]\n                i += 1\n        return i\n```\n\nC++ Code:\n\n```cpp\nclass Solution {\npublic:\n    int removeElement(vector<int>& nums, int val) {\n        int n = nums.size();\n      	if(!n) return 0;\n      	int i = 0;\n      	for(int j = 0; j < n; ++j){\n          if(nums[j] == val) continue;\n          nums[i++] = nums[j];\n        }\n      	return i;\n    }\n};\n```\n\nSwift Code\n\n```swift\nclass Solution {\n    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {\n        if nums.count == 0 {\n            return 0\n        }\n        var i = 0\n        for j in 0..<nums.count {\n            if nums[j] != val {\n                nums[i] = nums[j]\n                i += 1\n            }\n\n        }\n        return i\n    }\n}\n```\n\nGo Code:\n\n```go\nfunc removeElement(nums []int, val int) int {\n    length := len(nums)\n    if length == 0 {\n        return 0\n    }\n    i := 0\n    for j := 0; j < length; j++ {\n        if nums[j] == val {\n            continue\n        }\n        nums[i] = nums[j]\n        i++\n    }\n    return i\n}\n```',
        '2022-08-26 15:05:17', '2022-08-26 15:52:49');
INSERT INTO `article_content`
VALUES ('0ee59e9f57979176ca917161eb527eda',
        '::: hljs-center\n\n# LockSupport\n\n\n:::\n## LockSupport是什么\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\n\n\n==下面这句话，后面详细说==\n\nLockSupport中的park()和unpark()的作用分别是阻塞线程和解除阻塞线程。\n\n## 线程等待唤醒机制\n\n### 3种让线程等待和唤醒的方法\n1. 使用Object中的wait()方法让线程等待，使用Object中的notify()方法唤醒线程。\n2. 使用JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程。\n3. LockSupport类可以阻塞当前线程以及唤醒指定被阻塞的线程。\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png)\n\n:::\n\n\n### Object 类中的wait和notify方法实现线程等待和唤醒\n\n```java\npublic static void main(String[] args) throws InterruptedException {\n        Object objectLock = new Object();\n        new Thread(()->{\n            synchronized(objectLock){\n                System.out.println(Thread.currentThread().getName()+\"\\t----come in\");\n                try {\n                    objectLock.wait();\n                } catch (InterruptedException e) {\n                    throw new RuntimeException(e);\n                }\n                System.out.println(Thread.currentThread().getName()+\"\\t----被唤醒\");\n            }\n        },\"t1\").start();\n\n        TimeUnit.SECONDS.sleep(1);\n\n        new Thread(()->{\n            synchronized(objectLock){\n                    objectLock.notify();\n                System.out.println(Thread.currentThread().getName()+\"\\t----发出通知\");\n            }\n        },\"t2\").start();\n    }\n```\n==正常情况输出：==\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png)\n\n:::\n\n==异常情况1:==\n去掉synchronized后抛出\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png)\n\n:::\n\n得出wait关键字必须在synchronized里使用。\n\n==异常情况2:==\n先执行notify后执行wait会导致程序无法被唤醒。\n\n**总结：wait和notify方法必须要在同步块或者方法里面，且成对出现使用，先wait后notify才ok。**\n\n### JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程\n```java\npublic static void main(String[] args) throws InterruptedException {\n        ReentrantLock lock = new ReentrantLock();\n        Condition condition = lock.newCondition();\n        new Thread(()->{\n            lock.lock();\n            try {\n                System.out.println(Thread.currentThread().getName()+\"\\t----come in\");\n                condition.await();\n                System.out.println(Thread.currentThread().getName()+\"\\t----被唤醒\");\n            } catch (InterruptedException e) {\n                throw new RuntimeException(e);\n            } finally {\n                lock.unlock();\n            }\n        },\"t1\").start();\n\n        TimeUnit.SECONDS.sleep(1);\n\n        new Thread(()->{\n            lock.lock();\n            try {\n                condition.signal();\n                System.out.println(Thread.currentThread().getName()+\"\\t----发出通知\");\n            }finally {\n                lock.unlock();\n            }\n        },\"t2\").start();\n    }\n```\n==正常情况输出：==\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/22d93f41bd1b4306a76ff6b2a6ed32ac.png)\n\n:::\n==异常情况1:==\n去掉lock，unlock\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/1ec256d2da4a4b6ba657ceb49c006d55.png)\n\n:::\n==异常情况2:==\n先signal后await会导致程序无法被唤醒。\n\n**总结:Condition中的线程等待和唤醒方法，需要先获取锁，一定要先await后signal,不要反了。**\n\n### 上述两个对象Object和Condition使用的限制条件\n\n1. 线程先要获得并持有锁。\n2. 必须要先等待后唤醒。\n\n### LockSupport类中的park等待和unpark唤醒\n通过park() 和unpark(thread)方法来实现阻塞和唤醒线程的操作。\n==官方解释:==\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/dbfc16ffcea44e9ea5f7b90207e03686.png)\n\n:::\n\n```java\npublic static void main(String[] args) throws InterruptedException {\n        Thread t1 = new Thread(() -> {\n            System.out.println(Thread.currentThread().getName() + \"\\t----come in\");\n            LockSupport.park();\n            System.out.println(Thread.currentThread().getName() + \"\\t----被唤醒\");\n        }, \"t1\");\n        t1.start();\n\n        TimeUnit.SECONDS.sleep(1);\n\n        new Thread(()->{\n            LockSupport.unpark(t1);\n            System.out.println(Thread.currentThread().getName()+\"\\t----发出通知\");\n        },\"t2\").start();\n    }\n```\n正常+无锁块要求，之前错误的先唤醒后等待，LockSupport照样支持。\n::: hljs-center\n\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/6c87ccee606b4cf1b82f40b6a8c22bb1.png)\n\n:::\n**==重点说明（重要）==**\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\n\nLockSupport是一个线程阻塞工具类，所有的方法都是静态方法，可以让线程在任意位置阻塞，阻塞之后也有对应的唤醒方法。归根结底，LockSupport调用的Unsafe中的native方法。\n\nLockSupport提供park() 和unpark()方法实现阻塞线程和解除线程阻塞的过程\nLockSupport和每个使用它的线程都有一个许可（permit）关联。\n每个线程都有一个相关的permit,permit最多只有一个，重复调用unpark也不会积累凭证。\n\n==形象的理解==\n线程阻塞需要消耗凭证，这个凭证最多只有一个。\n当调用park方法是\n1. 如果有凭证，则会直接消耗掉这个凭证然后正常退出。\n2. 如果无凭证，就必须阻塞等待凭证可用。\n而unpark则相反，它会增加一个凭证，当凭证最多只能有一个，累加无效。\n\n### 面试题\n1. 为什么可以突破wait/notify的原有调用顺序\n因为unpark获得了一个凭证，之后再调用park方法，就可以名正言顺的凭证消费，故不会阻塞。\n2. 为什么唤醒两次后阻塞两次，但最终结果还会阻塞？\n因为凭证的数量最多为1，连续调用两次unpark和调用一次unpark效果一样，只会增加一个凭证，而调用两次park却需要消费两个凭证，证不够，不能放行。\n\n',
        '2022-08-29 17:27:16', '2022-08-29 19:00:57');
INSERT INTO `article_content`
VALUES ('444709ddbb995036803ccf9e2ac9a3e8',
        '# 一、使用SDK\n在OSS的概览页右下角找到“Bucket管理”，点击“OSS学习路径”\n![image.png](https://cdn.nlark.com/yuque/0/2021/png/12444520/1618982109968-1208fb0f-09e5-443d-9c98-30a252a56329.png#align=left&display=inline&height=305&margin=%5Bobject%20Object%5D&name=image.png&originHeight=305&originWidth=316&size=11012&status=done&style=none&width=316)\n点击“Java SDK”进入SDK开发文档\n![image.png](https://cdn.nlark.com/yuque/0/2021/png/12444520/1618982120766-5b7dfbe7-cddb-4029-99da-af4c92cc2f7a.png#align=left&display=inline&height=189&margin=%5Bobject%20Object%5D&name=image.png&originHeight=189&originWidth=617&size=19492&status=done&style=none&width=617)\n# 二、创建测试项目\n## 1、创建Maven项目\ncom.atguigu\naliyun-oss\n## 2、配置pom\n![image.png](https://cdn.nlark.com/yuque/0/2021/png/12444520/1618982135810-eec1a8aa-8c04-4e89-8f78-7c5ca6c43579.png#align=left&display=inline&height=255&margin=%5Bobject%20Object%5D&name=image.png&originHeight=255&originWidth=210&size=4921&status=done&style=none&width=210)\n```java\n<dependencies>\n    <!--aliyunOSS-->\n    <dependency>\n        <groupId>com.aliyun.oss</groupId>\n        <artifactId>aliyun-sdk-oss</artifactId>\n        <version>3.10.2</version>\n    </dependency>\n    <dependency>\n        <groupId>junit</groupId>\n        <artifactId>junit</artifactId>\n        <version>4.12</version>\n    </dependency>\n</dependencies>\n```\n# 三、测试用例\n## 1、创建Bucket\n![image.png](https://cdn.nlark.com/yuque/0/2021/png/12444520/1618982165194-c9829775-e982-48ce-9e8f-80e84c8100e1.png#align=left&display=inline&height=181&margin=%5Bobject%20Object%5D&name=image.png&originHeight=181&originWidth=162&size=3025&status=done&style=none&width=162)\n```java\npackage com.atguigu.aliyunoss;\npublic class OSSTest {\n    // Endpoint以杭州为例，其它Region请按实际情况填写。\n    String endpoint = \"your endpoint\";\n    // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建RAM账号。\n    String accessKeyId = \"your accessKeyId\";\n    String accessKeySecret = \"your accessKeySecret\";\n    String bucketName = \"srb-file\";\n    @Test\n    public void testCreateBucket() {\n        \n        // 创建OSSClient实例。\n        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);\n        // 创建存储空间。\n        ossClient.createBucket(bucketName);\n        // 关闭OSSClient。\n        ossClient.shutdown();\n    }\n}\n```\n## 2、判断bucket是否存在\n```java\n@Test\npublic void testExist() {\n    // 创建OSSClient实例。\n    OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);\n    boolean exists = ossClient.doesBucketExist(bucketName);\n    System.out.println(exists);\n    // 关闭OSSClient。\n    ossClient.shutdown();\n}\n```\n## 3、设置bucket访问权限\n```java\n@Test\npublic void testAccessControl() {\n    // 创建OSSClient实例。\n    OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);\n    // 设置存储空间的访问权限为：公共读。\n    ossClient.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);\n    // 关闭OSSClient。\n    ossClient.shutdown();\n}\n```\n',
        '2022-08-19 15:58:19', '2022-08-19 19:05:22');
INSERT INTO `article_content`
VALUES ('5190b3e11fac608dd2c1a8834a2e00b5',
        '#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\n\n**题目描述：**\n\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\n>\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\n\n**示例:**\n\n> 给定 nums = [2, 7, 11, 15], target = 9\n>\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\n> 所以返回 [0, 1]\n\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\n\n**双指针（暴力）法**\n\n**解析**\n\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\n\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\n\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\n\n**题目代码**\n\nJava Code:\n\n```java\nclass Solution {\n    public int[] twoSum(int[] nums, int target) {\n        if(nums.length < 2){\n            return new int[0];\n        }\n        int[] rearr = new int[2];\n        //查询元素\n        for(int i = 0; i < nums.length; i++){\n            for(int j = i+1; j < nums.length; j++ ){\n                //发现符合条件情况\n                if(nums[i] + nums[j] ==target){\n                    rearr[0] = i;\n                    rearr[1] = j;\n                }\n            }\n        }\n        return rearr;\n    }\n}\n```\n\n\n**哈希表**\n\n**解析**\n\n哈希表的做法很容易理解，我们只需通过一次循环即可，假如我们的 target 值为 9，当前指针指向的值为 2 ，我们只需从哈希表中查找是否含有 7，因为 9 - 2 =7 。如果含有 7 我们直接返回即可，如果不含有则将当前的 2 存入哈希表中，指针移动，指向下一元素。注： key 为元素值，value 为元素索引。\n\n**动图解析：**\n\n![两数之和](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/两数之和.7228lcxkqpw0.gif)\n\n是不是很容易理解，下面我们来看一下题目代码。\n\n**题目代码：**\n\nJava Code:\n\n```java\nclass Solution {\n    public int[] twoSum(int[] nums, int target) {\n        HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();\n        for(int i = 0; i < nums.length; i++){\n            //如果存在则返回\n            if(map.containsKey(target-nums[i])){\n                return new int[]{map.get(target-nums[i]),i};\n            }\n            //不存在则存入\n            map.put(nums[i],i);\n\n        }\n        return new int[0];\n\n    }\n}\n```',
        '2022-08-26 14:23:13', '2022-08-26 15:50:56');
INSERT INTO `article_content`
VALUES ('5d2bfbfc022be8f6efed090aecc200b3',
        ' \r\n\r\n\r\n\r\n# **分布式事务专题**\r\n\r\n课件地址：https://download.csdn.net/download/hancoder/22307203\r\n\r\n在视频评论区也有https://www.bilibili.com/video/BV1FJ411A7mV\r\n\r\n学习要点：\r\n\r\n- 四种事务：2PC、TCC、可靠消息、尽最大努力通知\r\n- 事务undo_log、全局事务ID、幂等性、MQ半消息\r\n\r\n# 一、基础概念\r\n\r\n## 1.1 .什么是事务\r\n\r\n什么是事务？举个生活中的例子：你去小卖铺买东西，“一手交钱，一手交货”就是一个事务的例子，交钱和交货必须全部成功，事务才算成功，任一个活动失败，事务将撤销所有已成功的活动。\r\n\r\n明白上述例子，再来看事务的定义：\r\n\r\n事务可以看做是一次大的活动，它由不同的小活动组成，这些活动要么全部成功，要么全部失败。\r\n\r\n \r\n\r\n1.2 .本地事务\r\n\r\n在计算机系统中，更多的是通过关系型数据库来控制事务，这是利用数据库本身的事务特性来实现的，因此叫数据库事务，由于应用主要靠关系数据库来控制事务，而数据库通常和应用在同一个服务器，所以基于关系型数据库的事务又被称为本地事务。\r\n\r\n回顾一下数据库事务的四大特性 ACID：\r\n\r\n- A（Atomic）：原子性，构成事务的所有操作，要么都执行完成，要么全部不执行，不可能出现部分成功部分失败的情况。\r\n- C（Consistency）：一致性，在事务执行前后，数据库的一致性约束没有被破坏。比如：张三向李四转100元，转账前和转账后的数据是正确状态这叫一致性，如果出现张三转出100元，李四账户没有增加100元这就出现了数据错误，就没有达到一致性。\r\n- I（Isolation）：隔离性，数据库中的事务一般都是并发的，隔离性是指并发的两个事务的执行互不干扰，一个事务不能看到其他事务运行过程的中间状态。通过配置事务隔离级别可以避脏读、重复读等问题。\r\n- D（Durability）：持久性，事务完成之后，该事务对数据的更改会被持久化到数据库，且不会被回滚。\r\n\r\n 数据库事务在实现时会将一次事务涉及的所有操作全部纳入到一个不可分割的执行单元，该执行单元中的所有操作要么都成功，要么都失败，只要其中任一操作执行失败，都将导致整个事务的回滚\r\n\r\n## 1.3 .分布式事务\r\n\r\n随着互联网的快速发展，软件系统由原来的单体应用转变为分布式应用\r\n\r\n\r\n\r\n分布式系统会把一个应用系统拆分为可独立部署的多个服务，因此需要服务与服务之间远程协作才能完成事务操作，这种分布式系统环境下由不同的服务之间通过网络远程协作完成事务称之为**分布式事务**，例如用户注册送积分事务、创建订单减库存事务，银行转账事务等都是分布式事务。\r\n\r\n \r\n\r\n我们知道本地事务依赖数据库本身提供的事务特性来实现，因此以下逻辑可以控制本地事务：\r\n\r\n```\r\nbegin transation;\r\n// 1.本地数据库操作：张三减少金额\r\n// 2.本地数据库操作：李四增加金额\r\ncommit transation;\r\n```\r\n\r\n但是在分布式环境下，会变成下边这样：\r\n\r\n```\r\nbegin transation;\r\n// 1.本地数据库操作：张三减少金额\r\n// 2.远程调用：李四增加金额\r\ncommit transation;\r\n```\r\n\r\n可以设想，当远程调用让李四增加金额成功了，由于网络问题远程调用并没有返回，此时本地事务提交失败就回滚了张三减少金额的操作，此时张三和李四的数据就不一致了。\r\n\r\n因此在分布式架构的基础上，传统数据库事务就无法使用了，张三和李四的账户不在一个数据库中甚至不在一个应用系统里，实现转账事务需要通过远程调用，由于网络问题就会导致分布式事务问题。\r\n\r\n## 1.4  分布式事务产生的场景\r\n\r\n1、典型的场景就是微服务架构 微服务之间通过远程调用完成事务操作。 比如：订单微服务和库存微服务，下单的同时订单微服务请求库存微服务减库存。 简言之：跨JVM进程产生分布式事务。\r\n\r\n2、单体系统访问多个数据库实例 当单体系统需要访问多个数据库（实例）时就会产生分布式事务。 比如：用户信息和订单信息分别在两个MySQL实例存储，用户管理系统删除用户信息，需要分别删除用户信息及用户的订单信息，由于数据分布在不同的数据实例，需要通过不同的数据库链接去操作数据，此时产生分布式事务。 简言之：跨数据库实例产生分布式事务。\r\n\r\n3、多服务访问同一个数据库实例 比如：订单微服务和库存微服务即使访问同一个数据库也会产生分布式事务，原因就是跨JVM进程，两个微服务持有了不同的数据库链接进行数据库操作，此时产生分布式事务。\r\n\r\n#  2.分布式事务基础理论\r\n\r\n通过前面的学习，我们了解到了分布式事务的基础概念。与本地事务不同的是，分布式系统之所以叫分布式，是因为提供服务的各个节点分布在不同机器上，相互之间通过网络交互。不能因为有一点网络问题就导致整个系统无法提供服务，网络因素成为了分布式事务的考量标准之一。因此，分布式事务需要更进一步的理论支持，接下来，我们先来学习一下分布式事务的CAP理论。\r\n\r\n在讲解分布式事务控制解决方案之前需要先学习一些基础理论，通过理论知识指导我们确定分布式事务控制的目标，从而帮助我们理解每个解决方案。\r\n\r\n## 2.1.  CAP理论\r\n\r\n2.1.1.理解CAP\r\n\r\nCAP是 Consistency、Availability、Partition tolerance三个词语的缩写，分别表示一致性、可用性、分区容忍性。\r\n\r\n- 一致性（consistency）\r\n  在分布式系统中的所有数据备份，在同一时刻是否同样的值。（等同于所有节点访问同一份最新的数据副本）\r\n- 可用性（Availability）\r\n  在集群中一部分节点故障后，集群整体是否还能响应客户端的读写请求。（对数据更新具备高可用性）\r\n- 分区容惜性（Partitiontolerance）\r\n  - 大多数分布式系统都分布在多个子网络。每个子网络就叫做一个区(partition)。\r\n    分区容错的意思是，区间通信可能失败。比如，一台服务器放在中国，另一台服务器放在美国，这就是两个区，它们之间可能无法通信。\r\n\r\nCAP原则指的是，这三个要素最多只能同时实现两点，不可能三者兼顾\r\n\r\n- CP要求一致性（有一个没同步好就不可用）\r\n- AP要求高可用\r\n\r\n下边我们分别来解释：\r\n\r\n\r\n为了方便对CAP理论的理解，我们结合电商系统中的一些业务场景来理解CAP。如下图，是商品信息管理的执行流程：\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/3b3dbc4e0bc54b41a7a118c23db514ec.png\" style=\"zoom:50%;\" />\r\n\r\n整体执行流程如下：\r\n\r\n1、商品服务请求主数据库写入商品信息（添加商品、修改商品、删除商品）\r\n\r\n2、主数据库向商品服务响应写入成功。\r\n\r\n3、商品服务请求从数据库读取商品信息。\r\n\r\n \r\n\r\n#### C - Consistency：\r\n\r\n一致性是指写操作后的读操作可以读取到最新的数据状态，当数据分布在多个节点上，从任意结点读取到的数据都是最新的状态。\r\n\r\n上图中，商品信息的读写要满足一致性就是要实现如下目标：\r\n\r\n1、商品服务写入主数据库成功，则向从数据库查询新数据也成功。\r\n\r\n2、商品服务写入主数据库失败，则向从数据库查询新数据也失败。如何实现一致性？\r\n\r\n1、写入主数据库后要将数据同步到从数据库。\r\n\r\n2、写入主数据库后，在向从数据库同步期间要将从数据库锁定，待同步完成后再释放锁，以免在新数据写入成功后，向从数据库查询到旧的数据。\r\n\r\n分布式系统一致性的特点：\r\n\r\n1、由于存在数据同步的过程，写操作的响应会有一定的延迟。\r\n\r\n2、为了保证数据一致性会对资源暂时锁定，待数据同步完成释放锁定资源。\r\n\r\n3、如果请求数据同步失败的结点则会返回错误信息，一定不会返回旧数据。\r\n\r\n \r\n\r\n#### A - Availability ：\r\n\r\n可用性是指任何事务操作都可以得到响应结果，且不会出现响应超时或响应错误。上图中，商品信息读取满足可用性就是要实现如下目标：\r\n\r\n1、从数据库接收到数据查询的请求则立即能够响应数据查询结果。\r\n\r\n2、从数据库不允许出现响应超时或响应错误。如何实现可用性？\r\n\r\n1、写入主数据库后要将数据同步到从数据库。\r\n\r\n2、由于要保证从数据库的可用性，不可将从数据库中的资源进行锁定。\r\n\r\n3、即时数据还没有同步过来，从数据库也要返回要查询的数据，哪怕是旧数据，如果连旧数据也没有则可以按照约定返回一个默认信息，但不能返回错误或响应超时。\r\n\r\n分布式系统可用性的特点：\r\n\r\n1、  所有请求都有响应，且不会出现响应超时或响应错误。\r\n\r\n \r\n\r\n#### P - Partition tolerance ：\r\n\r\n通常分布式系统的各各结点部署在不同的子网，这就是网络分区，不可避免的会出现由于网络问题而导致**结点之间通信失败**，此时仍可对外提供服务，这叫分区容忍性。\r\n\r\n上图中，商品信息读写满足分区容忍性就是要实现如下目标：\r\n\r\n1、主数据库向从数据库同步数据失败不影响读写操作。\r\n\r\n2、其一个结点挂掉不影响另一个结点对外提供服务。如何实现分区容忍性？\r\n\r\n1、尽量使用异步取代同步操作，例如使用异步方式将数据从主数据库同步到从数据，这样结点之间能有效的实现松耦合。\r\n\r\n2、添加从数据库结点，其中一个从结点挂掉其它从结点提供服务。分布式分区容忍性的特点：\r\n\r\n1、分区容忍性分是布式系统具备的基本能力。\r\n\r\n \r\n\r\n### 2.1.2 CAP组合方式\r\n\r\n\r\n\r\n1、上边商品管理的例子是否同时具备 CAP呢？\r\n\r\n在所有分布式事务场景中不会同时具备CAP三个特性，因为在具备了P的前提下C和A是不能共存的。比如：\r\n\r\n下图满足了P即表示实现分区容忍：\r\n\r\n![请添加图片描述](https://img-blog.csdnimg.cn/3b3dbc4e0bc54b41a7a118c23db514ec.png)\r\n\r\n\r\n\r\n本图分区容忍的含义是：\r\n\r\n1）主数据库通过网络向从数据同步数据，可以认为主从数据库部署在不同的分区，通过网络进行交互。\r\n\r\n2）当主数据库和从数据库之间的网络出现问题不影响主数据库和从数据库对外提供服务。\r\n\r\n3）其一个结点挂掉不影响另一个结点对外提供服务。\r\n\r\n如果要实现C则必须保证数据一致性，在数据同步的时候为防止向从数据库查询不一致的数据则需要将从数据库数据锁定，待同步完成后解锁，如果同步失败从数据库要返回错误信息或超时信息。\r\n\r\n如果要实现A则必须保证数据可用性，不管任何时候都可以向从数据查询数据，则不会响应超时或返回错误信息。通过分析发现在满足P的前提下C和A存在矛盾性。\r\n\r\n2、CAP有哪些组合方式呢？\r\n\r\n所以在生产中对分布式事务处理时要根据需求来确定满足CAP的哪两个方面。\r\n\r\n1） AP：\r\n\r\n放弃一致性，追求分区容忍性和可用性。这是很多分布式系统设计时的选择。例如：\r\n\r\n上边的商品管理，完全可以实现AP，前提是只要用户可以接受所查询的到数据在一定时间内不是最新的即可。\r\n\r\n通常实现AP都会保证最终一致性，后面讲的BASE理论就是根据AP来扩展的，一些业务场景 比如：订单退款，今日退款成功，明日账户到账，只要用户可以接受在一定时间内到账即可。\r\n\r\n2） CP：\r\n\r\n放弃可用性，追求一致性和分区容错性，我们的zookeeper其实就是追求的强一致，又比如跨行转账，一次转账请求要等待双方银行系统都完成整个事务才算完成。\r\n\r\n3） CA：\r\n\r\n放弃分区容忍性，即不进行分区，不考虑由于网络不通或结点挂掉的问题，则可以实现一致性和可用性。那么系统将不是一个标准的分布式系统，我们最常用的关系型数据就满足了CA。\r\n\r\n主数据库和从数据库中间不再进行数据同步，数据库可以响应每次的查询请求，通过事务隔离级别实现每个查询请求都可以返回最新的数据。\r\n\r\n### 2.1.3 总结\r\n\r\n通过上面我们已经学习了CAP理论的相关知识，CAP是一个已经被证实的理论：一个分布式系统最多只能同时满足一致性（Consistency）、可用性（Availability）和分区容忍性（Partition tolerance）这三项中的两项。它可以作为我们进行架构设计、技术选型的考量标准。对于多数大型互联网应用的场景，结点众多、部署分散，而且现在的集群规模越来越大，所以节点故障、网络故障是常态，而且要保证服务可用性达到N个9（99.99..%），并要达到良好的响应性能来提高用户体验，因此一般都会做出如下选择：保证P和A，舍弃C强一致，保证最终一致性。\r\n\r\n \r\n\r\n## 2.2.  BASE理论\r\n\r\n1、理解强一致性和最终一致性\r\n\r\nCAP理论告诉我们一个分布式系统最多只能同时满足一致性（Consistency）、可用性（Availability）和分区容忍性（Partition tolerance）这三项中的两项，其中AP在实际应用中较多，AP即舍弃一致性，保证可用性和分区容忍性，但是在实际生产中很多场景都要实现一致性，比如前边我们举的例子主数据库向从数据库同步数据，即使不要一致性，但是最终也要将数据同步成功来保证数据一致，这种一致性和CAP中的一致性不同，CAP中的一致性要求在任何时间查询每个结点数据都必须一致，它强调的是强一致性，但是最终一致性是允许可以在一段时间内每个结点的数据不一致，但是经过一段时间每个结点的数据必须一致，它强调的是最终数据的一致性。\r\n\r\n2、Base理论介绍\r\n\r\nBASE理论是对CAP中AP的一个扩展，通过牺牲强一致性来获得可用性，当出现故障允许部分不可用但要保证核心功能可用，允许数据在一段时间内是不一致的，但`最终一致性`。满足BASE理论的事务，我们称之为“**柔性事务**”。\r\n\r\nBASE是指：\r\n\r\n- 基本可用（`B`asically `A`vailable）\r\n  基本可用是指分布式系统在出现故障的时候，允许损失部分可用性（例如响应时间、功能上的可用性），允许损失部分可用性。需要注意的是，基本可用绝不等价于系统不可用。\r\n  - 响应时间上的损失：正常情况下搜索引擎需要在0．5秒之内返回给用户相应的查询结果，但由于出现故障（比如系统部分机房发生断电或断网故障），查询结果的响应时间增加到了1～2秒。\r\n  - 功能上的损失：购物网站在购物高峰（如双十一）时，为了保护系统的稳定性，部分消费者可能会被引导到一个降级页面。\r\n- 软状态（`S`oft state）\r\n  - 软状态是指允许系统存在中间状态，而该中间状态不会影响系统整体可用性。分布式存储中一般一份数据会有多个副本，允许不同副本同步的延时就是软状态的体现。mysql replication的异步复制也是一种体现。\r\n- 最终一致性（`E`ventual Consistency）\r\n  - 最终一致性是指系统中的所有数据副本经过一定时间后，最终能够达到一致的状态。弱一致性和强一致性相反，最终一致性是弱一致性的一种特殊情况。（这也是分布式事务的想法）\r\n\r\n从客户端角度，多进程并发访同时，更新过的数据在不同程如何获的不同策珞，决定了不同的一致性。\r\n\r\n- 对于关系型要求更新过据能后续的访同都能看到，这是强一致性。\r\n- 如果能容忍后经部分过者全部访问不到，则是弱一致性\r\n- 如果经过一段时间后要求能访问到更新后的数据，则是最终一致性\r\n\r\n#  三、解决方案之==`2PC`(两阶段提交)==\r\n\r\n前面已经学习了分布式事务的基础理论，以理论为基础，针对不同的分布式场景业界常见的解决方案有2PC、TCC、可靠消息最终一致性、最大努力通知这几种。\r\n\r\n3.1 .什么是2PC\r\n\r\n2PC即两阶段提交协议，是将整个事务流程分为两个阶段，准备阶段（Prepare  phase）、提交阶段（commit phase），2是指两个阶段，P是指准备阶段，C是指提交阶段。\r\n\r\n> 注意这只是协议或者说是理论指导，只阐述了大方向，具体落地还是有会有差异的。\r\n>\r\n> 数据库支持的`2pc`【2二阶段提交】，又叫做`XA Transactions`\r\n\r\n2PC（Two-phase commit protocol），中文叫二阶段提交。 **二阶段提交是一种强一致性设计**，2PC 引入一个事务协调者的角色来协调管理各参与者（也可称之为各本地资源）的提交和回滚，二阶段分别指的是准备（投票）和提交两个阶段。\r\n\r\n在计算机中部分关系数据库如Oracle、MySQL支持两阶段提交协议，如下图：\r\n\r\n- \\1. 准备阶段（Prepare phase）：事务管理器给每个参与者发送Prepare消息，每个数据库参与者在本地**执行事务**，并写**本地的Undo/Redo日志**，此时事务没有提交。\r\n\r\n  （Undo日志是记录修改前的数据，用于数据库回滚，Redo日志是记录修改后的数据，用于提交事务后写入数据文件）\r\n\r\n- \\2. 提交阶段（commit phase）：如果事务管理器收到了参与者的执行失败或者超时消息时，直接给每个参与者发送回滚(Rollback)消息；否则，发送提交(Commit)消息；参与者根据事务管理器的指令执行提交或者回滚操作，并释放事务处理过程中使用的锁资源。注意:必须在最后阶段释放锁资源。\r\n\r\n如果任一资源管理器在第一阶段返回准备失败，那么事务管理器会要求所有资源管理器在第二阶段执行回滚操作。通过事务管理器的两阶段协调，最终所有资源管理器要么全部提交，要么全部回滚，最终状态都是一致的\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190409111746632.png)\r\n\r\n处理步骤：\r\n\r\n- （1）投票阶段（voting phase）：协调者将通知事务参与者准备提交或取消事务，然后进入表决过程。\r\n  - 参与者将告知协调者自己的决策：同意（事务参与者本地事务执行成功，但未提交）或取消（本地事务执行故障）；\r\n  - ![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9tbWJpei5xcGljLmNuL21tYml6X3BuZy8wT3phTDV1VzJhTkdrSFZnNExoQVhSajNUUFVMWm9kcWV1enRxaFFOak9Lc09JZzFoeTZlTUhTTlpneVNhMHFadjFvb1M1VkhhN2ljckNEMG42YmdqTkEvNjQw?x-oss-process=image/format,png)\r\n- （2）提交阶段（commit phase）：收到参与者的通知后，协调者再向参与者发出通知，根据反馈情况决定各参与者是否要**提交还是回滚**；\r\n  - ![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9tbWJpei5xcGljLmNuL21tYml6X3BuZy8wT3phTDV1VzJhTkdrSFZnNExoQVhSajNUUFVMWm9kcW5HaDFMaWFlcW81dW1ESDVXcnhpY3JTcWlja2lhN2JqYlRMR3Njd0hBUUFMUHc5Z2RvTmFwWE41amcvNjQw?x-oss-process=image/format,png)\r\n\r\n两阶段提交（`2PC`），对业务侵⼊很小，它最⼤的优势就是对使用方透明，用户可以像使⽤本地事务一样使用基于 XA 协议的分布式事务，能够严格保障事务 ACID 特性。\r\n\r\n2PC缺点：它是一个**强一致性**的**同步阻塞**协议，事务执行过程中需要将所需资源全部锁定，也就是俗称的 `刚性事务`。所以它比较适⽤于执⾏时间确定的短事务，整体性能比较差。\r\n\r\n像第一阶段协调者会等待所有参与者响应才会进行下一步操作，当然第一阶段的**协调者有超时机制**，假设因为网络原因没有收到某参与者的响应或某参与者挂了，那么超时后就会判断事务失败，向所有参与者发送回滚命令。\r\n\r\n在第二阶段协调者的没法超时，因为按照我们上面分析只能不断重试！\r\n\r\n一旦事务协调者宕机或者发生网络抖动，会让参与者一直处于锁定资源的状态或者只有一部分参与者提交成功，导致数据的不一致。因此，在高并发性能至上的场景中，基于 XA 协议的分布式事务并不是最佳选择。\r\n\r\n> 举例：张三和李四聚餐，饭店要求先买单，才能出票。这时张三和李四AA制。只有张三和李四都付款，老板才能出票安排就餐。但由于张三和李四都是铁公鸡，形成了尴尬的一幕：\r\n>\r\n> 准备阶段：老板要求张三付款，张三付款。老板要求李四付款，李四付款。\r\n>\r\n> 提交阶段：老板出票，两人拿票纷纷落座就餐。\r\n>\r\n> 例子中形成了一个事务，若张三或李四其中一人拒绝付款，或钱不够，店老板都不会给出票，并且会把已收款退回。\r\n>\r\n> 整个事务过程由事务管理器和参与者组成，店老板就是事务管理器，张三、李四就是事务参与者，事务管理器负责决策整个分布式事务的提交和回滚，事务参与者负责自己本地事务的提交和回滚。\r\n\r\n\r\n\r\n###  2PC缺点？\r\n\r\n1. **同步阻塞问题**。执行过程中，所有参与节点都是事务阻塞型的。当参与者占有公共资源时，其他第三方节点访问公共资源不得不处于阻塞状态。(1pc准备阶段，只执行sql，而不提交，并且占用数据库连接资源)\r\n\r\n2. **单点故障**。由于协调者的重要性，一旦协调者发生故障。参与者会一直阻塞下去。尤其在第二阶段，协调者发生故障，那么所有的参与者还都处于锁定事务资源的状态中，而无法继续完成事务操作。（如果是协调者挂掉，可以重新选举一个协调者，但是无法解决因为协调者宕机导致的参与者处于阻塞状态的问题）\r\n3. **数据不一致**。在二阶段提交的阶段二中，当协调者向参与者发送commit请求之后，发生了局部网络异常或者在发送commit请求过程中协调者发生了故障，这回导致只有一部分参与者接受到了commit请求。而在这部分参与者接到commit请求之后就会执行commit操作。但是其他部分未接到commit请求的机器则无法执行事务提交。于是整个分布式系统便出现了数据部一致性的现象。\r\n4. 二阶段无法解决的问题：协调者在发出commit消息之后宕机，而唯一接收到这条消息的参与者同时也宕机了。那么即使协调者通过选举协议产生了新的协调者，这条事务的状态也是不确定的，没人知道事务是否被已经提交。\r\n\r\n## 3.2 .解决方案\r\n\r\n### 3.2.1 ==`XA`方案==\r\n\r\n2PC的传统方案是在数据库层面实现的，如Oracle、MySQL都支持2PC协议，为了统一标准减少行业内不必要的对接成本，需要制定标准化的处理模型及接口标准，国际开放标准组织Open Group定义了分布式事务处理模型 DTP（Distributed Transaction Processing Reference Model）。\r\n\r\n为了让大家更明确XA方案的内容程，下面新用户注册送积分为例来说明：\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/07a30899ec114074acda715d5e4dd993.png\" alt=\"请添加图片描述\" style=\"zoom:50%;\" />\r\n\r\n\r\n\r\n执行流程如下：\r\n\r\n- 1、应用程序（AP）持有用户库和积分库两个数据源。\r\n- 2、应用程序（AP）通过TM通知用户库RM新增用户，同时通知积分库RM为该用户新增积分，RM此时并未提交事务，此时用户和积分**资源锁定**。\r\n- 3、TM收到执行回复，只要有一方失败则分别向其他RM发起回滚事务，回滚完毕，资源锁释放。\r\n- 4、TM收到执行回复，全部成功，此时向所有RM发起提交事务，提交完毕，资源锁释放。\r\n\r\nDTP模型定义如下角色：\r\n\r\n- AP(Application  Program)：即应用程序，可以理解为使用DTP分布式事务的程序。\r\n- RM(Resource Manager)：即资源管理器，可以理解为事务的参与者，一般情况下是指一个数据库实例，通过资源管理器对该数据库进行控制，资源管理器控制着分支事务。\r\n- **TM**(Transaction Manager)：事务管理器，负责协调和管理事务，事务管理器控制着全局事务，管理事务生命周期，并协调各个RM。**全局事务**是指分布式事务处理环境中，需要操作多个数据库共同完成一个工作，这个工作即是一个全局事务。\r\n\r\nDTP模型定义TM和RM之间通讯的接口规范叫**XA**，简单理解为数据库提供的2PC接口协议，基于数据库的XA协议来实现2PC又称为XA方案。\r\n\r\n以上三个角色之间的交互方式如下：\r\n\r\n1） TM向AP提供  应用程序编程接口，AP通过TM提交及回滚事务。\r\n\r\n2） TM交易中间件通过XA接口来通知RM数据库事务的开始、结束以及提交、回滚等。\r\n\r\n\r\n\r\n总结：\r\n\r\n整个2PC的事务流程涉及到三个角色AP、RM、TM。AP指的是使用2PC分布式事务的应用程序；RM指的是资源管理器，它控制着分支事务；TM指的是事务管理器，它控制着整个全局事务。\r\n\r\n1）在**准备阶段**RM执行实际的业务操作，但不提交事务，资源锁定；\r\n\r\n2）在**提交阶段**TM会接受RM在准备阶段的执行回复，只要有任一个RM执行失败，TM会通知所有RM执行回滚操作，否则，TM将会通知所有RM提交该事务。提交阶段结束资源锁释放。\r\n\r\nXA方案的问题：\r\n\r\n1、需要本地数据库支持XA协议。\r\n\r\n2、资源锁需要等到两个阶段结束才释放，性能较差。\r\n\r\n### 3.2.2 ==Seata-`AT`方案==\r\n\r\nSeata是由阿里中间件团队发起的开源项目 Fescar，后更名为Seata，它是一个是开源的分布式事务框架。\r\n\r\n传统2PC的问题在Seata中得到了解决，它通过对本地关系数据库的分支事务的协调来驱动完成全局事务，是工作在应用层的中间件。主要优点是性能较好，且不长时间占用连接资源，它以高效并且对业务0侵入的方式解决微服务场景下面临的分布式事务问题，它目前提供AT模式(即2PC)及TCC模式的分布式事务解决方案。\r\n\r\nSeata的设计思想如下：\r\n\r\nSeata的设计目标其一是对业务无侵入，因此从业务无侵入的2PC方案着手，在**传统2PC**的基础上演进，并解决2PC方案面临的问题。\r\n\r\nSeata把一个分布式事务理解成一个包含了若干**分支事务**的**全局事务**。全局事务的职责是协调其下管辖的分支事务达成一致，要么一起成功提交，要么一起失败回滚。此外，通常分支事务本身就是一个关系数据库的本地事务\r\n\r\n与 传统2PC  的模型类似，Seata定义了3个组件来协议分布式事务的处理过程： \r\n\r\n<img src=\"https://img-blog.csdnimg.cn/302b6cbf69f341bf87873669058c4cb1.png\" alt=\"请添加图片描述\" style=\"zoom:50%;\" />\r\n\r\n- Transaction Coordinator (TC)： 事务协调器，它是独立的中间件，需要独立部署运行，它维护全局事务的运行状态，接收TM指令发起全局事务的提交与回滚，负责与RM通信协调各各分支事务的提交或回滚。 \r\n- Transaction Manager (TM)： 事务管理器，TM需要嵌入应用程序中工作，它负责开启一个全局事务，并最终向TC发起全局提交或全局回滚的指令。（jar包）\r\n- Resource Manager (RM)： 控制分支事务，负责分支注册、状态汇报，并接收事务协调器TC的指令，驱动分支（本地）事务的提交和回滚。\r\n\r\n> 事务协调者有几个相关DB表\r\n>\r\n> - global_table：全局事务。每当有一个全局事务发起后，就会在该表中记录全局事务ID\r\n> - branch_table：分支事务。记录每一个分支事务的ID，分支事务操作的数据库等信息\r\n> - lock_table：全局锁\r\n\r\n还拿**新用户注册送积分**举例Seata的分布式事务过程：\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/8edf51fa893b40738eab099ed18244af.png\" alt=\"请添加图片描述\" style=\"zoom:50%;\" />\r\n\r\n> 先注册再送积分，所以开启全局事务的一方是用户服务，所以TM在用户服务。谁发起，谁是TM\r\n>\r\n> 一旦开始执行后，就生成一个全局事务和2个branch数据\r\n\r\n具体的执行流程如下：\r\n\r\n- \\1.用户服务的 TM 向 TC 申请开启一个全局事务，全局事务创建成功并生成一个全局唯一的XID。\r\n- \\2. 用户服务的 RM 向 TC 注册 分支事务，该分支事务在用户服务执行新增用户逻辑，并将其纳入 XID 对应全局事务的管辖。\r\n- \\3. 用户服务执行分支事务，向用户表插入一条记录。\r\n- \\4. 逻辑执行到远程调用积分服务时(XID 在微服务调用链路的上下文中传播)。积分服务的RM 向 TC 注册分支事务，该分支事务执行增加积分的逻辑，并将其纳入  XID 对应全局事务的管辖。\r\n- \\5. 积分服务执行分支事务，向积分记录表插入一条记录，执行完毕后，返回用户服务。\r\n- \\6. 用户服务分支事务执行完毕。\r\n- \\7. TM 向 TC 发起针对 XID 的全局提交或回滚决议。\r\n- \\8. TC 调度 XID 下管辖的全部分支事务完成提交或回滚请求。\r\n\r\n#### Seata实现2PC与传统2PC的差别：\r\n\r\n架构层次方面，传统2PC方案的 RM 实际上是在数据库层，RM 本质上就是数据库自身，通过 XA 协议实现，而Seata的 RM 是以jar包的形式作为中间件层部署在应用程序这一侧的。\r\n\r\n两阶段提交方面，传统2PC无论第二阶段的决议是commit还是rollback，事**务性资源的锁都要保持到阶段2完成才释放**。而**Seata的做法是在阶段1就将本地事务提交，这样就可以省去Phase2持锁的时间**，整体提高效率。\r\n\r\n\r\n\r\n## 3.3. seata实现2PC事务\r\n\r\n> 其他笔记：https://www.it235.com/高级框架/SpringCloudAlibaba/seata.html\r\n\r\n### 3.3.1 .业务说明\r\n\r\n本示例通过Seata中间件实现分布式事务，模拟三个账户的转账交易过程。\r\n\r\n两个账户在三个不同的银行(张三在bank1、李四在bank2)，bank1和bank2是两个个微服务。交易过程是，张三给李四转账指定金额。\r\n\r\n```\r\n张三 ---转账100-->李四\r\n```\r\n\r\n上述交易步骤，要么一起成功，要么一起失败，必须是一个整体性的事务。\r\n\r\n### 3.3.2 .程序组成部分\r\n\r\n本示例程序组成部分如下：\r\n\r\n```\r\n包括bank1和bank2两个数据库。\r\n\r\n微服务框架：spring-boot-2.1.3、spring-cloud-Greenwich.RELEASE\r\n\r\nseata客户端（RM、TM）：spring-cloud-alibaba-seata-2.1.0.RELEASE\r\n\r\nseata服务端(TC)：seata-server-0.7.1\r\n\r\n微服务及数据库的关系 ：\r\ndtx/dtx-seata-demo/seata-demo-bank1 银行1，操作张三账户， 连接数据库bank1 \r\ndtx/dtx-seata-demo/seata-demo-bank2 银行2，操作李四账户，连接数据库bank2\r\n\r\n服务注册中心：dtx/discover-server\r\n\r\n本示例程序技术架构如下：\r\nban1操作后openFeign调用bank2\r\n\r\n交互流程如下：\r\n1、请求bank1进行转账，传入转账金额。\r\n2、bank1减少转账金额，调用bank2，传入转账金额。\r\n```\r\n\r\n\r\n\r\n### 3.3.3 .创建==数据库undo_log==\r\n\r\n> 因为要用seata，所以还需要创建`undo_log`表\r\n\r\n```\r\n导入数据库脚本：资料\\sql\\bank1.sql、资料\\sql\\bank2.sql\r\nsql在本文末\r\n\r\n包括如下数据库：\r\nbank1库，包含张三账户\r\nbank2库，包含李四账户\r\n```\r\n\r\n分别在bank1、bank2库中创建`undo_log`表，此表为seata框架使用：\r\n\r\n```mysql\r\n-- 注意此处0.3.0+ 增加唯一索引 ux_undo_log\r\nCREATE TABLE `undo_log` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `branch_id` bigint(20) NOT NULL,\r\n  `xid` varchar(100) NOT NULL,\r\n  `context` varchar(128) NOT NULL,\r\n  `rollback_info` longblob NOT NULL,\r\n  `log_status` int(11) NOT NULL,\r\n  `log_created` datetime NOT NULL,\r\n  `log_modified` datetime NOT NULL,\r\n  `ext` varchar(100) DEFAULT NULL,\r\n  PRIMARY KEY (`id`),\r\n  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\r\n) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;\r\n```\r\n\r\n\r\n\r\n### 3.3.4 .启动TC(事务协调器)\r\n\r\n（1）下载seata服务器\r\n\r\n下载地址：https://github.com/seata/seata/releases/download/v0.7.1/seata-server-0.7.1.zip\r\n\r\n（2）解压并启动\r\n\r\n```\r\n[seata服务端解压路径]/bin/seata-server.bat -p 8888 -m ﬁle\r\n```\r\n\r\n注：其中8888为服务端口号；ﬁle为启动模式，这里指seata服务将采用文件的方式存储信息。\r\n\r\n出现“Server  started...”的字样则表示启动成功。\r\n\r\n### 3.3.5 注册中心discover-server\r\n\r\ndiscover-server是服务注册中心，测试工程将自己注册至discover-server。\r\n\r\n导入：资料\\基础代码\\dtx   父工程，此工程自带了discover-server（基于Eureka实现）。\r\n\r\n### 3.3.6 导入案例工程dtx-seata-demo\r\n\r\ndtx-seata-demo是seata的测试工程，根据业务需求需要创建两个dtx-seata-demo工程。\r\n\r\n（1）导入dtx-seata-demo\r\n\r\n导入：资料\\基础代码\\dtx-seata-demo到父工程dtx下。两个测试工程如下：\r\n\r\ndtx/dtx-seata-demo/dtx-seata-demo-bank1 ，操作张三账户，连接数据库bank1\r\n\r\ndtx/dtx-seata-demo/dtx-seata-demo-bank2  ，操作李四账户，连接数据库bank2\r\n\r\n（2）父工程maven依赖说明\r\n\r\n在dtx父工程中指定了SpringBoot和SpringCloud版本\r\n\r\n在dtx-seata-demo父工程中指定了spring-cloud-alibaba-dependencies的版本。\r\n\r\n（3）配置seata\r\n\r\n在src/main/resource中，新增registry.conf、ﬁle.conf文件，内容可拷贝seata-server-0.7.1中的配置文件子。在registry.conf中registry.type使用ﬁle：\r\n\r\n在ﬁle.conf中更改service.vgroup_mapping.[springcloud服务名]-fescar-service-group = \"default\"，并修改 service.default.grouplist =[seata服务端地址]\r\n\r\n 关于vgroup_mapping的配置：\r\n\r\n```\r\nvgroup_mapping.事务分组服务名=Seata Server集群名称（默认名称为default） \r\ndefault.grouplist = Seata Server集群地址\r\n```\r\n\r\n```\r\n在 org.springframework.cloud:spring-cloud-starter-alibaba-seata 的org.springframework.cloud.alibaba.seata.GlobalTransactionAutoConfiguration  类中，默认会使用${spring.application.name}-fescar-service-group 作为事务分组服务名注册到 Seata Server上，如果和file.conf 中的配置不一致，会提示 no available server to connect 错误\r\n\r\n\r\n也可以通过配置 spring.cloud.alibaba.seata.tx-service-group 修改后缀，但是必须和 file.conf 中的配置保持\r\n一致\r\n```\r\n\r\n\r\n\r\n##### （4）创建==代理数据源==\r\n\r\n新增DatabaseConﬁguration.java，Seata的RM通过DataSourceProxy才能在业务代码的事务提交时，通过这个切入点，与TC进行通信交互、记录undo_log等。\r\n\r\n ```JAVA\r\n@Configuration\r\npublic class DatabaseConfiguration {\r\n    @Bean\r\n    @ConfigurationProperties(prefix = \"spring.datasource.ds0\")\r\n    public DruidDataSource ds0() {\r\n        DruidDataSource druidDataSource = new DruidDataSource();\r\n        return druidDataSource;\r\n    }\r\n\r\n    @Primary\r\n    @Bean\r\n    public DataSource dataSource(DruidDataSource ds0)  {\r\n        // 代理，管理undo_log\r\n        DataSourceProxy pds0 = new DataSourceProxy(ds0);\r\n        return pds0;\r\n    }\r\n} \r\n ```\r\n\r\n### 3.3.7 ==Seata执行流程==\r\n\r\n#### 1、==正常提交流程==\r\n\r\n- 第一个程序**开启全局事务**，然后得到了`全局事务ID`，执行完逻辑后把内容写到`undo_log`表，然后提交事务给TC。\r\n- 然后远程调用bank，此时RPC时携带上`全局事务ID`，这样bank2页知道了事务ID，bank2执行完逻辑后也存入`undo_log`表，然后汇报给TC\r\n- 然后bank1提交全局事务，提交后删除`undo_log`\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/20200331162349323.png\" alt=\"img\" style=\"zoom: 50%;\" />\r\n\r\n一阶段\r\n\r\n![img](https://www.it235.com/assets/img/v2-d13a9a1f2a7dcc0db83323d46547efa3_720w.aef19a0a.jpg)\r\n\r\n二阶段\r\n\r\n ![img](https://www.it235.com/assets/img/v2-b14948ac009ddaae426f42c7e7824a44_720w.3b805116.jpg)\r\n\r\n> 比如张三给李四转账，李四也在自己取钱，就会有脏写\r\n>\r\n> 脏读是说读到别人没有提交的数据，脏写是两个都提交了来回覆盖，所以需要全局锁（就是读写隔离）\r\n\r\n异常：TM执行失败，通知TC全局回滚，TC此时通知所有的RM进行回滚，根据UNDO-LOG反向操作，使用before image还原业务数据，删除UNDO-LOG,但在还原前要首先要校验脏写，对比\"数据库当前业务数据\"和\"after image\",如果两份数据完全一致就说明没有脏写，可以还原业务数据，如果不一致就说明有脏写，出现脏写就需要转人工处理。\r\n\r\n##### 写隔离\r\n\r\n- 一阶段本地事务提交前，需要确保先拿到 **全局锁** 。\r\n- 拿不到 **全局锁** ，不能提交本地事务。\r\n- 拿 **全局锁** 的尝试被限制在一定范围内，超出范围将放弃，并回滚本地事务，释放本地锁。\r\n\r\n以一个示例来说明：\r\n\r\n两个全局事务 tx1 和 tx2，分别对 a 表的 m 字段进行更新操作，m 的初始值 1000。（假设都是李四的账户）\r\n\r\ntx1 先开始，开启本地事务，拿到本地锁，更新操作 m = 1000 - 100 = 900。本地事务提交前，先拿到该记录的 **全局锁** ，本地提交释放本地锁。 tx2 后开始，开启本地事务，拿到本地锁，更新操作 m = 900 - 100 = 800。本地事务提交前，尝试拿该记录的 **全局锁** ，tx1 全局提交前，该记录的全局锁被 tx1 持有，tx2 需要重试等待 **全局锁** 。\r\n\r\n![Write-Isolation: Commit](http://seata.io/img/seata_at-1.png)\r\n\r\n> 假设上面tx1回滚了怎么办？\r\n\r\ntx1 二阶段全局提交，释放 **全局锁** 。tx2 拿到 **全局锁** 提交本地事务。\r\n\r\n![Write-Isolation: Rollback](http://seata.io/img/seata_at-2.png)\r\n\r\n如果 tx1 的二阶段全局回滚，则 tx1 需要重新获取该数据的本地锁，进行反向补偿的更新操作，实现分支的回滚。\r\n\r\n此时，如果 tx2 仍在等待该数据的 **全局锁**，同时持有本地锁，则 tx1 的分支回滚会失败。分支的回滚会一直重试，直到 tx2 的 **全局锁** 等锁**超时**，放弃 **全局锁** 并回滚本地事务**释放本地锁**，tx1 的分支回滚最终成功。\r\n\r\n因为整个过程 **全局锁** 在 tx1 结束前一直是被 tx1 持有的，所以不会发生 **脏写** 的问题。\r\n\r\n##### 读隔离\r\n\r\n在数据库本地事务隔离级别 **读已提交（Read Committed）** 或以上的基础上，Seata（AT 模式）的默认全局隔离级别是 **读未提交（Read Uncommitted）** 。\r\n\r\n如果应用在特定场景下，必需要求全局的 **读已提交** ，目前 Seata 的方式是通过 SELECT FOR UPDATE 语句的代理。（读锁）\r\n\r\n![Read Isolation: SELECT FOR UPDATE](http://seata.io/img/seata_at-3.png)\r\n\r\nSELECT FOR UPDATE 语句的执行会申请 **全局锁** ，如果 **全局锁** 被其他事务持有，则释放本地锁（回滚 SELECT FOR UPDATE 语句的本地执行）并重试。这个过程中，查询是被 block 住的，直到 **全局锁** 拿到，即读取的相关数据是 **已提交** 的，才返回。\r\n\r\n出于总体性能上的考虑，Seata 目前的方案并没有对所有 SELECT 语句都进行代理，仅针对 FOR UPDATE 的 SELECT 语句。\r\n\r\n#### 2、回滚流程\r\n\r\n回滚流程省略前的RM注册过程。\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/20200331162424593.png\" alt=\"img\" style=\"zoom:50%;\" />\r\n\r\n \r\n\r\n要点说明：\r\n\r\n- 1、每个RM使用`DataSourceProxy`连接数据库，其目的是使用ConnectionProxy，使用数据源和数据连接代理的目的就是在第一阶段将`undo_log`和业务数据放在一个本地事务提交，这样就保存了只要有业务操作就一定有undo_log。\r\n- 2、在第一阶段undo_log中存放了数据修改前和修改后的值，为事务回滚作好准备，所以第一阶段完成就已经将分支事务提交，也就释放了锁资源。\r\n- 3、TM开启全局事务开始，将`XID`全局事务id放在事务上下文中，通过feign调用也将XID传入下游分支事务，每个分支事务将自己的`Branch ID分支事务ID`与`XID`关联。\r\n- 4、第二阶段全局事务提交，TC会通知各各分支参与者提交分支事务，在第一阶段就已经提交了分支事务，这里各各参与者只需要删除undo_log即可，并且可以异步执行，第二阶段很快可以完成。\r\n- 5、第二阶段全局事务回滚，TC会通知各各分支参与者回滚分支事务，通过 XID 和 Branch ID 找到相应的回滚日志，通过回滚日志生成反向的 SQL 并执行，以完成分支事务回滚到之前的状态，如果回滚失败则会重试回滚操作。\r\n\r\n### 3.3.8 dtx-seata-demo-bank1\r\n\r\ndtx-seata-demo-bank1实现如下功能：\r\n\r\n1、张三账户减少金额，开启全局事务。\r\n\r\n2、远程调用bank2向李四转账。\r\n\r\n（1） DAO\r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountInfoDao {\r\n\r\n    //更新账户金额\r\n    @Update(\"update account_info set account_balance = account_balance + #{amount} where account_no = #{accountNo}\")\r\n    int updateAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n}\r\n```\r\n\r\n（2） FeignClient\r\n\r\n远程调用bank2的客户端\r\n\r\n```java\r\n@FeignClient(value=\"seata-demo-bank2\",fallback=Bank2ClientFallback.class)\r\npublic interface Bank2Client {\r\n    //远程调用李四的微服务\r\n    @GetMapping(\"/bank2/transfer\")\r\n    public  String transfer(@RequestParam(\"amount\") Double amount);\r\n}\r\n@Component\r\npublic class Bank2ClientFallback implements Bank2Client {\r\n\r\n    @Override\r\n    public String transfer(Double amount) {\r\n        return \"fallback\";\r\n    }\r\n}\r\n```\r\n\r\n（3） Service\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Autowired\r\n    Bank2Client bank2Client;\r\n\r\n    @Transactional\r\n    @GlobalTransactional//开启全局事务\r\n    @Override\r\n    public void updateAccountBalance(String accountNo, Double amount) {\r\n        log.info(\"bank1 service begin,XID：{}\", RootContext.getXID());\r\n        //扣减张三的金额\r\n        accountInfoDao.updateAccountBalance(accountNo,amount *-1);\r\n        //调用李四微服务，转账\r\n        String transfer = bank2Client.transfer(amount);\r\n        if(\"fallback\".equals(transfer)){\r\n            //调用李四微服务异常\r\n            throw new RuntimeException(\"调用李四微服务异常\");\r\n        }\r\n        if(amount == 2){\r\n            //人为制造异常\r\n            throw new RuntimeException(\"bank1 make exception..\");\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n##### 事务ID的自动传递\r\n\r\n将`@GlobalTransactional`注解标注在全局事务发起的Service实现方法上，开启全局事务：\r\n\r\nGlobalTransactionalInterceptor会拦截@GlobalTransactional注解的方法，生成`全局事务ID(XID)`，XID会在整个分布式事务中传递。\r\n\r\n在远程调用时，spring-cloud-alibaba-seata会拦截Feign调用将XID传递到下游服务。\r\n\r\n（6）Controller\r\n\r\n```java\r\n@RestController\r\npublic class Bank1Controller {\r\n\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    //张三转账\r\n    @GetMapping(\"/transfer\")\r\n    public String transfer(Double amount){\r\n        accountInfoService.updateAccountBalance(\"1\",amount);\r\n        return \"bank1\"+amount;\r\n    }\r\n}\r\n\r\n```\r\n\r\n```java\r\n@SpringBootApplication\r\n@EnableDiscoveryClient\r\n@EnableHystrix\r\n@EnableFeignClients(basePackages = {\"cn.itcast.dtx.seatademo.bank1.spring\"})\r\npublic class Bank1Server {\r\n	\r\n	public static void main(String[] args) {\r\n		SpringApplication.run(Bank1Server.class, args);\r\n	}\r\n}\r\n```\r\n\r\n\r\n\r\n### 3.3.9 dtx-seata-demo-bank2\r\n\r\ndtx-seata-demo-bank2实现如下功能：\r\n\r\n1、李四账户增加金额。\r\n\r\ndtx-seata-demo-bank2在本账号事务中作为分支事务不使用@GlobalTransactional。\r\n\r\nService\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Transactional\r\n    @Override\r\n    public void updateAccountBalance(String accountNo, Double amount) {\r\n        // RootContext.getXID()\r\n        log.info(\"bank2 service begin,XID：{}\",RootContext.getXID());\r\n        //李四增加金额\r\n        accountInfoDao.updateAccountBalance(accountNo,amount);\r\n        if(amount==3){\r\n            //人为制造异常\r\n            throw new RuntimeException(\"bank2 make exception..\");\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n（3） Controller\r\n\r\n```java\r\n@RestController\r\npublic class Bank2Controller {\r\n\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    //接收张三的转账\r\n    @GetMapping(\"/transfer\")\r\n    public String transfer(Double amount){\r\n        //李四增加金额\r\n        accountInfoService.updateAccountBalance(\"2\",amount);\r\n        return \"bank2\"+amount;\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n### 3.3.10 测试场景\r\n\r\n- 张三向李四转账成功。\r\n- 李四事务失败，张三事务回滚成功。\r\n- 张三事务失败，李四事务回滚成功。\r\n- 分支事务超时测试。\r\n\r\n>  注意执行一半的时候张三是转账成功的\r\n\r\n## 3.4.小结\r\n\r\n本节讲解了传统2PC（基于数据库XA协议）和Seata实现2PC的两种2PC方案，由于Seata的0侵入性并且解决了传统2PC长期锁资源的问题，所以推荐采用Seata实现2PC。\r\n\r\nSeata实现2PC要点：\r\n\r\n- 1、全局事务开始使用 `@GlobalTransactional`标识 。\r\n- 2、每个本地事务方案仍然使用`@Transactional`标识。\r\n- 3、每个数据都需要创建`undo_log`表，此表是seata保证本地事务一致性的关键。\r\n\r\n### 2PC失效案例\r\n\r\n##### 1）**协调者故障分析**\r\n\r\n> **协调者是一个单点，存在单点故障问题**。\r\n>\r\n> - 假设协调者在**发送准备命令之前**挂了，还行等于事务还没开始。\r\n> - 假设协调者在**发送准备命令之后**挂了，这就不太行了，有些参与者等于都执行了处于事务**资源锁定**的状态。不仅事务执行不下去，还会因为锁定了一些公共资源而**阻塞**系统其它操作。\r\n> - 假设协调者在**发送回滚事务命令之前**挂了，那么事务也是执行不下去，且在第一阶段那些准备成功参与者都阻塞着。\r\n> - 假设协调者在**发送回滚事务命令之后**挂了，这个还行，至少命令发出去了，很大的概率都会回滚成功，资源都会释放。但是如果出现网络分区问题，某些参与者将因为收不到命令而阻塞着。\r\n> - 假设协调者在**发送提交事务命令之前**挂了，这个不行，傻了！这下是所有资源都阻塞着。\r\n> - 假设协调者在**发送提交事务命令之后**挂了，这个还行，也是至少命令发出去了，很大概率都会提交成功，然后释放资源，但是如果出现网络分区问题某些参与者将因为收不到命令而阻塞着。\r\n>\r\n> 协调组故障可以通过选举算法来得到新的协调点\r\n\r\n##### 2）**协调者故障，通过选举得到新协调者**\r\n\r\n因为协调者单点问题，因此我们可以通过选举等操作选出一个新协调者来顶替。\r\n\r\n如果处于第一阶段，其实影响不大都回滚好了，在第一阶段事务肯定还没提交。\r\n\r\n如果处于第二阶段，假设参与者都没挂，此时新协调者可以向所有参与者确认它们自身情况来推断下一步的操作。\r\n\r\n假设有个别参与者挂了！这就有点僵硬了，比如协调者发送了回滚命令，此时**第一个参与者收到了并执行，然后协调者和第一个参与者都挂了**。\r\n\r\n此时其他参与者都没收到请求，然后新协调者来了，它询问其他参与者都说OK，但它不知道挂了的那个参与者到底O不OK，所以它傻了。\r\n\r\n问题其实就出在**每个参与者自身的状态只有自己和原协调者知道**，因此新协调者无法通过在场的参与者的状态推断出挂了的参与者是什么情况。\r\n\r\n虽然协议上没说，不过在实现的时候我们可以灵活的让协调者将自己发过的请求在哪个地方记一下，也就是日志记录，这样新协调者来的时候不就知道此时该不该发了？\r\n\r\n但是就算协调者知道自己该发提交请求，那么在参与者也一起挂了的情况下没用，因为你不知道参与者在挂之前有没有提交事务。\r\n\r\n如果参与者在挂之前事务提交成功，新协调者确定存活着的参与者都没问题，那肯定得向其他参与者发送提交事务命令才能保证数据一致。\r\n\r\n如果参与者在挂之前事务还未提交成功，参与者恢复了之后数据是回滚的，此时协调者必须是向其他参与者发送回滚事务命令才能保持事务的一致。\r\n\r\n所以说极端情况下还是无法避免数据不一致问题。\r\n\r\n总结2PC：\r\n\r\n- 支持情况：mysql从5.5版本开始支持，SQLserver2005开始支持，Oracle7开始支持。\r\n- XA协议比较简单，而且一旦商业数据库实现了XA协议，使用分布式事务的成本也比较低。\r\n- ==性能不理想==，特别是在交易下单链路，往往并发量很高，**XA无法满足高并发场景**\r\n- XA目前在商业数据库支持的比较理想，**在mysql数据库中支持的不太理想**，mysql的XA实现，没有记录阶段日志，主备切换回导致主库与备库数据不一致。\r\n- 许多nosql没有支持XA，这让XA的应用场景变得非常狭隘。\r\n- 也有`3PC`，引入了超时机制（无论协调者还是参与者，在向对方发送请求后，若长时间未收到回应则做出相应处理）\r\n\r\n> 还有一点不知道你们看出来没，2PC 适用于**数据库层面的分布式事务场景**，而我们业务需求有时候不仅仅关乎数据库，也有可能是上传一张图片或者发送一条短信。\r\n>\r\n> 而且像 Java 中的 JTA 只能解决一个应用下多数据库的分布式事务问题，跨服务了就不能用了。\r\n>\r\n> 简单说下 Java 中 JTA，它是基于XA规范实现的事务接口，这里的 XA 你可以简单理解为基于数据库的 XA 规范来实现的 2PC。\r\n>\r\n> 接下来我们再来看看 3PC。\r\n\r\n##### **3PC**\r\n\r\n- 首先**准备阶段的变更成不会直接执行事务**，而是会先去询问此时的参与者是否有条件接这个事务，因此**不会一来就干活直接锁资源**，使得在某些资源不可用的情况下所有参与者都阻塞着。\r\n- 而**预提交阶段的引入起到了一个统一状态的作用**，它像一道栅栏，表明在预提交阶段前所有参与者其实还未都回应，在预处理阶段表明所有参与者都已经回应了。\r\n\r\n假如你是一位参与者，**你知道自己进入了预提交状态那你就可以推断出来其他参与者也都进入了预提交状态**。\r\n\r\n但是多引入一个阶段也多一个交互，因此**性能会差一些**，而且**绝大部分的情况下资源应该都是可用的**，这样等于每次明知可用执行还得询问一次\r\n\r\n我们再来看下参与者超时能带来什么样的影响。\r\n\r\n我们知道 2PC 是同步阻塞的，上面我们已经分析了协调者挂在了提交请求还未发出去的时候是最伤的，所有参与者都已经锁定资源并且阻塞等待着。\r\n\r\n那么引入了超时机制，参与者就不会傻等了，**如果是等待提交命令超时，那么参与者就会提交事务了**，因为都到了这一阶段了大概率是提交的，**如果是等待预提交命令超时，那该干啥就干啥了，反正本来啥也没干**。\r\n\r\n然而超时机制也会带来数据不一致的问题，比如在等待提交命令时候超时了，参与者默认执行的是提交事务操作，但是**有可能执行的是回滚操作，这样一来数据就不一致了**。\r\n\r\n当然 3PC 协调者超时还是在的，具体不分析了和 2PC 是一样的。\r\n\r\n> 从维基百科上看，**3PC 的引入是为了解决提交阶段 2PC 协调者和某参与者都挂了之后新选举的协调者不知道当前应该提交还是回滚的问题**。\r\n\r\n新协调者来的时候发现有一个参与者处于预提交或者提交阶段，那么表明已经经过了所有参与者的确认了，所以此时执行的就是提交命令。\r\n\r\n所以说 3PC 就是通过引入预提交阶段来使得参与者之间的状态得到统一，也就是留了一个阶段让大家同步一下。\r\n\r\n但是这也只能让协调者知道该如果做，但不能保证这样做一定对，这其实和上面 2PC 分析一致，因为挂了的参与者到底有没有执行事务无法断定。\r\n\r\n所以说 3PC 通过预提交阶段可以减少故障恢复时候的复杂性，但是不能保证数据一致，除非挂了的那个参与者恢复。\r\n\r\n让我们总结一下， 3PC 相对于 2PC 做了一定的改进：引入了参与者超时机制，并且增加了预提交阶段使得故障恢复之后协调者的决策复杂度降低，但整体的交互过程更长了，性能有所下降，并且还是会存在数据不一致问题。\r\n\r\n所以 2PC 和 3PC 都不能保证数据100%一致，因此一般都需要有定时扫描补偿机制。\r\n\r\n我再说下 3PC 我没有找到具体的实现，所以我认为 3PC 只是纯的理论上的东西，而且可以看到相比于 2PC 它是做了一些努力但是效果甚微，所以只做了解即可。\r\n\r\n## 3PC\r\n\r\n3PC 的出现是为了解决 2PC 的一些问题，相比于 2PC 它在**参与者中也引入了超时机制**，并且**新增了一个阶段**使得参与者可以利用这一个阶段统一各自的状态。\r\n\r\n3PC 包含了三个阶段\r\n\r\n- 准备阶段 CanCommit\r\n\r\n  - **1.事务询问** 协调者向参与者发送CanCommit请求。询问是否可以执行事务提交操作。然后开始等待参与者的响应。\r\n\r\n    **2.响应反馈** 参与者接到CanCommit请求之后，正常情况下，如果其自身认为可以顺利执行事务，则返回Yes响应，并进入预备状态。否则反馈No\r\n\r\n- 预提交阶段 PreCommit\r\n\r\n  - 如果都收到了准备：\r\n\r\n  - **1.发送预提交请求** 协调者向参与者发送PreCommit请求，并进入Prepared阶段。\r\n\r\n  - **2.事务预提交** 参与者接收到PreCommit请求后，会**执行事务**操作，并将undo和redo信息记录到事务日志中。\r\n\r\n  - **3.响应反馈** 如果参与者成功的执行了事务操作，则返回ACK响应，同时开始等待最终指令。\r\n\r\n  - 如果有任一没有准备好/超时：\r\n\r\n  - **1.发送中断请求** 协调者向所有参与者发送abort请求。\r\n\r\n    **2.中断事务** 参与者收到来自协调者的abort请求之后（或超时之后，仍未收到协调者的请求），执行事务的中断。\r\n\r\n- 提交阶段 DoCommit：该阶段进行真正的事务提交，也可以分为以下两种情况。\r\n\r\n  - **执行提交**\r\n\r\n    > **1.发送提交请求** 协调接收到参与者发送的ACK响应，那么他将从预提交状态进入到提交状态。并向所有参与者发送doCommit请求。\r\n    >\r\n    > **2.事务提交** 参与者接收到doCommit请求之后，执行正式的事务提交。并在完成事务提交之后释放所有事务资源。\r\n    >\r\n    > **3.响应反馈** 事务提交完之后，向协调者发送Ack响应。\r\n    >\r\n    > **4.完成事务** 协调者接收到所有参与者的ack响应之后，完成事务。\r\n\r\n  - **中断事务** 协调者接收到参与者发送的N-ACK响应/超时，那么就会执行中断事务。\r\n\r\n  > **1.发送中断请求** 协调者向所有参与者发送abort请求\r\n  >\r\n  > **2.事务回滚** 参与者接收到abort请求之后，利用其在阶段二记录的undo信息来执行事务的回滚操作，并在完成回滚之后释放所有的事务资源。\r\n  >\r\n  > **3.反馈结果** 参与者完成事务回滚之后，向协调者发送ACK消息\r\n  >\r\n  > **4.中断事务** 协调者接收到参与者反馈的ACK消息之后，执行事务的中断。\r\n\r\n<img src=\"https://pic3.zhimg.com/80/v2-885daf4ba34102d6e1047b0b67910652_1440w.jpg\" alt=\"img\" style=\"zoom: 67%;\" />\r\n\r\n\r\n\r\n#### 2PC和3PC的区别是什么？\r\n\r\n1.3pc比2pc多了一个can commit阶段，减少了不必要的资源浪费。因为2pc在第一阶段会占用资源，而**3pc在第一阶段不占用资源**，只是校验一下sql，如果不能执行，就直接返回，减少了资源占用。\r\n\r\n2.引入超时机制。同时在协调者和参与者中都引入超时机制。\r\n\r\n> 2pc：只有协调者有超时机制，超时后，发送回滚指令。\r\n>\r\n> 3pc：协调者和参与者都有超时机制。\r\n>\r\n> 协调者超时: can commit，pre commit中，如果收不到参与者的反馈，则协调者向参与者发送中断指令。\r\n> 参与者超时: pre commit阶段，参与者进行中断; do commit阶段，参与者进行提交。\r\n\r\n\r\n\r\n\r\n\r\n# 四、解决方案之==`TCC`==\r\n\r\n> **2PC 和 3PC 都是数据库层面的，而 TCC 是业务层面的分布式事务**，就像我前面说的分布式事务不仅仅包括数据库的操作，还包括发送短信等，这时候 TCC 就派上用场了！\r\n\r\n4.1.什么是TCC事务\r\n\r\nTCC是Try、Conﬁrm、Cancel三个词语的缩写，TCC要求每个分支事务实现三个操作：预处理Try、确认Conﬁrm、撤销Cancel。Try操作做业务检查及资源预留，Conﬁrm做业务确认操作，Cancel实现一个与Try相反的操作即回滚操作。TM首先发起所有的分支事务的try操作，任何一个分支事务的try操作执行失败，TM将会发起所有分支事务的Cancel操作，若try操作全部成功，TM将会发起所有分支事务的Conﬁrm操作，其中Conﬁrm/Cancel操作若执行失败，TM会进行重试。\r\n\r\n<img src=\"https://upload-images.jianshu.io/upload_images/10708517-79ae61c85f1bdddc.png\" alt=\"img\" style=\"zoom:50%;\" />\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190416211740360.png)\r\n\r\nTCC分为三个阶段：\r\n\r\n- Try阶段是做业务检查一致性及资源预留，此阶段仅是一个初步操作，它和后续的Confirm一起才能真正的构成一个完整的业务逻辑；\r\n- Confirm阶段是确认提交，Try阶段所有的分支事务执行成功后开始执行Confirm。通常情况下，采用TCC则认为Confirm阶段是不会出错的。即：只要Try成功，Confirm一定成功。若Confirm阶段真的出错了，需要引入重试机制或进行人工处理；\r\n- Cancel阶段是在业务执行错误需要回滚的状态下，执行分支事务的业务取消了，预留资源释放。通常情况下，采用TCC则认为Cancel阶段也是一定成功的。如果Cancel阶段真的出错了，需要引入重试机制或进行人工处理；\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190409113546636.png)\r\n\r\n> TCC **不存在资源阻塞**的问题，因为每个方法都直接进行事务的提交，一旦出现异常通过则 `Cancel` 来进行回滚补偿，这也就是常说的**补偿性事务**。\r\n>\r\n> 原本一个方法，现在却需要三个方法来支持，可以看到 TCC 对业务的侵入性很强，而且这种模式并不能很好地被复用，会导致开发量激增。还要考虑到网络波动等原因，为保证请求一定送达都会有重试机制，所以考虑到接口的幂等性。\r\n\r\n>  **TCC 对业务的侵入较大和业务紧耦合**，需要根据特定的场景和业务逻辑来设计相应的操作。\r\n>\r\n> 还有一点要注意，撤销和确认操作的执行可能需要重试，因此还需要保证**操作的幂等**。\r\n>\r\n> 相对于 2PC、3PC ，TCC 适用的范围更大，但是开发量也更大，毕竟都在业务上实现，而且有时候你会发现这三个方法还真不好写。不过也因为是在业务上实现的，所以**TCC可以跨数据库、跨不同的业务系统来实现事务**。\r\n\r\n\r\n\r\n## 4.2.   TCC 解决方案\r\n\r\n目前市面上的TCC框架众多比如下面这几种：\r\n\r\n（以下数据采集日为2019年07月11日）\r\n\r\n| **框架名称**    | **Gitbub地址**                                  | **star数量** |\r\n| --------------- | ----------------------------------------------- | ------------ |\r\n| tcc-transaction | https://github.com/changmingxie/tcc-transaction | 3850         |\r\n| Hmily           | https://github.com/yu199195/hmily               | 2407         |\r\n| ByteTCC         | https://github.com/liuyangming/ByteTCC          | 1947         |\r\n| EasyTransaction | https://github.com/QNJR-GROUP/EasyTransaction   | 1690         |\r\n\r\n \r\n\r\n上一节所讲的Seata也支持TCC，但**Seata的TCC模式对Spring Cloud并没有提供支持**。我们的目标是理解TCC的原理以及事务协调运作的过程，因此更请倾向于轻量级易于理解的框架，因此最终确定了Hmily。\r\n\r\nHmily是一个高性能分布式事务TCC开源框架。基于Java语言来开发（JDK1.8），支持Dubbo，Spring  Cloud等RPC框架进行分布式事务。它目前支持以下特性：\r\n\r\n- 支持嵌套事务(Nested transaction support).\r\n- 采用disruptor框架进行事务日志的异步读写，与RPC框架的性能毫无差别。\r\n- 支持SpringBoot-starter 项目启动，使用简单。\r\n- RPC框架支持 : dubbo,motan,springcloud。\r\n- 本地事务存储支持 : redis,mongodb,zookeeper,ﬁle,mysql。\r\n- 事务日志序列化支持 ：java，hessian，kryo，protostuﬀ。\r\n- 采用Aspect AOP 切面思想与Spring无缝集成，天然支持集群。\r\n- RPC事务恢复，超时异常恢复等。\r\n\r\nHmily利用AOP对参与分布式事务的本地方法与远程方法进行拦截处理，通过多方拦截，事务参与者能透明的调用到另一方的Try、Conﬁrm、Cancel方法；传递事务上下文；并记录事务日志，酌情进行补偿，重试等。\r\n\r\nHmily不需要事务协调服务，但需要提供一个数据库(mysql/mongodb/zookeeper/redis/ﬁle)来进行日志存储。\r\n\r\nHmily实现的TCC服务与普通的服务一样，只需要暴露一个接口，也就是它的Try业务。Conﬁrm/Cancel业务逻辑，只是因为全局事务提交/回滚的需要才提供的，因此Conﬁrm/Cancel业务只需要被Hmily TCC事务框架发现即可，不需要被调用它的其他业务服务所感知。\r\n\r\n官网介绍：https://dromara.org/website/zh-cn/docs/hmily/index.html\r\n\r\n \r\n\r\nTCC需要注意三种异常处理分别是空回滚、幂等、悬挂:\r\n\r\n##### **1）空回滚**：\r\n\r\n解释：在没有调用 TCC 资源 Try 方法的情况下，调用了二阶段的 Cancel 方法，Cancel 方法需要识别出这是一个空回滚，然后直接返回成功。\r\n\r\n出现原因：当一个分支事务所在服务宕机或网络异常，分支事务调用记录为失败，这个时候其实是没有执行Try阶段，当故障恢复后，分布式事务进行回滚则会调用二阶段的Cancel方法，从而形成空回滚。\r\n\r\n解决思路是关键就是要识别出这个空回滚。思路很简单就是需要知道一阶段是否执行，如果执行了，那就是正常回滚；如果没执行，那就是空回滚。前面已经说过TM在发起全局事务时生成全局事务记录，全局事务ID贯穿整个分布式事务调用链条。再额外增加一张分支事务记录表，其中有全局事务 ID 和分支事务 ID，**第一阶段 Try 方法里会插入一条记录，表示一阶段执行了**。**Cancel 接口里读取该记录，如果该记录存在，则正常回滚；如果该记录不存在，则是空回滚**。\r\n\r\n##### **2）幂等**：\r\n\r\n通过前面介绍已经了解到，为了保证TCC二阶段提交重试机制不会引发数据不一致，要求 TCC  的二阶段 Try、\r\n\r\nConﬁrm 和 Cancel 接口保证幂等，这样不会重复使用或者释放资源。如果幂等控制没有做好，很有可能导致数据不一致等严重问题。\r\n\r\n解决思路在上述“分支事务记录”中增加执行状态，每次执行前都查询该状态。\r\n\r\n##### **3）悬挂**：\r\n\r\n说明：悬挂就是对于一个分布式事务，其二阶段 Cancel 接口比 Try 接口先执行。\r\n\r\n出现原因：在 RPC 调用分支事务try时，先注册分支事务，再执行RPC调用，如果此时 RPC 调用的网络发生拥堵，通常 RPC 调用是有超时时间的，RPC 超时以后，TM就会通知RM回滚该分布式事务，可能回滚完成后，RPC 请求才到达参与者真正执行，而一个 Try 方法预留的业务资源，只有该分布式事务才能使用，该分布式事务第一阶段预留的业务资源就再也没有人能够处理了，对于这种情况，我们就称为悬挂，即业务资源预留后没法继续处理。\r\n\r\n解决思路：如果二阶段执行完成，那一阶段就不能再继续执行。在执行一阶段事务时判断在该全局事务下，**“分支事务记录”表中是否已经有二阶段事务记录，如果有则不执行Try**。\r\n\r\n \r\n\r\n举例，场景为 A 转账 30 元给 B，A和B账户在不同的服务。\r\n\r\n方案1：\r\n\r\n账户A\r\n\r\n```\r\ntry：\r\n	检查余额是否够30元\r\n	扣减30元\r\nconfirm：\r\n	空\r\ncancel：\r\n	增加30元\r\n```\r\n\r\n账户B\r\n\r\n```\r\ntry：\r\n	增加30元\r\nconfirm：\r\n	空\r\ncancel：\r\n	减少30元\r\n```\r\n\r\n#### 方案1说明：\r\n\r\n1）账户A，这里的余额就是所谓的业务资源，按照前面提到的原则，在第一阶段需要检查并预留业务资源，因此，我们在扣钱 TCC 资源的 Try 接口里先检查 A 账户余额是否足够，如果足够则扣除 30 元。 Conﬁrm 接口表示正式提交，由于业务资源已经在 Try 接口里扣除掉了，那么在第二阶段的 Conﬁrm 接口里可以什么都不用做。Cancel接口的执行表示整个事务回滚，账户A回滚则需要把 Try 接口里扣除掉的 30 元还给账户。\r\n\r\n2）账号B，在第一阶段 Try  接口里实现给账户B加钱，Cancel  接口的执行表示整个事务回滚，账户B回滚则需要把Try 接口里加的 30 元再减去。\r\n\r\n#### 方案1的问题分析：\r\n\r\n1）如果账户A的try没有执行，直接cancel则就多加了30元。\r\n\r\n2）由于try，cancel、conﬁrm都是由单独的线程去调用，且会出现重复调用，所以都需要实现幂等。\r\n\r\n3）账号B在try中增加30元，当try执行完成后可能会其它线程给消费了。\r\n\r\n4）如果账户B的try没有执行在cancel则就多减了30元。\r\n\r\n#### 问题解决：\r\n\r\n1）账户A的cancel方法需要判断try方法是否执行，正常执行try后方可执行cancel。\r\n\r\n2）try，cancel、conﬁrm方法实现幂等。\r\n\r\n3）账号B在try方法中不允许更新账户金额，在conﬁrm中更新账户金额。\r\n\r\n4）账户B的cancel方法需要判断try方法是否执行，正常执行try后方可执行cancel。\r\n\r\n##### **优化方案**：\r\n\r\n> 加钱的操作要在第二阶段进行，减钱的操作无所谓\r\n>\r\n> 要防止还没执行第一阶段就执行第二阶段的情况，所以在操作钱前面加个幂等\r\n>\r\n\r\n账户A\r\n\r\n```bash\r\ntry：\r\n    try幂等校验\r\n    try悬挂处理\r\n    检查余额是否够30元\r\n    扣减30元\r\nconfirm：\r\n    空\r\ncancel：\r\n    cancel幂等校验\r\n    cancel空回滚处理\r\n    增加可用余额30元\r\n```\r\n\r\n账户B\r\n\r\n```bash\r\ntry：\r\n    空\r\nconfirm：\r\n    confirm幂等校验\r\n    正式增加30元\r\ncancel：\r\n    空\r\n```\r\n\r\n## 4.3.   ==`Hmily`实现TCC事务==\r\n\r\n### 4.3.1 .业务说明\r\n\r\n本实例通过Hmily实现TCC分布式事务，模拟两个账户的转账交易过程。\r\n\r\n两个账户分别在不同的银行(张三在bank1、李四在bank2)，bank1、bank2是两个微服务。\r\n\r\n交易过程是，张三给李四转账指定金额。\r\n\r\n上述交易步骤，要么一起成功，要么一起失败，必须是一个整体性的事务。\r\n\r\n4.3.2 .程序组成部分\r\n\r\n```\r\n微服务：spring-boot-2.1.3、spring-cloud-Greenwich.RELEASE\r\n\r\nHmily：hmily-springcloud.2.0.4-RELEASE\r\n\r\n微服务及数据库的关系 ：\r\ndtx/dtx-tcc-demo/dtx-tcc-demo-bank1 银行1，操作张三账户， 连接数据库bank1\r\ndtx/dtx-tcc-demo/dtx-tcc-demo-bank2 银行2，操作李四账户，连接数据库bank2\r\n\r\n服务注册中心：dtx/discover-server\r\n```\r\n\r\n\r\n\r\n4.3.3 .创建数据库\r\n\r\n导入数据库脚本：资料\\sql\\bank1.sql、资料\\sql\\bank2.sql、已经导过不用重复导入。\r\n\r\n创建hmily数据库，用于存储hmily框架记录的数据。\r\n\r\n```mysql\r\nCREATE DATABASE `hmily` CHARACTER SET \'utf8\' COLLATE \'utf8_general_ci\';\r\n```\r\n\r\n每个数据库都创建try、conﬁrm、cancel三张日志表：\r\n\r\n ```mysql\r\n# 前面说了顺利可能会很乱，所以需要为各个阶段建立表\r\nCREATE TABLE `local_try_log` (\r\n    `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n    `create_time` datetime DEFAULT NULL,\r\n    PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8\r\nCREATE TABLE `local_confirm_log` (\r\n    `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n    `create_time` datetime DEFAULT NULL\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8\r\nCREATE TABLE `local_cancel_log` (\r\n    `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n    `create_time` datetime DEFAULT NULL,\r\n    PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 \r\n ```\r\n\r\n4.3.5 discover-server\r\n\r\ndiscover-server是服务注册中心，测试工程将自己注册至discover-server。\r\n\r\n导入：资料\\基础代码\\dtx 父工程，此工程自带了discover-server，discover-server基于Eureka实现。已经导过不用重复导入。\r\n\r\n### 4.3.6 导入案例工程dtx-tcc-demo\r\n\r\ndtx-tcc-demo是tcc的测试工程，根据业务需求需要创建两个dtx-tcc-demo工程。\r\n\r\n（1）导入dtx-tcc-demo\r\n\r\n```\r\n导入：资料\\基础代码\\dtx-tcc-demo到父工程dtx下。两个测试工程如下：\r\n\r\ndtx/dtx-tcc-demo/dtx-tcc-demo-bank1 银行1，操作张三账户，连接数据库bank1\r\ndtx/dtx-tcc-demo/dtx-tcc-demo-bank2  银行2，操作李四账户，连接数据库bank2\r\n```\r\n\r\n（2）引入maven依赖\r\n\r\n（3）配置hmily application.yml：\r\n\r\n ```yaml\r\norg:\r\n  dromara:\r\n    hmily :\r\n      serializer : kryo\r\n      recoverDelayTime : 30\r\n      retryMax : 30\r\n      scheduledDelay : 30\r\n      scheduledThreadMax :  10\r\n      repositorySupport : db\r\n      started: true  # 在bank2下为false\r\n      hmilyDbConfig :\r\n        driverClassName  : com.mysql.jdbc.Driver\r\n        url :  jdbc:mysql://localhost:3306/hmily?useUnicode=true\r\n        username : root\r\n        password : mysql\r\n ```\r\n\r\n新增配置类接收application.yml中的Hmily配置信息，并创建HmilyTransactionBootstrap   Bean：\r\n\r\n \r\n\r\n[启动类增加@EnableAspectJAutoProxy并增加org.dromara.hmily的扫描项](mailto:启动类增加@EnableAspectJAutoProxy并增加org.dromara.hmily的扫描项)：\r\n\r\n \r\n\r\n### 4.3.7 dtx-tcc-demo-bank1\r\n\r\ndtx-tcc-demo-bank1实现try和cancel方法，如下\r\n\r\n```java\r\n@Configuration\r\n@EnableAspectJAutoProxy(proxyTargetClass=true)\r\npublic class DatabaseConfiguration {\r\n\r\n    @Autowired\r\n    private Environment env;\r\n\r\n    @Bean\r\n    @ConfigurationProperties(prefix = \"spring.datasource.ds0\")\r\n    public DruidDataSource ds0() {\r\n        // 是绑定这个bean的属性\r\n        DruidDataSource druidDataSource = new DruidDataSource();\r\n        return druidDataSource;\r\n    }\r\n\r\n    @Bean\r\n    public HmilyTransactionBootstrap hmilyTransactionBootstrap(HmilyInitService hmilyInitService){\r\n        HmilyTransactionBootstrap hmilyTransactionBootstrap = new HmilyTransactionBootstrap(hmilyInitService);\r\n        hmilyTransactionBootstrap.setSerializer(env.getProperty(\"org.dromara.hmily.serializer\"));\r\n        hmilyTransactionBootstrap.setRecoverDelayTime(Integer.parseInt(env.getProperty(\"org.dromara.hmily.recoverDelayTime\")));\r\n        hmilyTransactionBootstrap.setRetryMax(Integer.parseInt(env.getProperty(\"org.dromara.hmily.retryMax\")));\r\n        hmilyTransactionBootstrap.setScheduledDelay(Integer.parseInt(env.getProperty(\"org.dromara.hmily.scheduledDelay\")));\r\n        hmilyTransactionBootstrap.setScheduledThreadMax(Integer.parseInt(env.getProperty(\"org.dromara.hmily.scheduledThreadMax\")));\r\n        hmilyTransactionBootstrap.setRepositorySupport(env.getProperty(\"org.dromara.hmily.repositorySupport\"));\r\n        hmilyTransactionBootstrap.setStarted(Boolean.parseBoolean(env.getProperty(\"org.dromara.hmily.started\")));\r\n        HmilyDbConfig hmilyDbConfig = new HmilyDbConfig();\r\n        hmilyDbConfig.setDriverClassName(env.getProperty(\"org.dromara.hmily.hmilyDbConfig.driverClassName\"));\r\n        hmilyDbConfig.setUrl(env.getProperty(\"org.dromara.hmily.hmilyDbConfig.url\"));\r\n        hmilyDbConfig.setUsername(env.getProperty(\"org.dromara.hmily.hmilyDbConfig.username\"));\r\n        hmilyDbConfig.setPassword(env.getProperty(\"org.dromara.hmily.hmilyDbConfig.password\"));\r\n        hmilyTransactionBootstrap.setHmilyDbConfig(hmilyDbConfig);\r\n        return hmilyTransactionBootstrap;\r\n    }\r\n\r\n\r\n    /*@Bean\r\n    @ConfigurationProperties(prefix = \"org.dromara.hmily\")\r\n    public HmilyConfig hmilyConfig(){\r\n        return new HmilyConfig();\r\n    }\r\n\r\n    @Bean\r\n    public HmilyTransactionBootstrap hmilyTransactionBootstrap(HmilyInitService hmilyInitService, HmilyConfig hmilyConfig){\r\n        HmilyTransactionBootstrap hmilyTransactionBootstrap = new HmilyTransactionBootstrap(hmilyInitService);\r\n        return hmilyTransactionBootstrap;\r\n    }*/\r\n}\r\n```\r\n\r\n##### 1） Dao\r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountInfoDao {\r\n    @Update(\"update account_info set account_balance=account_balance - #{amount} where account_balance>=#{amount} and account_no=#{accountNo} \")\r\n    int subtractAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n    @Update(\"update account_info set account_balance=account_balance + #{amount} where account_no=#{accountNo} \")\r\n    int addAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n    /**\r\n     * 增加某分支事务try执行记录\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Insert(\"insert into local_try_log values(#{txNo},now());\")\r\n    int addTry(String localTradeNo);\r\n\r\n    @Insert(\"insert into local_confirm_log values(#{txNo},now());\")\r\n    int addConfirm(String localTradeNo);\r\n\r\n    @Insert(\"insert into local_cancel_log values(#{txNo},now());\")\r\n    int addCancel(String localTradeNo);\r\n\r\n    /**\r\n     * 查询分支事务try是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_try_log where tx_no = #{txNo} \")\r\n    int isExistTry(String localTradeNo);\r\n    /**\r\n     * 查询分支事务confirm是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_confirm_log where tx_no = #{txNo} \")\r\n    int isExistConfirm(String localTradeNo);\r\n\r\n    /**\r\n     * 查询分支事务cancel是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_cancel_log where tx_no = #{txNo} \")\r\n    int isExistCancel(String localTradeNo);\r\n\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n##### 2） ==try和cancel方法==\r\n\r\n> 前面我们说过了Seata会携带事务ID，同样Hmily也会携带事务ID\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Autowired\r\n    Bank2Client bank2Client;\r\n\r\n    // 账户扣款，就是tcc的try方法\r\n\r\n    /**\r\n     * 	try幂等校验\r\n     * 	try悬挂处理\r\n     * 	检查余额是够扣减金额\r\n     * 	扣减金额、\r\n     */\r\n    @Override\r\n    @Transactional\r\n    //只要标记@Hmily就是try方法，在注解中指定confirm、cancel两个方法的名字\r\n    @Hmily(confirmMethod=\"commit\",cancelMethod=\"rollback\")\r\n    public void updateAccountBalance(String accountNo, Double amount) {\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank1 try begin 开始执行...xid:{}\",transId);\r\n        \r\n        //幂等判断 判断local_try_log表中是否有try日志记录，如果有则不再执行\r\n        if(accountInfoDao.isExistTry(transId)>0){\r\n            log.info(\"bank1 try 已经执行，无需重复执行,xid:{}\",transId);\r\n            return ;\r\n        }\r\n\r\n        //try悬挂处理，如果cancel、confirm有一个已经执行了，try不再执行\r\n        if(accountInfoDao.isExistConfirm(transId)>0 || accountInfoDao.isExistCancel(transId)>0){\r\n            log.info(\"bank1 try悬挂处理  cancel或confirm已经执行，不允许执行try,xid:{}\",transId);\r\n            return ;\r\n        }\r\n\r\n        //扣减金额\r\n        if(accountInfoDao.subtractAccountBalance(accountNo, amount)<=0){\r\n            //扣减失败\r\n            throw new RuntimeException(\"bank1 try 扣减金额失败,xid:{}\"+transId);\r\n        }\r\n        //插入try执行记录,用于幂等判断\r\n        accountInfoDao.addTry(transId);\r\n\r\n        //远程调用李四，转账\r\n        if(!bank2Client.transfer(amount)){\r\n            throw new RuntimeException(\"bank1 远程调用李四微服务失败,xid:{}\"+transId);\r\n        }\r\n        if(amount == 2){\r\n            throw new RuntimeException(\"人为制造异常,xid:{}\"+transId);\r\n        }\r\n        log.info(\"bank1 try end 结束执行...xid:{}\",transId);\r\n    }\r\n\r\n    //confirm方法\r\n    @Transactional\r\n    public void commit(String accountNo, Double amount){\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank1 confirm begin 开始执行...xid:{},accountNo:{},amount:{}\",transId,accountNo,amount);\r\n    }\r\n\r\n\r\n    /** cancel方法\r\n     * 	cancel幂等校验\r\n     * 	cancel空回滚处理\r\n     * 	增加可用余额\r\n     */\r\n    @Transactional\r\n    public void rollback(String accountNo, Double amount){\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank1 cancel begin 开始执行...xid:{}\",transId);\r\n        //	cancel幂等校验\r\n        if(accountInfoDao.isExistCancel(transId)>0){\r\n            log.info(\"bank1 cancel 已经执行，无需重复执行,xid:{}\",transId);\r\n            return ;\r\n        }\r\n        //cancel空回滚处理，如果try没有执行，cancel不允许执行\r\n        if(accountInfoDao.isExistTry(transId)<=0){\r\n            log.info(\"bank1 空回滚处理，try没有执行，不允许cancel执行,xid:{}\",transId);\r\n            return ;\r\n        }\r\n        //	增加可用余额\r\n        accountInfoDao.addAccountBalance(accountNo,amount);\r\n        //插入一条cancel的执行记录\r\n        accountInfoDao.addCancel(transId);\r\n        log.info(\"bank1 cancel end 结束执行...xid:{}\",transId);\r\n    }\r\n}\r\n```\r\n\r\n##### 3） feignClient\r\n\r\n```java\r\n@FeignClient(value=\"tcc-demo-bank2\",fallback=Bank2ClientFallback.class)\r\npublic interface Bank2Client {\r\n    //远程调用李四的微服务\r\n    @GetMapping(\"/bank2/transfer\")\r\n    @Hmily // 是为了携带事务ID\r\n    public Boolean transfer(@RequestParam(\"amount\") Double amount);\r\n}\r\n@Component\r\npublic class Bank2ClientFallback implements Bank2Client {\r\n\r\n    @Override\r\n    public Boolean transfer(Double amount) {\r\n        return false;\r\n    }\r\n}\r\n```\r\n\r\n##### 4) Controller\r\n\r\n\r\n\r\n### 4.3.8 dtx-tcc-demo-bank2\r\n\r\ndtx-tcc-demo-bank2实现如下功能：\r\n\r\n \r\n\r\n1）Dao\r\n\r\n```java\r\n@Component\r\n@Mapper\r\npublic interface AccountInfoDao {\r\n\r\n    @Update(\"update account_info set account_balance=account_balance + #{amount} where  account_no=#{accountNo} \")\r\n    int addAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n    /**\r\n     * 增加某分支事务try执行记录\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Insert(\"insert into local_try_log values(#{txNo},now());\")\r\n    int addTry(String localTradeNo);\r\n\r\n    @Insert(\"insert into local_confirm_log values(#{txNo},now());\")\r\n    int addConfirm(String localTradeNo);\r\n\r\n    @Insert(\"insert into local_cancel_log values(#{txNo},now());\")\r\n    int addCancel(String localTradeNo);\r\n\r\n    /**\r\n     * 查询分支事务try是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_try_log where tx_no = #{txNo} \")\r\n    int isExistTry(String localTradeNo);\r\n    /**\r\n     * 查询分支事务confirm是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_confirm_log where tx_no = #{txNo} \")\r\n    int isExistConfirm(String localTradeNo);\r\n\r\n    /**\r\n     * 查询分支事务cancel是否已执行\r\n     * @param localTradeNo 本地事务编号\r\n     */\r\n    @Select(\"select count(1) from local_cancel_log where tx_no = #{txNo} \")\r\n    int isExistCancel(String localTradeNo);\r\n}\r\n```\r\n\r\n##### 2）实现conﬁrm方法\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Override\r\n    @Hmily(confirmMethod=\"confirmMethod\", cancelMethod=\"cancelMethod\")\r\n    public void updateAccountBalance(String accountNo, Double amount) {\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank2 try begin 开始执行...xid:{}\",transId);\r\n    }\r\n\r\n    /**\r\n     * confirm方法\r\n     * 	confirm幂等校验\r\n     * 	正式增加金额\r\n     * @param accountNo\r\n     * @param amount\r\n     */\r\n    @Transactional\r\n    public void confirmMethod(String accountNo, Double amount){\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank2 confirm begin 开始执行...xid:{}\",transId);\r\n        if(accountInfoDao.isExistConfirm(transId)>0){\r\n            log.info(\"bank2 confirm 已经执行，无需重复执行...xid:{}\",transId);\r\n            return ;\r\n        }\r\n        //增加金额\r\n        accountInfoDao.addAccountBalance(accountNo,amount);\r\n        //增加一条confirm日志，用于幂等\r\n        accountInfoDao.addConfirm(transId);\r\n        log.info(\"bank2 confirm end 结束执行...xid:{}\",transId);\r\n    }\r\n\r\n\r\n\r\n    /**\r\n     * @param accountNo\r\n     * @param amount\r\n     */\r\n    public void cancelMethod(String accountNo, Double amount){\r\n        //获取全局事务id\r\n        String transId = HmilyTransactionContextLocal.getInstance().get().getTransId();\r\n        log.info(\"bank2 cancel begin 开始执行...xid:{}\",transId);\r\n\r\n    }\r\n}\r\n```\r\n\r\n3）Controller\r\n\r\n```java\r\n@RestController\r\npublic class Bank2Controller {\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    @RequestMapping(\"/transfer\")\r\n    public Boolean transfer(@RequestParam(\"amount\") Double amount) {\r\n        this.accountInfoService.updateAccountBalance(\"2\", amount);\r\n        return true;\r\n    }\r\n}\r\n```\r\n\r\n### 3.3.9 测试场景\r\n\r\n- 张三向李四转账成功。\r\n- 李四事务失败，张三事务回滚成功。\r\n- 张三事务失败，李四分支事务回滚成功。\r\n- 分支事务超时测试。\r\n\r\n> 测试时注意清空库\r\n\r\n## 4.4.小结\r\n\r\n如果拿TCC事务的处理流程与2PC两阶段提交做比较，2PC通常都是在跨库的DB层面，而TCC则在应用层面的处理，需要通过业务逻辑来实现。这种分布式事务的实现方式的优势在于，可以让**应用自己定义数据操作的粒度，使得降低锁冲突、提高吞吐量成为可能**。\r\n\r\n而不足之处则在于对应用的**侵入性非常强**，业务逻辑的每个分支都需要实现try、conﬁrm、cancel三个操作。此外，其实现难度也比较大，需要按照网络状态、系统故障等不同的失败原因实现不同的回滚策略。\r\n\r\n# 五、解决方案之可靠消息最终一致性\r\n\r\n## 5.1 .什么是可靠消息最终一致性事务\r\n\r\n可靠消息最终一致性方案是指当事务发起方执行完成本地事务后并发出一条消息，事务参与方(消息消费者)一定能够接收消息并处理事务成功，此方案强调的是只要消息发给事务参与方最终事务要达到一致。\r\n\r\n> 假设消息中间件是可靠的\r\n\r\n此方案是利用消息中间件完成，如下图：\r\n\r\n```\r\n           网络1              网络2\r\n事务发起方---------消息中间件-----------事务参与方\r\n```\r\n\r\n事务发起方（消息生产方）将消息发给消息中间件，事务参与方从消息中间件接收消息，事务发起方和消息中间件之间，事务参与方（消息消费方）和消息中间件之间都是通过网络通信，由于网络通信的不确定性会导致分布式事务问题。\r\n\r\n因此可靠消息最终一致性方案要解决以下几个问题：\r\n\r\n#### 1.本地事务与消息发送的原子性问题\r\n\r\n本地事务与消息发送的原子性问题即：事务发起方在本地事务执行成功后消息必须发出去，否则就丢弃消息。即实现本地事务和消息发送的原子性，要么都成功，要么都失败。本地事务与消息发送的原子性问题是实现可靠消息最终一致性方案的关键问题。\r\n\r\n先来尝试下这种操作，先发送消息，再操作数据库：\r\n\r\n```mysql\r\nbegin transaction；\r\n    //1.发送MQ\r\n    //2.数据库操作\r\ncommit transation;\r\n```\r\n\r\n这种情况下无法保证数据库操作与发送消息的一致性，因为可能发送消息成功，数据库操作失败。\r\n\r\n你立马想到第二种方案，先进行数据库操作，再发送消息：\r\n\r\n```mysql\r\nbegin transaction；\r\n    //1.数据库操作\r\n    //2.发送MQ\r\ncommit transation;\r\n```\r\n\r\n这种情况下貌似没有问题，如果发送MQ消息失败，就会抛出异常，导致数据库事务回滚。\r\n\r\n但如果是**超时异常，数据库回滚，但MQ其实已经正常发送了**，同样会导致不一致。\r\n\r\n> 所以在后面不直接发MQ了，而是打日志数据库，然后定时任务扫描日志数据库去发消息\r\n\r\n#### 2、事务参与方接收消息的可靠性\r\n\r\n事务参与方必须能够从消息队列接收到消息，如果接收消息失败可以重复接收消息。\r\n\r\n#### 3、消息重复消费的问题\r\n\r\n由于网络2的存在，若某一个消费节点超时但是消费成功，此时消息中间件会重复投递此消息，就导致了消息的重复消费。\r\n\r\n要解决消息重复消费的问题就要实现事务参与方的方法**幂等性**。\r\n\r\n> 通过确认机制\r\n\r\n## 5.2 .解决方案\r\n\r\n上节讨论了可靠消息最终一致性事务方案需要解决的问题，本节讨论具体的解决方案。\r\n\r\n### 5.2.1.**本地消息表**方案\r\n\r\n本地消息表这个方案最初是eBay提出的，此方案的核心是通过本地事务保证数据业务操作和消息的一致性，然后通过定时任务将消息发送至消息中间件，待确认消息发送给消费方成功再将消息删除。\r\n\r\n下面以注册送积分为例来说明：\r\n\r\n下例共有两个微服务交互，用户服务和积分服务，用户服务负责添加用户，积分服务负责增加积分。\r\n\r\n![请添加图片描述](https://img-blog.csdnimg.cn/38d33497287b4178bb961fb97bafa65a.png)\r\n\r\n> 日志也是数据库\r\n>\r\n> 然后是定时任务扫描刚才的日志表\r\n\r\n> 本地消息表其实就是利用了 **各系统本地的事务**来实现分布式事务。\r\n>\r\n> 本地消息表顾名思义就是会有一张存放本地消息的表，一般都是放在数据库中，然后在执行业务的时候 **将业务的执行和将消息放入消息表中的操作放在同一个事务中**，这样就能保证消息放入本地表中业务肯定是执行成功的。\r\n>\r\n> 然后再去调用下一个操作，如果下一个操作调用成功了好说，消息表的消息状态可以直接改成已成功。\r\n>\r\n> 如果调用失败也没事，会有 **后台任务定时去读取本地消息表**，筛选出还未成功的消息再调用对应的服务，服务更新成功了再变更消息的状态。\r\n>\r\n> 这时候有可能消息对应的操作不成功，因此也需要重试，重试就得保证对应服务的方法是幂等的，而且一般重试会有最大次数，超过最大次数可以记录下报警让人工处理。\r\n>\r\n> 可以看到本地消息表其实实现的是**最终一致性**，容忍了数据暂时不一致的情况。\r\n\r\n交互流程如下：\r\n\r\n#### 1、用户注册\r\n\r\n用户服务在本地事务新增用户和增加 ”积分消息日志“。（用户表和消息表通过本地事务保证一致）下边是伪代码\r\n\r\n```mysql\r\nbegin transaction；\r\n    //1.新增用户\r\n    //2.存储积分消息日志\r\ncommit transation;\r\n```\r\n\r\n这种情况下，本地数据库操作与存储积分消息日志处于同一个事务中，**本地数据库操作与记录消息日志操作具备原子性**。\r\n\r\n#### 2、定时任务扫描日志\r\n\r\n如何保证将消息发送给消息队列呢？\r\n\r\n经过第一步消息已经写到消息日志表中，可以启动独立的线程，定时对消息日志表中的消息进行扫描并发送至消息中间件，在消息中间件反馈发送成功后删除该消息日志，否则等待定时任务下一周期重试。\r\n\r\n#### 3、消费消息\r\n\r\n如何保证消费者一定能消费到消息呢？\r\n\r\n这里可以使用MQ的ack（即**消息确认**）机制，消费者监听MQ，如果消费者接收到消息并且业务处理完成后向MQ发送ack（即消息确认），此时说明消费者正常消费消息完成，MQ将不再向消费者推送消息，否则消费者会不断重试向消费者来发送消息。\r\n\r\n积分服务接收到”增加积分“消息，开始增加积分，积分增加成功后向消息中间件回应ack，否则消息中间件将重复投递此消息。\r\n\r\n由于消息会重复投递，积分服务的”增加积分“功能需要实现幂等性。\r\n\r\n\r\n\r\n### 5.2.2.**RocketMQ事务消息**方案\r\n\r\nRocketMQ 是一个来自阿里巴巴的分布式消息中间件，于 2012 年开源，并在 2017 年正式成为 Apache 顶级项目。据了解，包括阿里云上的消息产品以及收购的子公司在内，阿里集团的消息产品全线都运行在 RocketMQ 之上，并且最近几年的双十一大促中，RocketMQ 都有抢眼表现。Apache RocketMQ 4.3之后的版本正式支持事务消息，为分布式事务实现提供了便利性支持。\r\n\r\nRocketMQ 事务消息设计则主要是为了**解决 Producer 端的消息发送与本地事务执行的原子性问题**，RocketMQ 的设计中 broker 与 producer 端的双向通信能力，使得 broker 天生可以作为一个事务协调者存在；而 RocketMQ本身提供的存储机制为事务消息提供了持久化能力；RocketMQ 的高可用机制以及可靠消息设计则为事务消息在系统发生异常时依然能够保证达成事务的最终一致性。\r\n\r\n在RocketMQ4.3后实现了完整的事务消息，实际上其实是对本地消息表的一个封装，将本地消息表移动到了MQ内部，解决 Producer 端的消息发送与本地事务执行的原子性问题。\r\n\r\n \r\n\r\n> 1加钱，发送放收到2ACK后，（此时还不让消费者消费），\r\n>\r\n> 然后开始执行本地事务，执行完后生产者发送commit消息（或者rollback），这时就可被消费了（rollback就不能被消费）\r\n>\r\n> 为了防止commit消息丢失，消息中间件没收到commit时会定时回查发送者发过没有\r\n\r\n##### ==执行流程==\r\n\r\n> 总的来说就是我们调用的是发消息的接口，此时发MQ还只是发了半消息，\r\n>\r\n> 发送完后自动回调事务代码，\r\n>\r\n> 事务代码提交后发送commit消息\r\n>\r\n> 收到commit-ACK后提交本地事务\r\n>\r\n> 说明：我们只保证了生产者，至于消费者，那是MQ中间件需要保证的\r\n\r\n为方便理解我们还以**注册送积分**的例子来描述 整个流程。\r\n\r\nProducer 即MQ发送方，本例中是用户服务，负责新增用户。MQ订阅方即消息消费方，本例中是积分服务，负责新增积分。\r\n\r\n1、Producer 发送事务消息\r\n\r\nProducer （MQ发送方）发送事务消息至MQ Server，MQ Server将消息状态标记为Prepared（预备状态），注意此时这条消息消费者（MQ订阅方）是无法消费到的。\r\n\r\n本例中，Producer 发送 ”增加积分消息“ 到MQ Server。\r\n\r\n2、MQ Server回应消息发送成功\r\n\r\nMQ  Server接收到Producer 发送给的消息则回应发送成功表示MQ已接收到消息。\r\n\r\n3、Producer 执行本地事务\r\n\r\nProducer 端执行业务代码逻辑，通过本地数据库事务控制。本例中，Producer 执行添加用户操作。\r\n\r\n4、消息投递\r\n\r\n若Producer 本地事务执行成功则自动向MQServer发送commit消息，MQ Server接收到commit消息后将”增加积分消息“ 状态标记为可消费，此时MQ订阅方（积分服务）即正常消费消息；\r\n\r\n若Producer 本地事务执行失败则自动向MQServer发送rollback消息，MQ Server接收到rollback消息后 将删除”增加积分消息“ 。\r\n\r\nMQ订阅方（积分服务）消费消息，消费成功则向MQ回应ack，否则将重复接收消息。这里ack默认自动回应，即程序执行正常则自动回应ack。\r\n\r\n5、事务回查\r\n\r\n如果执行Producer端本地事务过程中，执行端挂掉，或者超时，MQ  Server将会不停的询问同组的其他  Producer\r\n\r\n来获取事务执行状态，这个过程叫**事务回查**。MQ   Server会根据事务回查结果来决定是否投递消息。\r\n\r\n以上主干流程已由RocketMQ实现，对用户侧来说，用户需要分别实现本地事务执行以及本地事务回查方法，因此只需关注本地事务的执行状态即可。\r\n\r\n![img](https://pic2.zhimg.com/80/v2-72ba7bed684e855606c44ddda185987d_1440w.jpg)\r\n\r\n\r\n\r\n==RocketMQ提供RocketMQLocalTransactionListener接口：==\r\n\r\n```java\r\npublic interface RocketMQLocalTransactionListener {\r\n    /**\r\n    ‐ 发送prepare消息成功此方法被回调，该方法用于执行本地事务\r\n    ‐ @param msg 回传的消息，利用transactionId即可获取到该消息的唯一Id\r\n    ‐ @param arg 调用send方法时传递的参数，当send时候若有额外的参数可以传递到send方法中，这里能获取到\r\n    ‐ @return 返回事务状态，COMMIT：提交 ROLLBACK：回滚 UNKNOW：回调\r\n    */\r\n    RocketMQLocalTransactionState executeLocalTransaction(Message msg, Object arg);\r\n    /**\r\n    ‐ @param msg 通过获取transactionId来判断这条消息的本地事务执行状态\r\n    ‐ @return 返回事务状态，COMMIT：提交 ROLLBACK：回滚 UNKNOW：回调\r\n    */\r\n    RocketMQLocalTransactionState checkLocalTransaction(Message msg);\r\n}\r\n```\r\n\r\n发送事务消息：\r\n\r\n以下是RocketMQ提供用于发送事务消息的API：\r\n\r\n```java\r\nTransactionMQProducer producer = new TransactionMQProducer(\"ProducerGroup\");\r\nproducer.setNamesrvAddr(\"127.0.0.1:9876\");\r\nproducer.start();\r\n//设置TransactionListener实现\r\nproducer.setTransactionListener(transactionListener）；\r\n//发送事务消息\r\nSendResult sendResult = producer.sendMessageInTransaction(msg, null);\r\n```\r\n\r\n> 实现：业务处理服务在业务事务提交之前，向实时消息服务请求发送捎息，实时捎息服务只记录消息数据，而不是真正的发送。业务处理服务在业务事务提交之后，向实时消息服务确认发送。只有在得到确认发送指令后，实时消息服务才会真正发送。\r\n>\r\n> ##### **消息事务**\r\n>\r\n> RocketMQ 就很好的支持了消息事务，让我们来看一下如何通过消息实现事务。\r\n>\r\n> 第一步先给 Broker 发送事务消息即半消息，**半消息不是说一半消息，而是这个消息对消费者来说不可见**，然后**发送成功后发送方再执行本地事务**。\r\n>\r\n> 再根据**本地事务的结果向 Broker 发送 Commit 或者 RollBack 命令**。\r\n>\r\n> 并且 RocketMQ 的发送方会提供一个**反查事务状态接口**，如果一段时间内半消息没有收到任何操作请求，那么 Broker 会通过反查接口得知发送方事务是否执行成功，然后执行 Commit 或者 RollBack 命令。\r\n>\r\n> 如果是 Commit 那么订阅方就能收到这条消息，然后再做对应的操作，做完了之后再消费这条消息即可。\r\n>\r\n> 如果是 RollBack 那么订阅方收不到这条消息，等于事务就没执行过。\r\n\r\n## 5.3. RocketMQ实现==可靠消息最终一致性==事务\r\n\r\n### 5.3.1 .业务说明\r\n\r\n本实例通过RocketMQ中间件实现可靠消息最终一致性分布式事务，模拟两个账户的转账交易过程。\r\n\r\n两个账户在分别在不同的银行(张三在bank1、李四在bank2)，bank1、bank2是两个微服务。\r\n\r\n交易过程是，张三给李四转账指定金额。\r\n\r\n上述交易步骤，张三扣减金额与给bank2发转账消息，两个操作必须是一个整体性的事务\r\n\r\n### 5.3.2 .程序组成部分\r\n\r\n 本示例程序组成部分如下：\r\n\r\n包括bank1和bank2两个数据库。\r\n\r\nrocketmq 服务端：RocketMQ-4.5.0\r\n\r\nrocketmq 客户端：RocketMQ-Spring-Boot-starter.2.0.2-RELEASE\r\n\r\n微服务框架：spring-boot-2.1.3、spring-cloud-Greenwich.RELEASE\r\n\r\n微服务及数据库的关系 ：\r\n\r\ndtx/dtx-txmsg-demo/dtx-txmsg-demo-bank1 银行1，操作张三账户， 连接数据库bank1\r\n\r\ndtx/dtx-txmsg-demo/dtx-txmsg-demo-bank2 银行2，操作李四账户，连接数据库bank2\r\n\r\n \r\n\r\n本示例程序技术架构如下：\r\n\r\n交互流程如下：\r\n\r\n1、Bank1向MQ Server发送转账消息\r\n\r\n2、Bank1执行本地事务，扣减金额\r\n\r\n3、Bank2接收消息，执行本地事务，添加金额\r\n\r\n \r\n\r\n### 5.3.3 .创建数据库\r\n\r\n导入数据库脚本：资料\\sql\\bank1.sql、资料\\sql\\bank2.sql，已经导过不用重复导入。\r\n\r\n创建bank1库创建bank2库，并导入以下表结构和数据(包含李四账户)\r\n\r\n在bank1、bank2数据库中新增de_duplication，交易记录表(去重表)，用于**交易幂等控制**。\r\n\r\n```mysql\r\nDROP TABLE IF EXISTS `de_duplication`;\r\nCREATE TABLE `de_duplication` (\r\n    `tx_no` varchar(64) COLLATE utf8_bin NOT NULL,\r\n    `create_time` datetime(0) NULL DEFAULT NULL,\r\n    PRIMARY KEY (`tx_no`) USING BTREE\r\n) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;\r\n```\r\n\r\n### 5.3.4 .启动RocketMQ\r\n\r\n（1）下载RocketMQ服务器\r\n\r\n下载地址：http://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.5.0/rocketmq-all-4.5.0-bin-release.zip)\r\n\r\n（2）解压并启动\r\n\r\n```bash\r\n# 启动nameserver:\r\nstart [rocketmq服务端解压路径]/bin/mqnamesrv.cmd\r\n# 启动broker:\r\nstart [rocketmq服务端解压路径]/bin/mqbroker.cmd ‐n 127.0.0.1:9876 autoCreateTopicEnable=true\r\n```\r\n\r\n### 3.3.5 导入dtx-txmsg-demo\r\n\r\ndtx-txmsg-demo是本方案的测试工程，根据业务需求需要创建两个dtx-txmsg-demo工程。\r\n\r\n ```\r\n（1）导入dtx-txmsg-demo\r\n导入：资料\\基础代码\\dtx-txmsg-demo到父工程dtx下。两个测试工程如下：\r\n\r\ndtx/dtx-txmsg-demo/dtx-txmsg-demo-bank1 ，操作张三账户，连接数据库bank1\r\ndtx/dtx-txmsg-demo/dtx-txmsg-demo-bank2  ，操作李四账户，连接数据库bank2\r\n\r\n（2）父工程maven依赖说明\r\n\r\n在dtx父工程中指定了SpringBoot和SpringCloud版本\r\n在dtx-txmsg-demo父工程中指定了rocketmq-spring-boot-starter的版本。\r\n\r\n（3）配置rocketMQ\r\n\r\n在application-local.propertis中配置rocketMQ  nameServer地址及生产组：\r\n其它详细配置见导入的基础工程。\r\n ```\r\n\r\n\r\n\r\n### 3.3.6 dtx-txmsg-demo-bank1\r\n\r\ndtx-txmsg-demo-bank1实现如下功能：\r\n\r\n1、张三扣减金额，提交本地事务。\r\n\r\n2、向MQ发送转账消息。\r\n\r\n 2）Dao\r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountInfoDao {\r\n    @Update(\"update account_info set account_balance=account_balance+#{amount} where account_no=#{accountNo}\")\r\n    int updateAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n    @Select(\"select * from account_info where where account_no=#{accountNo}\")\r\n    AccountInfo findByIdAccountNo(@Param(\"accountNo\") String accountNo);\r\n\r\n    @Select(\"select count(1) from de_duplication where tx_no = #{txNo}\")\r\n    int isExistTx(String txNo);\r\n\r\n    @Insert(\"insert into de_duplication values(#{txNo},now());\")\r\n    int addTx(String txNo);\r\n}\r\n```\r\n\r\n##### controller\r\n\r\n```java\r\n@RestController\r\n@Slf4j\r\npublic class AccountInfoController {\r\n    @Autowired\r\n    private AccountInfoService accountInfoService;\r\n\r\n    @GetMapping(value = \"/transfer\")\r\n    public String transfer(@RequestParam(\"accountNo\")String accountNo, @RequestParam(\"amount\") Double amount){\r\n        // 创建一个事务id，作为消息内容发到mq\r\n        String tx_no = UUID.randomUUID().toString();\r\n        AccountChangeEvent accountChangeEvent = new AccountChangeEvent(accountNo,amount,tx_no);\r\n        // 发送消息\r\n        accountInfoService.sendUpdateAccountBalance(accountChangeEvent);\r\n        return \"转账成功\";\r\n    }\r\n}\r\n```\r\n\r\n##### 3） AccountInfoService生产消息\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Autowired\r\n    RocketMQTemplate rocketMQTemplate;\r\n\r\n\r\n    //向mq发送转账消息\r\n    @Override\r\n    public void sendUpdateAccountBalance(AccountChangeEvent accountChangeEvent) {\r\n\r\n        // 将accountChangeEvent转成json\r\n        JSONObject jsonObject =new JSONObject();\r\n        jsonObject.put(\"accountChange\",accountChangeEvent);\r\n        String jsonString = jsonObject.toJSONString();\r\n        // 生成message类型\r\n        Message<String> message = MessageBuilder.withPayload(jsonString).build();\r\n        //发送一条事务消息\r\n        /**\r\n         * String txProducerGroup 生产组\r\n         * String destination topic，\r\n         * Message<?> message, 消息内容\r\n         * Object arg 参数\r\n         */\r\n        rocketMQTemplate.sendMessageInTransaction(\"producer_group_txmsg_bank1\",\r\n                                                  \"topic_txmsg\",\r\n                                                  message,\r\n                                                  null);\r\n    }\r\n\r\n    //更新账户，扣减金额\r\n    @Override\r\n    @Transactional\r\n    public void doUpdateAccountBalance(AccountChangeEvent accountChangeEvent) {\r\n        // 幂等判断\r\n        if(accountInfoDao.isExistTx(accountChangeEvent.getTxNo())>0){\r\n            return ;\r\n        }// 有线程安全问题，所以上面步骤其实得用分布式锁?\r\n        // 扣减金额\r\n        accountInfoDao.updateAccountBalance(accountChangeEvent.getAccountNo(),accountChangeEvent.getAmount() * -1);\r\n        // 添加事务日志\r\n        accountInfoDao.addTx(accountChangeEvent.getTxNo());\r\n        if(accountChangeEvent.getAmount() == 3){\r\n            throw new RuntimeException(\"人为制造异常\");\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n> 上面只是发消息，那么半消息什么的怎么实现的？\r\n>\r\n> 其实发MQ**消息**后就有**回调方法**执行本地事务，**本地事务**执行完后就执行**commit**\r\n>\r\n> 看下面的回调方法代码\r\n\r\n##### 回调方法\r\n\r\n```java\r\n@Component\r\n@Slf4j\r\n@RocketMQTransactionListener(txProducerGroup = \"producer_group_txmsg_bank1\")\r\npublic class ProducerTxmsgListener implements RocketMQLocalTransactionListener {\r\n\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    // 事务消息发送后的回调方法，当消息发送给mq成功，此方法被回调\r\n    @Override\r\n    @Transactional\r\n    public RocketMQLocalTransactionState executeLocalTransaction(Message message, Object o) {\r\n\r\n        try {\r\n            // 解析message，转成AccountChangeEvent\r\n            String messageString = new String((byte[]) message.getPayload());\r\n            JSONObject jsonObject = JSONObject.parseObject(messageString);\r\n            String accountChangeString = jsonObject.getString(\"accountChange\");\r\n            // 将accountChange（json）转成AccountChangeEvent\r\n            AccountChangeEvent accountChangeEvent = JSONObject.parseObject(accountChangeString, AccountChangeEvent.class);\r\n            // 执行本地事务，扣减金额\r\n            accountInfoService.doUpdateAccountBalance(accountChangeEvent);\r\n            \r\n            // 当返回RocketMQLocalTransactionState.COMMIT，自动向mq发送commit消息，mq将消息的状态改为可消费\r\n            return RocketMQLocalTransactionState.COMMIT;\r\n        } catch (Exception e) {\r\n            e.printStackTrace();\r\n            // 发送ROLLBACK\r\n            return RocketMQLocalTransactionState.ROLLBACK;\r\n        }\r\n    }\r\n\r\n    // 事务状态回查，查询是否张三扣减金额\r\n    @Override\r\n    public RocketMQLocalTransactionState checkLocalTransaction(Message message) {\r\n        // 解析message，转成AccountChangeEvent\r\n        String messageString = new String((byte[]) message.getPayload());\r\n        JSONObject jsonObject = JSONObject.parseObject(messageString);\r\n        String accountChangeString = jsonObject.getString(\"accountChange\");\r\n        // 将accountChange（json）转成AccountChangeEvent\r\n        AccountChangeEvent accountChangeEvent = JSONObject.parseObject(accountChangeString, AccountChangeEvent.class);\r\n        // 事务id\r\n        String txNo = accountChangeEvent.getTxNo();\r\n        int existTx = accountInfoDao.isExistTx(txNo );\r\n        if(existTx>0){\r\n            return RocketMQLocalTransactionState.COMMIT;\r\n        }else{\r\n            // 没有commit\r\n            return RocketMQLocalTransactionState.UNKNOWN;\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n### 3.3.7 dtx-txmsg-demo-bank2\r\n\r\n> 项目1已经保证了bank1执行成功，下面就该保证bank2执行成功了\r\n\r\ndtx-txmsg-demo-bank2需要实现如下功能：\r\n\r\n1、监听MQ，接收消息。\r\n\r\n2、接收到消息增加账户金额。\r\n\r\n \r\n\r\n##### 1） Service\r\n\r\n注意为避免消息重复发送，这里需要实现幂等。\r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountInfoDao {\r\n    @Update(\"update account_info set account_balance=account_balance+#{amount} where account_no=#{accountNo}\")\r\n    int updateAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n    @Select(\"select count(1) from de_duplication where tx_no = #{txNo}\")\r\n    int isExistTx(String txNo);\r\n\r\n    @Insert(\"insert into de_duplication values(#{txNo},now());\")\r\n    int addTx(String txNo);\r\n\r\n}\r\n```\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    //更新账户，增加金额\r\n    @Override\r\n    @Transactional\r\n    public void addAccountInfoBalance(AccountChangeEvent accountChangeEvent) {\r\n        log.info(\"bank2更新本地账号，账号：{},金额：{}\",accountChangeEvent.getAccountNo(),accountChangeEvent.getAmount());\r\n        if(accountInfoDao.isExistTx(accountChangeEvent.getTxNo())>0){\r\n            return ;\r\n        }\r\n        //增加金额\r\n        accountInfoDao.updateAccountBalance(accountChangeEvent.getAccountNo(),accountChangeEvent.getAmount());\r\n        //添加事务记录，用于幂等\r\n        accountInfoDao.addTx(accountChangeEvent.getTxNo());\r\n        if(accountChangeEvent.getAmount() == 4){\r\n            throw new RuntimeException(\"人为制造异常\");\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n##### 2） MQ监听类\r\n\r\n```java\r\n@Component\r\n@Slf4j\r\n@RocketMQMessageListener(consumerGroup = \"consumer_group_txmsg_bank2\",topic = \"topic_txmsg\")\r\npublic class TxmsgConsumer implements RocketMQListener<String> {\r\n\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    //接收消息\r\n    @Override\r\n    public void onMessage(String message) {\r\n        log.info(\"开始消费消息:{}\",message);\r\n        // 解析消息\r\n        JSONObject jsonObject = JSONObject.parseObject(message);\r\n        String accountChangeString = jsonObject.getString(\"accountChange\");\r\n        // 转成AccountChangeEvent\r\n        AccountChangeEvent accountChangeEvent = JSONObject.parseObject(accountChangeString, AccountChangeEvent.class);\r\n        // 设置账号为李四的\r\n        accountChangeEvent.setAccountNo(\"2\");\r\n        // 更新本地账户，增加金额 // service\r\n        accountInfoService.addAccountInfoBalance(accountChangeEvent);\r\n    }\r\n}\r\n```\r\n\r\n> 思考：bank2应该启用ACK机制\r\n>\r\n> A发送完B挂了怎么办？那只能重启B了。所以这种场景下AB不可逆，必须先扣A的钱，然后加B的钱\r\n\r\n### 5.3.8 测试场景\r\n\r\nbank1本地事务失败，则bank1不发送转账消息。\r\n\r\nbank2接收转账消息失败，会进行重试发送消息。\r\n\r\nbank2多次消费同一个消息，实现幂等。\r\n\r\n## 5.4.小结\r\n\r\n可靠消息最终一致性就是保证消息从生产方经过消息中间件传递到消费方的一致性，本案例使用了RocketMQ作为消息中间件，RocketMQ主要解决了两个功能：\r\n\r\n1、本地事务与消息发送的原子性问题。\r\n\r\n2、事务参与方接收消息的可靠性。\r\n\r\n可靠消息最终一致性事务适合执行周期长且实时性要求不高的场景。引入消息机制后，同步的事务操作变为基于消息执行的异步操作, 避免了分布式事务中的同步阻塞操作的影响，并实现了两个服务的解耦。\r\n\r\n# 六、解决方案之最大努力通知\r\n\r\n> 不能用于转账，只能用于转账后的通知\r\n\r\n## 6.1 .什么是最大努力通知\r\n\r\n最大努力通知也是一种解决分布式事务的方案，\r\n\r\n下边是一个是充值的例子：\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/023ae0dde97a4d2c929d9f2438adb784.png\" alt=\"请添加图片描述\" style=\"zoom:67%;\" />\r\n\r\n交互流程:\r\n\r\n1、**账户系统**调用**充值系统**接口\r\n\r\n2、充值系统完成支付处理向账户系统发起**充值结果通知**（这个是重点）\r\n\r\n若通知失败，则充值系统按策略进行重复通知\r\n\r\n3、账户系统接收到充值结果通知修改充值状态。\r\n\r\n4、账户系统未接收到通知会主动调用充值系统的接口查询充值结果。\r\n\r\n> 如果实在通知不到，就提供查询接口，让用户主动去查询一遍\r\n\r\n通过上边的例子我们总结最大努力通知方案的目标：\r\n\r\n目标：发起通知方通过一定的机制最大努力将业务处理结果通知到接收方。具体包括：\r\n\r\n1、有一定的消息重复通知机制。\r\n\r\n​	因为接收通知方可能没有接收到通知，此时要有一定的机制对消息重复通知。\r\n\r\n2、消息校对机制。\r\n\r\n​	如果尽最大努力也没有通知到接收方，或者接收方消费消息后要再次消费，此时可由接收方主动向通知方查询消息信息来满足需求。\r\n\r\n \r\n\r\n最大努力通知与可靠消息一致性有什么不同？\r\n\r\n1、解决方案思想不同\r\n\r\n- 可靠消息一致性，发起通知方需要**保证**将消息发出去，并且将消息发到接收通知方，消息的**可靠性关键由发起通知方来保证**。\r\n- 最大努力通知，发起通知方**尽最大的努力**将业务处理结果通知为接收通知方，但是可能消息接收不到，此时需要接收通知方主动调用发起通知方的接口查询业务处理结果，通知的可靠性关键在接收通知方。\r\n\r\n2、两者的业务应用场景不同\r\n\r\n​	可靠消息一致性关注的是交易过程的事务一致，以异步的方式完成交易。最大努力通知关注的是交易后的通知事务，即将交易结果可靠的通知出去。\r\n\r\n3、技术解决方向不同 \r\n\r\n- 可靠消息一致性要解决消息从发出到接收的一致性，即消息发出并且被接收到。\r\n- **最大努力通知无法保证消息从发出到接收的一致性**，只提供消息接收的可靠性机制。可靠机制是，最大努力的将消息通知给接收方，当消息无法被接收方接收时，由接收方主动查询消息（业务处理结果）。\r\n\r\n## 6.2 .解决方案\r\n\r\n通过对最大努力通知的理解，采用MQ的ack机制就可以实现最大努力通知。\r\n\r\n##### 方案1\r\n\r\n![请添加图片描述](https://img-blog.csdnimg.cn/ff7ae145c08c4d479b40aa5ac1134c6e.png)\r\n\r\n> 重点不在于谁发起调用，重点是将通知给谁\r\n>\r\n> 但是问题是接收方居然是个MQ，浏览器怎么会有MQ呢？\r\n>\r\n> 还有支付宝的MQ怎么会让你监控呢？\r\n>\r\n> 所以后面会有优化\r\n\r\n本方案是利用MQ的ack机制由MQ向接收通知方发送通知，流程如下：\r\n\r\n1、发起通知方将通知发给MQ。\r\n\r\n使用普通消息机制将通知发给MQ。\r\n\r\n注意：如果消息没有发出去可由接收通知方主动请求发起通知方查询业务执行结果。（后边会讲）\r\n\r\n2、接收通知方监听 MQ。\r\n\r\n3、接收通知方接收消息，业务处理完成回应ack。\r\n\r\n4、接收通知方若没有回应ack则MQ会重复通知。\r\n\r\nMQ会按照间隔1min、5min、10min、30min、1h、2h、5h、10h的方式，逐步拉大通知间隔 （如果MQ采用rocketMq，在broker中可进行配置），直到达到通知要求的时间窗口上限。\r\n\r\n5、接收通知方可通过消息校对接口来校对消息的一致性。\r\n\r\n \r\n\r\n##### 方案2：\r\n\r\n本方案也是利用MQ的ack机制，与方案1不同的是应用程序向接收通知方发送通知，如下图：\r\n\r\n![请添加图片描述](https://img-blog.csdnimg.cn/1e323ce2109e491ab25a1cfc0f42b285.png)\r\n\r\n\r\n\r\n交互流程如下：\r\n\r\n1、发起通知方将通知发给MQ。\r\n\r\n使用可靠消息一致方案中的事务消息保证本地事务与消息的原子性，最终将通知先发给MQ。\r\n\r\n2、通知程序监听 MQ，接收MQ的消息。\r\n\r\n方案1中接收通知方直接监听MQ，方案2中由通知程序监听MQ。\r\n\r\n通知程序若没有回应ack则MQ会重复通知。\r\n\r\n3、通知程序通过互联网接口协议（如http、webservice）调用接收通知方案接口，完成通知。\r\n\r\n通知程序调用接收通知方案接口成功就表示通知成功，即消费MQ消息成功，MQ将不再向通知程序投递通知消息。\r\n\r\n4、接收通知方可通过消息校对接口来校对消息的一致性。\r\n\r\n \r\n\r\n方案1和方案2的不同点：\r\n\r\n- 1、方案1中接收通知方与MQ接口，即接收通知方案监听 MQ，此方案主要应用与内部应用之间的通知。\r\n- 2、方案2中由通知程序与MQ接口，通知程序监听MQ，收到MQ的消息后由通知程序通过互联网接口协议调用接收通知方。此方案主要应用于外部应用之间的通知，例如支付宝、微信的支付结果通知。\r\n\r\n## 6.3. RocketMQ实现最大努力通知型事务\r\n\r\n### 6.3.1 .业务说明\r\n\r\n本实例通过RocketMQ中间件实现最大努力通知型分布式事务，模拟充值过程。\r\n\r\n本案例有账户系统和充值系统两个微服务，其中\r\n\r\n- **账户系统**的数据库是bank1数据库，其中有张三账户。\r\n- **充值系统**的数据库是bank1_pay数据库，记录了账户的充值记录。\r\n\r\n业务流程如下图：\r\n\r\n<img src=\"https://img-blog.csdnimg.cn/20191201221041340.png\" alt=\"在这里插入图片描述\" style=\"zoom:50%;\" />\r\n\r\n交互流程如下：\r\n\r\n1、用户请求充值系统进行充值。\r\n\r\n2、充值系统完成充值将充值结果发给MQ。\r\n\r\n3、账户系统监听MQ，接收充值结果通知，如果接收不到消息，MQ会重复发送通知。接收到充值结果通知账户系统增加充值金额。\r\n\r\n4、账户系统也可以主动查询充值系统的充值结果查询接口，增加金额。\r\n\r\n### 6.3.2 .程序组成部分\r\n\r\n本示例程序组成部分如下：\r\n\r\n\r\n\r\n包括bank1和bank1_pay两个数据库。\r\n\r\nrocketmq 服务端：RocketMQ-4.5.0\r\n\r\nrocketmq 客户端：RocketMQ-Spring-Boot-starter.2.0.2-RELEASE\r\n\r\n微服务框架：spring-boot-2.1.3、spring-cloud-Greenwich.RELEASE\r\n\r\n微服务及数据库的关系 ：\r\n\r\ndtx/dtx-notifymsg-demo/dtx-notifymsg-demo-bank1 银行1，操作张三账户， 连接数据库bank1 \r\n\r\ndtx/dtx-notifymsg-demo/dtx-notifymsg-demo-pay   银行2，操作充值记录，连接数据库bank1_pay\r\n\r\n交互流程如下：\r\n\r\n1、用户请求充值系统进行充值。\r\n\r\n2、充值系统完成充值将充值结果发给MQ。\r\n\r\n3、账户系统监听MQ，接收充值结果通知，如果接收不到消息，MQ会重复发送通知。接收到充值结果通知账户系统增加充值金额。\r\n\r\n4、账户系统也可以主动查询充值系统的充值结果查询接口，增加金额。\r\n\r\n \r\n\r\n### 6.3.3 .创建数据库\r\n\r\n导入数据库脚本：资料\\sql\\bank1.sql、资料\\sql\\bank1_pay.sql，已经导过不用重复导入。\r\n\r\n创建bank1库，并导入以下表结构和数据(包含张三账户)\r\n\r\n创建bank1_pay库，并导入以下表结构：\r\n\r\n```mysql\r\nCREATE DATABASE `bank1_pay` CHARACTER SET \'utf8\' COLLATE \'utf8_general_ci\';\r\nCREATE TABLE `account_pay` (\r\n    `id` varchar(64) COLLATE utf8_bin NOT NULL,\r\n    `account_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT \'账号\',\r\n    `pay_amount` double NULL DEFAULT NULL COMMENT \'充值余额\',\r\n    `result` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT \'充值结果:success，fail\',\r\n    PRIMARY KEY (`id`) USING BTREE\r\n) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;\r\n```\r\n\r\n### 6.3.4 .启动RocketMQ\r\n\r\nrocketmq启动方式与RocketMQ实现可靠消息最终一致性事务中完全一致\r\n\r\n### 6.3.5 discover-server\r\n\r\ndiscover-server是服务注册中心，测试工程将自己注册至discover-server。\r\n\r\n导入：资料\\基础代码\\dtx 父工程，此工程自带了discover-server，discover-server基于Eureka实现。已经导过不用重复导入。\r\n\r\n### 6.3.6 导入dtx-notifymsg-demo\r\n\r\ndtx-notifymsg-demo是本方案的测试工程，根据业务需求需要创建两个dtx-notifymsg-demo工程。\r\n\r\n（1）导入dtx-notifymsg-demo\r\n\r\n导入：资料\\基础代码\\dtx-notifymsg-demo到父工程dtx下。两个测试工程如下：\r\n\r\ndtx/dtx-notifymsg-demo/dtx-notifymsg-demo-bank1 ，操作张三账户，连接数据库bank1\r\n\r\ndtx/dtx-notifymsg-demo/dtx-notifymsg-demo-pay，操作李四账户，连接数据库bank1_pay\r\n\r\n（2）父工程maven依赖说明\r\n\r\n在dtx父工程中指定了SpringBoot和SpringCloud版本\r\n\r\n在dtx-notifymsg-demo父工程中指定了rocketmq-spring-boot-starter的版本。\r\n\r\n( 3 ) 配置rocketMQ\r\n\r\n在application-local.propertis中配置rocketMQ  \r\n\r\nnameServer地址及生产组：\r\n\r\n其它详细配置见导入的基础工程。\r\n\r\n### 6.3.7 ==pay（第三方充值系统）==\r\n\r\n\r\n\r\ndtx-notifydemo-pay实现如下功能：\r\n\r\n1、充值接口\r\n\r\n2、充值完成要通知\r\n\r\n3、充值结果查询接口  \r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountPayDao {\r\n    // 插入充值记录\r\n    @Insert(\"insert into account_pay(id,account_no,pay_amount,result) values(#{id},#{accountNo},#{payAmount},#{result})\")\r\n    int insertAccountPay(@Param(\"id\") String id,@Param(\"accountNo\") String accountNo, \r\n                         @Param(\"payAmount\") Double pay_amount,@Param(\"result\") String result);\r\n\r\n    // 查询充值结果\r\n    @Select(\"select id,account_no accountNo,pay_amount payAmount,result from account_pay where id=#{txNo}\")\r\n    AccountPay findByIdTxNo(@Param(\"txNo\") String txNo);\r\n}\r\n```\r\n\r\n##### 3） Service\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountPayServiceImpl implements AccountPayService {\r\n\r\n    @Autowired\r\n    AccountPayDao accountPayDao;\r\n\r\n    @Autowired\r\n    RocketMQTemplate rocketMQTemplate;\r\n\r\n    //插入充值记录\r\n    @Override\r\n    public AccountPay insertAccountPay(AccountPay accountPay) {\r\n        int success = accountPayDao.insertAccountPay(accountPay.getId(), accountPay.getAccountNo(), \r\n                                                     accountPay.getPayAmount(), \"success\");\r\n        if(success>0){\r\n            // 发送通知,使用普通消息发送通知\r\n            accountPay.setResult(\"success\");\r\n            rocketMQTemplate.convertAndSend(\"topic_notifymsg\",accountPay);\r\n            return accountPay;\r\n        }\r\n        return null;\r\n    }\r\n\r\n    // 查询充值记录，接收通知方调用此方法来查询充值结果\r\n    @Override\r\n    public AccountPay getAccountPay(String txNo) {\r\n        AccountPay accountPay = accountPayDao.findByIdTxNo(txNo);\r\n        return accountPay;\r\n    }\r\n}\r\n```\r\n\r\n##### 4） Controller\r\n\r\n```java\r\n@RestController\r\npublic class AccountPayController {\r\n\r\n    @Autowired\r\n    AccountPayService accountPayService;\r\n\r\n    //充值\r\n    @GetMapping(value = \"/paydo\")\r\n    public AccountPay pay(AccountPay accountPay){\r\n        //生成事务编号\r\n        String txNo = UUID.randomUUID().toString();\r\n        accountPay.setId(txNo);\r\n        return accountPayService.insertAccountPay(accountPay);\r\n    }\r\n\r\n    //查询充值结果 // 事务号就是刚才的主键id\'\r\n    @GetMapping(value = \"/payresult/{txNo}\")\r\n    public AccountPay payresult(@PathVariable(\"txNo\") String txNo){\r\n        return accountPayService.getAccountPay(txNo);\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n\r\n\r\n### 6.3.8 ==bank1（本地账户系统）==\r\n\r\ndtx-notifydemo-bank1实现如下功能：\r\n\r\n1、监听MQ，接收充值结果，根据充值结果完成账户金额修改。\r\n\r\n2、主动查询充值系统，根据充值结果完成账户金额修改。 \r\n\r\n##### 1）DAO\r\n\r\n```java\r\n@Mapper\r\n@Component\r\npublic interface AccountInfoDao {\r\n    // 修改账户金额\r\n    @Update(\"update account_info set account_balance=account_balance+#{amount} where account_no=#{accountNo}\")\r\n    int updateAccountBalance(@Param(\"accountNo\") String accountNo, @Param(\"amount\") Double amount);\r\n\r\n\r\n    // 查询幂等记录，用于幂等控制\r\n    @Select(\"select count(1) from de_duplication where tx_no = #{txNo}\")\r\n    int isExistTx(String txNo);\r\n\r\n    // 添加事务记录，用于幂等控制\r\n    @Insert(\"insert into de_duplication values(#{txNo},now());\")\r\n    int addTx(String txNo);\r\n}\r\n```\r\n\r\n\r\n\r\n##### 2）Service\r\n\r\n```java\r\n@Service\r\n@Slf4j\r\npublic class AccountInfoServiceImpl implements AccountInfoService {\r\n\r\n    @Autowired\r\n    AccountInfoDao accountInfoDao;\r\n\r\n    @Autowired\r\n    PayClient payClient;\r\n\r\n    // 更新账户金额\r\n    @Override\r\n    @Transactional\r\n    public void updateAccountBalance(AccountChangeEvent accountChange) {\r\n        // 幂等校验\r\n        if(accountInfoDao.isExistTx(accountChange.getTxNo())>0){\r\n            return ;\r\n        }\r\n        int i = accountInfoDao.updateAccountBalance(accountChange.getAccountNo(), accountChange.getAmount());\r\n        //插入事务记录，用于幂等控制\r\n        accountInfoDao.addTx(accountChange.getTxNo());\r\n    }\r\n\r\n    //远程调用查询充值结果\r\n    @Override\r\n    public AccountPay queryPayResult(String tx_no) {\r\n\r\n        //远程调用\r\n        AccountPay payresult = payClient.payresult(tx_no);\r\n        if(\"success\".equals(payresult.getResult())){\r\n            //更新账户金额\r\n            AccountChangeEvent accountChangeEvent = new AccountChangeEvent();\r\n            accountChangeEvent.setAccountNo(payresult.getAccountNo());//账号\r\n            accountChangeEvent.setAmount(payresult.getPayAmount());//金额\r\n            accountChangeEvent.setTxNo(payresult.getId());//充值事务号\r\n            updateAccountBalance(accountChangeEvent);\r\n        }\r\n        return payresult;\r\n    }\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n##### 3）监听MQ\r\n\r\n```java\r\n@Component\r\n@Slf4j\r\n@RocketMQMessageListener(topic = \"topic_notifymsg\",consumerGroup = \"consumer_group_notifymsg_bank1\")\r\npublic class NotifyMsgListener implements RocketMQListener<AccountPay> {\r\n\r\n    @Autowired\r\n    AccountInfoService accountInfoService;\r\n\r\n    //接收消息\r\n    @Override\r\n    public void onMessage(AccountPay accountPay) {\r\n        log.info(\"接收到消息：{}\", JSON.toJSONString(accountPay));\r\n        if(\"success\".equals(accountPay.getResult())){\r\n            //更新账户金额\r\n            AccountChangeEvent accountChangeEvent = new AccountChangeEvent();\r\n            accountChangeEvent.setAccountNo(accountPay.getAccountNo());\r\n            accountChangeEvent.setAmount(accountPay.getPayAmount());\r\n            accountChangeEvent.setTxNo(accountPay.getId());\r\n            accountInfoService.updateAccountBalance(accountChangeEvent);\r\n        }\r\n        log.info(\"处理消息完成：{}\", JSON.toJSONString(accountPay));\r\n    }\r\n}\r\n\r\n```\r\n\r\n\r\n\r\n4）Controller\r\n\r\n```java\r\n@RestController\r\n@Slf4j\r\npublic class AccountInfoController {\r\n\r\n    @Autowired\r\n    private AccountInfoService accountInfoService;\r\n\r\n    // 主动查询充值结果\r\n    @GetMapping(value = \"/payresult/{txNo}\")\r\n    public AccountPay result(@PathVariable(\"txNo\") String txNo){\r\n        AccountPay accountPay = accountInfoService.queryPayResult(txNo);\r\n        return accountPay;\r\n    }\r\n}\r\n\r\n@FeignClient(value = \"dtx-notifymsg-demo-pay\",fallback = PayFallback.class)\r\npublic interface PayClient {\r\n\r\n    //远程调用充值系统的接口查询充值结果\r\n    @GetMapping(value = \"/pay/payresult/{txNo}\")\r\n    public AccountPay payresult(@PathVariable(\"txNo\") String txNo);\r\n}\r\n@Component // 降级方法\r\npublic class PayFallback implements PayClient {\r\n    @Override\r\n    public AccountPay payresult(String txNo) {\r\n        AccountPay accountPay = new AccountPay();\r\n        accountPay.setResult(\"fail\");\r\n        return accountPay;\r\n    }\r\n}\r\n```\r\n\r\n### 6.3.9 测试场景\r\n\r\n充值系统充值成功，账户系统主动查询充值结果，修改账户金额。充值系统充值成功，发送消息，账户系统接收消息，修改账户金额。账户系统修改账户金额幂等测试。\r\n\r\n## 6.4.小结\r\n\r\n最大努力通知方案是分布式事务中对一致性要求最低的一种,适用于一些最终一致性时间敏感度低的业务；最大努力通知方案需要实现如下功能：\r\n\r\n1、消息重复通知机制。\r\n\r\n2、消息校对机制。\r\n\r\n# 七、综合案例分析\r\n\r\n前边我们已经学习了四种分布式事务解决方案，2PC、TCC、可靠消息最终一致性、最大努力通知，每种解决方案我们通过案例开发进行学习，本章节我们结合互联网金融项目中的业务场景，来进行分布式事务解决方案可行性分析。\r\n\r\n## 7.1 .系统介绍\r\n\r\n### 7.1.1. P2P介绍\r\n\r\nP2P金融又叫P2P信贷。其中P2P是 peer-to-peer 或 person-to-person 的简写，意思是：个人对个人。P2P金融指个人与个人间的小额借贷交易，一般需要借助电子商务专业网络平台帮助借贷双方确立借贷关系并完成相关交易手续。借款者可自行发布借款信息，包括金额、利息、还款方式和时间，实现自助式借款;投资者根据借款人发布的信息，自行决定出借金额，实现自助式借贷。\r\n\r\n目前，国家对P2P行业的监控与规范性控制越来越严格，出台了很多政策来对其专项整治。并主张采用“银行存管模式”来规避P2P平台挪用借投人资金的风险，通过银行开发的“银行存管系统”管理投资者的资金，**每位****P****2****P平台用户在银行的存管系统内都会有一个独立账号**，平台来管理交易，做到资金和交易分开，让P2P平台不能接触到资金，就可以一定程度避免资金被挪用的风险。\r\n\r\n什么是银行存管模式？\r\n\r\n银行存管模式涉及到2套账户体系，P2P平台和银行各一套账户体系。投资人在P2P平台注册后，会同时跳转到银行再开一个电子账户，2个账户间有一一对应的关系。当投资人投资时，资金进入的是平台在银行为投资人开设的二级账户中，每一笔交易，是由银行在投资人与借款人间的交易划转，P2P平台仅能看到信息的流动。\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316203526077-2025499887.png\" alt=\"在这里插入图片描述\" style=\"zoom:50%;\" />\r\n\r\n\r\n\r\n### 7.1.2.总体业务流程\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316203605596-1870919995.png\" alt=\"在这里插入图片描述\" style=\"zoom:50%;\" />\r\n\r\n \r\n\r\n7.1.2.业务术语\r\n\r\n| **术语**     | **描述**                                                     |\r\n| ------------ | ------------------------------------------------------------ |\r\n| 银行存管模式 | 此种模式下，涉及到2套账户体系，P2P平台和银行各一套账户体系。投资人在P2P平台注册后，会同时跳转到银行再开一个电子账户，2个账户间有一一对应的关系。当投资人投资时，资金进入的是平台在银行为投资人开设的二级账户中，每一笔交易，是由银行在投资人与借款人间的交易划转，P2P平台仅能看到信息的流动。 |\r\n| 标的         | P2P业内，习惯把借款人发布的投资项目称为“标的”。              |\r\n| 发标         | 借款人在P2P平台中创建并发布“标的”过程。                      |\r\n| 投标         | 投资人在认可相关借款人之后进行的一种借贷行为，对自己中意的借款标的进行投资操作，一个借款标可由单个投资人或多个投资人承接。 |\r\n| 满标         | 单笔借款标筹集齐所有借款资金即为满标，计息时间是以标满当日开始计息，投资人较多的平台多数会当天满标。 |\r\n\r\n \r\n\r\n7.1.2.模块说明\r\n\r\n#### 统一账号服务\r\n\r\n用户的登录账号、密码、角色、权限、资源等系统级信息的管理，不包含用户业务信息。**用户中心**\r\n\r\n提供用户业务信息的管理，如会员信息、实名认证信息、绑定银行卡信息等，“用户中心”的每个用户与“**统一账号服务**”中的账号关联。\r\n\r\n#### 交易中心\r\n\r\n提供发标、投标等业务。**还款服务**\r\n\r\n提供还款计划的生成、执行、记录与归档。银行存管系统(模拟)\r\n\r\n模拟银行存管系统，进行资金的存管，划转。\r\n\r\n## 7.2 .注册账号案例分析\r\n\r\n### 7.2.1 .业务流程\r\n\r\n采用用户、账号分离设计(这样设计的好处是，当用户的业务信息发生变化时，不会影响的认证、授权等系统机制)，因此需要保证用户信息与账号信息的一致性。\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316203701265-1083226514.png\" alt=\"在这里插入图片描述\" style=\"zoom: 80%;\" />\r\n\r\n用户向用户中心发起注册请求，用户中心保存用户业务信息，然后通知统一账号服务新建该用户所对应登录账号。\r\n\r\n### 7.2.2 .解决方案分析\r\n\r\n针对注册业务，如果用户与账号信息不一致，则会导致严重问题，因此该业务对一致性要求较为严格，即当用户服务和账号服务任意一方出现问题都需要回滚事务。\r\n\r\n根据上述需求进行解决方案分析：\r\n\r\n1、采用可靠消息一致性方案\r\n\r\n可靠消息一致性要求只要消息发出，事务参与者接到消息就要将事务执行成功，不存在回滚的要求，所以不适用。\r\n\r\n2、采用最大努力通知方案\r\n\r\n最大努力通知表示发起通知方执行完本地事务后将结果通知给事务参与者，即使事务参与者执行业务处理失败发起通知方也不会回滚事务，所以不适用。\r\n\r\n3、采用Seata实现2PC\r\n\r\n在用户中心发起全局事务，统一账户服务为事务参与者，用户中心和统一账户服务只要有一方出现问题则全局事务回滚，符合要求。\r\n\r\n实现方法如下：\r\n\r\n1、用户中心添加用户信息，开启全局事务\r\n\r\n2、统一账号服务添加账号信息，作为事务参与者\r\n\r\n3、其中一方执行失败Seata对SQL进行逆操作删除用户信息和账号信息，实现回滚。\r\n\r\n4、采用Hmily实现TCC\r\n\r\nTCC也可以实现用户中心和统一账户服务只要有一方出现问题则全局事务回滚，符合要求。实现方法如下：\r\n\r\n1、用户中心\r\n\r\ntry：添加用户，状态为不可用\r\n\r\nconﬁrm：更新用户状态为可用\r\n\r\ncancel：删除用户\r\n\r\n2、统一账号服务\r\n\r\ntry：添加账号，状态为不可用\r\n\r\nconﬁrm：更新账号状态为可用\r\n\r\ncancel：删除账号\r\n\r\n## 7.3 .存管开户\r\n\r\n### 7.3.1 .业务流程\r\n\r\n根据政策要求，P2P业务必须让银行存管资金，用户的资金在银行存管系统的账户中，而不在P2P平台中，因此用户要在银行存管系统开户。\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316203709961-876805905.png\" alt=\"在这里插入图片描述\" style=\"zoom: 80%;\" />\r\n\r\n\r\n\r\n用户向用户中心提交开户资料，用户中心生成开户请求号并重定向至银行存管系统开户页面。用户设置存管密码并确认开户后，银行存管立即返回“请求已受理”。在某一时刻，银行存管系统处理完该开户请求后，将调用回调地址通知处理结果，若通知失败，则按一定策略重试通知。同时，银行存管系统应提供**开户结果查询**的接口，供用户中心校对结果。\r\n\r\n### 7.3.2 .解决方案分析\r\n\r\nP2P平台的用户中心与银行存管系统之间属于跨系统交互，银行存管系统属于外部系统，用户中心无法干预银行存管系统，所以用户中心只能在收到银行存管系统的业务处理结果通知后积极处理，开户后的使用情况完全由用户中心来控制。\r\n\r\n根据上述需求进行解决方案分析：\r\n\r\n1、采用Seata实现2PC\r\n\r\n需要侵入银行存管系统的数据库，由于它的外部系统，所以不适用。\r\n\r\n2、采用Hmily实现TCC\r\n\r\nTCC侵入性更强，所以不适用。\r\n\r\n3、基于MQ的可靠消息一致性\r\n\r\n如果让银行存管系统监听 MQ则不合适 ，因为它的外部系统。\r\n\r\n如果银行存管系统将消息发给MQ用户中心监听MQ是可以的，但是由于相对银行存管系统来说用户中心属于外部系统，银行存管系统是不会让外部系统直接监听自己的MQ的，基于MQ的通信协议也不方便外部系统间的交互，所以本方案不合适。\r\n\r\n4、最大努力通知方案\r\n\r\n银行存管系统内部使用MQ，银行存管系统处理完业务后将处理结果发给MQ，由银行存管的通知程序专门发送通知，并且采用互联网协议通知给第三方系统（用户中心）。\r\n\r\n下图中发起通知即银行存管系统：\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316203709961-876805905.png\" alt=\"在这里插入图片描述\" style=\"zoom: 80%;\" />\r\n\r\n\r\n\r\n \r\n\r\n## 7.4 .满标审核\r\n\r\n### 7.4.1 .业务流程\r\n\r\n在借款人标的募集够所有的资金后，P2P运营管理员审批该标的，触发放款，并开启还款流程。\r\n\r\n\r\n\r\n<img src=\"https://img2020.cnblogs.com/i-beta/1829785/202003/1829785-20200316204021343-785793636.png\" alt=\"在这里插入图片描述\" style=\"zoom: 80%;\" />\r\n\r\n \r\n\r\n管理员对某标的满标审批通过，交易中心修改标的状态为“还款中”，同时要通知还款服务生成还款计划。\r\n\r\n### 7.4.2 .解决方案分析\r\n\r\n生成还款计划是一个执行时长较长的业务，不建议阻塞主业务流程，此业务对一致性要求较低。根据上述需求进行解决方案分析：\r\n\r\n1、采用Seata实现2PC\r\n\r\nSeata在事务执行过程会进行数据库资源锁定，由于事务执行时长较长会将资源锁定较长时间，所以不适用。\r\n\r\n2、采用Hmily实现TCC\r\n\r\n本需求对业务一致性要求较低，因为生成还款计划的时长较长，所以不要求交易中心修改标的状态为“还款中”就立即生成还款计划 ，所以本方案不适用。\r\n\r\n3、基于MQ的可靠消息一致性\r\n\r\n满标审批通过后由交易中心修改标的状态为“还款中”并且向还款服务发送消息，还款服务接收到消息开始生成还款计划，基本于MQ的可靠消息一致性方案适用此场景 。\r\n\r\n4、最大努力通知方案\r\n\r\n满标审批通过后由交易中心向还款服务发送通知要求生成还款计划，还款服务并且对外提供还款计划生成结果校对接口供其它服务查询，最大努力 通知方案也适用本场景 。\r\n\r\n \r\n\r\n \r\n\r\n# 八、课程总结\r\n\r\n#### 重点知识回顾:\r\n\r\n事务的基本概念以及本地事务特性。\r\n\r\nCAP、BASE理论的概念。\r\n\r\n2PC、TCC、可靠消息最终一致性、最大努力通知各类型原理及特性。\r\n\r\n不同分布式事务类型的应用场景讨论。\r\n\r\n\r\n\r\nRocketMQ事务消息机制。\r\n\r\nSeata与传统XA原理上的差异。\r\n\r\n**分布式事务对比分析**\r\n\r\n在学习各种分布式事务的解决方案后，我们了解到各种方案的优缺点：\r\n\r\n- 2PC 最大的诟病是一个阻塞协议。RM在执行分支事务后需要等待TM的决定，此时服务会阻塞并锁定资源。由于其阻塞机制和最差时间复杂度高， 因此，这种设计不能适应随着事务涉及的服务数量增加而扩展的需要，很难用于并发较高以及子事务生命周期较长 (long-running transactions) 的分布式服务中。\r\n- 如果拿TCC事务的处理流程与2PC两阶段提交做比较，2PC通常都是在跨库的DB层面，而TCC则在应用层面的处理，需要通过业务逻辑来实现。这种分布式事务的实现方式的优势在于，可以让应用自己定义数据操作的粒度，使得降低锁冲突、提高吞吐量成为可能。而不足之处则在于对应用的侵入性非常强，业务逻辑的每个分支都需要实现try、conﬁrm、cancel三个操作。此外，其实现难度也比较大，需要按照网络状态、系统故障等不同的失败原因实现不同的回滚策略。典型的使用场景：满，登录送优惠券等。\r\n- **可靠消息最终一致性**事务适合执行周期长且实时性要求不高的场景。引入消息机制后，同步的事务操作变为基于消息执行的异步操作, 避免了分布式事务中的同步阻塞操作的影响，并实现了两个服务的解耦。典型的使用场景：注册送积分，登录送优惠券等。\r\n- **最大努力通知**是分布式事务中要求最低的一种,适用于一些最终一致性时间敏感度低的业务；允许发起通知方处理业务失败，在接收通知方收到通知后积极进行失败处理，无论发起通知方如何处理结果都会不影响到接收通知方的后续处理；发起通知方需提供查询执行情况接口，用于接收通知方校对结果。典型的使用场景：银行通知、支付结果通知等。\r\n\r\n|            | **2PC**  | **TCC**  | **可靠消息** | **最大努力通知** |\r\n| ---------- | -------- | -------- | ------------ | ---------------- |\r\n| 一致性     | 强一致性 | 最终一致 | 最终一致     | 最终一致         |\r\n| 吞吐量     | 低       | 中       | 高           | 高               |\r\n| 实现复杂度 | 易       | 难       | 中           | 易               |\r\n\r\n#### 总结：\r\n\r\n在条件允许的情况下，我们尽可能选择本地事务单数据源，因为它减少了网络交互带来的性能损耗，且避免了数据弱一致性带来的种种问题。若某系统频繁且不合理的使用分布式事务，应首先从整体设计角度观察服务的拆分是否合理，是否高内聚低耦合？是否粒度太小？分布式事务一直是业界难题，因为网络的不确定性，而且我们习惯于拿分布式事务与单机事务ACID做对比。\r\n\r\n无论是数据库层的XA、还是应用层TCC、可靠消息、最大努力通知等方案，都没有完美解决分布式事务问题，它们不过是各自在性能、一致性、可用性等方面做取舍，寻求某些场景偏好下的权衡。\r\n\r\n## sql1\r\n\r\n```mysql\r\n/* MySQL - 5.7.21-log : Database - bank1\r\n*********************************\r\n*/\r\n\r\n\r\n/*!40101 SET NAMES utf8 */;\r\n\r\n/*!40101 SET SQL_MODE=\'\'*/;\r\n\r\n/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\r\n/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\r\n/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'NO_AUTO_VALUE_ON_ZERO\' */;\r\n/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\r\nCREATE DATABASE /*!32312 IF NOT EXISTS*/`bank1` /*!40100 DEFAULT CHARACTER SET utf8 */;\r\n\r\nUSE `bank1`;\r\n\r\n/*Table structure for table `account_info` */\r\n\r\nDROP TABLE IF EXISTS `account_info`;\r\n\r\nCREATE TABLE `account_info` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `account_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'户主姓名\',\r\n  `account_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'银行卡号\',\r\n  `account_password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'帐户密码\',\r\n  `account_balance` double DEFAULT NULL COMMENT \'帐户余额\',\r\n  PRIMARY KEY (`id`) USING BTREE\r\n) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `account_info` */\r\n\r\ninsert  into `account_info`(`id`,`account_name`,`account_no`,`account_password`,`account_balance`) values (2,\'张三\',\'1\',NULL,1000);\r\n\r\n/*Table structure for table `de_duplication` */\r\n\r\nDROP TABLE IF EXISTS `de_duplication`;\r\n\r\nCREATE TABLE `de_duplication` (\r\n  `tx_no` varchar(64) COLLATE utf8_bin NOT NULL,\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`) USING BTREE\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `de_duplication` */\r\n\r\n/*Table structure for table `local_cancel_log` */\r\n\r\nDROP TABLE IF EXISTS `local_cancel_log`;\r\n\r\nCREATE TABLE `local_cancel_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_cancel_log` */\r\n\r\n/*Table structure for table `local_confirm_log` */\r\n\r\nDROP TABLE IF EXISTS `local_confirm_log`;\r\n\r\nCREATE TABLE `local_confirm_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_confirm_log` */\r\n\r\n/*Table structure for table `local_trade_log` */\r\n\r\nDROP TABLE IF EXISTS `local_trade_log`;\r\n\r\nCREATE TABLE `local_trade_log` (\r\n  `tx_no` bigint(20) NOT NULL,\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`) USING BTREE\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `local_trade_log` */\r\n\r\ninsert  into `local_trade_log`(`tx_no`,`create_time`) values (182529322697780,\'2019-08-12 10:06:48\'),(182556963958191,\'2019-08-12 10:07:15\'),(182557059333569,\'2019-08-12 10:07:15\'),(182557156706509,\'2019-08-12 10:07:16\'),(182557256097796,\'2019-08-12 10:07:16\'),(182557291483231,\'2019-08-12 10:07:16\'),(182557355483613,\'2019-08-12 10:07:16\'),(182557456937006,\'2019-08-12 10:07:17\'),(182557520747040,\'2019-08-12 10:07:17\'),(182557555714584,\'2019-08-12 10:07:17\'),(188816462428295,\'2019-08-12 11:51:46\'),(188816757026017,\'2019-08-12 11:51:47\'),(188816903251343,\'2019-08-12 11:51:47\'),(188817227863181,\'2019-08-12 11:51:48\');\r\n\r\n/*Table structure for table `local_try_log` */\r\n\r\nDROP TABLE IF EXISTS `local_try_log`;\r\n\r\nCREATE TABLE `local_try_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_try_log` */\r\n\r\n/*Table structure for table `undo_log` */\r\n\r\nDROP TABLE IF EXISTS `undo_log`;\r\n\r\nCREATE TABLE `undo_log` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `branch_id` bigint(20) NOT NULL,\r\n  `xid` varchar(100) NOT NULL,\r\n  `context` varchar(128) NOT NULL,\r\n  `rollback_info` longblob NOT NULL,\r\n  `log_status` int(11) NOT NULL,\r\n  `log_created` datetime NOT NULL,\r\n  `log_modified` datetime NOT NULL,\r\n  `ext` varchar(100) DEFAULT NULL,\r\n  PRIMARY KEY (`id`),\r\n  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\r\n) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `undo_log` */\r\n\r\ninsert  into `undo_log`(`id`,`branch_id`,`xid`,`context`,`rollback_info`,`log_status`,`log_created`,`log_modified`,`ext`) values (166,2019228885,\'192.168.1.101:8888:2019228047\',\'serializer=jackson\',\'{}\',1,\'2019-08-11 15:16:43\',\'2019-08-11 15:16:43\',NULL);\r\n\r\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\r\n/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\r\n/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\r\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\r\n```\r\n\r\n## sql2\r\n\r\n```mysql\r\n/* MySQL - 5.7.21-log : Database - bank2\r\n*********************************************************************\r\n*/\r\n\r\n\r\n/*!40101 SET NAMES utf8 */;\r\n\r\n/*!40101 SET SQL_MODE=\'\'*/;\r\n\r\n/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\r\n/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\r\n/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'NO_AUTO_VALUE_ON_ZERO\' */;\r\n/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\r\nCREATE DATABASE /*!32312 IF NOT EXISTS*/`bank2` /*!40100 DEFAULT CHARACTER SET utf8 */;\r\n\r\nUSE `bank2`;\r\n\r\n/*Table structure for table `account_info` */\r\n\r\nDROP TABLE IF EXISTS `account_info`;\r\n\r\nCREATE TABLE `account_info` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `account_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'户主姓名\',\r\n  `account_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'银行卡号\',\r\n  `account_password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'帐户密码\',\r\n  `account_balance` double DEFAULT NULL COMMENT \'帐户余额\',\r\n  PRIMARY KEY (`id`) USING BTREE\r\n) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `account_info` */\r\n\r\ninsert  into `account_info`(`id`,`account_name`,`account_no`,`account_password`,`account_balance`) values (3,\'李四的账户\',\'2\',NULL,0);\r\n\r\n/*Table structure for table `de_duplication` */\r\n\r\nDROP TABLE IF EXISTS `de_duplication`;\r\n\r\nCREATE TABLE `de_duplication` (\r\n  `tx_no` varchar(64) COLLATE utf8_bin NOT NULL,\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`) USING BTREE\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `de_duplication` */\r\n\r\n/*Table structure for table `local_cancel_log` */\r\n\r\nDROP TABLE IF EXISTS `local_cancel_log`;\r\n\r\nCREATE TABLE `local_cancel_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_cancel_log` */\r\n\r\n/*Table structure for table `local_confirm_log` */\r\n\r\nDROP TABLE IF EXISTS `local_confirm_log`;\r\n\r\nCREATE TABLE `local_confirm_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_confirm_log` */\r\n\r\n/*Table structure for table `local_trade_log` */\r\n\r\nDROP TABLE IF EXISTS `local_trade_log`;\r\n\r\nCREATE TABLE `local_trade_log` (\r\n  `tx_no` bigint(20) NOT NULL,\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`) USING BTREE\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `local_trade_log` */\r\n\r\ninsert  into `local_trade_log`(`tx_no`,`create_time`) values (182530043150692,\'2019-08-12 10:06:48\'),(182557045478629,\'2019-08-12 10:07:15\'),(182557298838620,\'2019-08-12 10:07:16\'),(182557478780006,\'2019-08-12 10:07:16\'),(182557803225927,\'2019-08-12 10:07:16\'),(182558121161357,\'2019-08-12 10:07:16\'),(182558382192161,\'2019-08-12 10:07:17\'),(188820404490612,\'2019-08-12 11:51:39\'),(188820685393110,\'2019-08-12 11:51:39\'),(188820917679152,\'2019-08-12 11:51:40\'),(188821878389027,\'2019-08-12 11:51:41\'),(188822534455755,\'2019-08-12 11:51:41\'),(188822767387230,\'2019-08-12 11:51:41\'),(188822952712333,\'2019-08-12 11:51:42\'),(188823959674263,\'2019-08-12 11:51:43\'),(188825409206652,\'2019-08-12 11:51:44\'),(188825574954701,\'2019-08-12 11:51:44\'),(188825774771791,\'2019-08-12 11:51:44\'),(188825910550941,\'2019-08-12 11:51:44\'),(188826172994771,\'2019-08-12 11:51:45\'),(188826464823692,\'2019-08-12 11:51:46\'),(188827317384440,\'2019-08-12 11:51:46\'),(188827592973234,\'2019-08-12 11:51:46\'),(188827921195124,\'2019-08-12 11:51:46\'),(188828063594889,\'2019-08-12 11:51:47\'),(188828333394837,\'2019-08-12 11:51:47\'),(188829166438333,\'2019-08-12 11:51:48\');\r\n\r\n/*Table structure for table `local_try_log` */\r\n\r\nDROP TABLE IF EXISTS `local_try_log`;\r\n\r\nCREATE TABLE `local_try_log` (\r\n  `tx_no` varchar(64) NOT NULL COMMENT \'事务id\',\r\n  `create_time` datetime DEFAULT NULL,\r\n  PRIMARY KEY (`tx_no`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `local_try_log` */\r\n\r\n/*Table structure for table `undo_log` */\r\n\r\nDROP TABLE IF EXISTS `undo_log`;\r\n\r\nCREATE TABLE `undo_log` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `branch_id` bigint(20) NOT NULL,\r\n  `xid` varchar(100) NOT NULL,\r\n  `context` varchar(128) NOT NULL,\r\n  `rollback_info` longblob NOT NULL,\r\n  `log_status` int(11) NOT NULL,\r\n  `log_created` datetime NOT NULL,\r\n  `log_modified` datetime NOT NULL,\r\n  `ext` varchar(100) DEFAULT NULL,\r\n  PRIMARY KEY (`id`),\r\n  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\r\n\r\n/*Data for the table `undo_log` */\r\n\r\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\r\n/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\r\n/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\r\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\r\n```\r\n\r\n## sql3\r\n\r\n```mysql\r\n/* Database - bank1_pay\r\n******************************\r\n*/\r\n\r\n\r\n/*!40101 SET NAMES utf8 */;\r\n\r\n/*!40101 SET SQL_MODE=\'\'*/;\r\n\r\n/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\r\n/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\r\n/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'NO_AUTO_VALUE_ON_ZERO\' */;\r\n/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\r\nCREATE DATABASE /*!32312 IF NOT EXISTS*/`bank1_pay` /*!40100 DEFAULT CHARACTER SET utf8 */;\r\n\r\nUSE `bank1_pay`;\r\n\r\n/*Table structure for table `account_pay` */\r\n\r\nDROP TABLE IF EXISTS `account_pay`;\r\n\r\nCREATE TABLE `account_pay` (\r\n  `id` varchar(64) COLLATE utf8_bin NOT NULL,\r\n  `account_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT \'账号\',\r\n  `pay_amount` double DEFAULT NULL COMMENT \'充值余额\',\r\n  `result` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT \'充值结果:success，fail\',\r\n  PRIMARY KEY (`id`) USING BTREE\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;\r\n\r\n/*Data for the table `account_pay` */\r\n\r\ninsert  into `account_pay`(`id`,`account_no`,`pay_amount`,`result`) values (\'5678ef0a-1ff0-4cfd-97ac-640d749d596f\',\'1\',2,\'success\'),(\'7d7d469c-f100-4066-b927-014c0c3aa010\',\'1\',2,\'success\'),(\'947fafad-c19c-46bc-b0f0-43703a124fd4\',\'1\',2,\'success\');\r\n\r\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\r\n/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\r\n/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\r\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\r\n```\r\n\r\n',
        '2022-08-19 16:47:56', '2022-08-19 19:08:40');
INSERT INTO `article_content`
VALUES ('e82e394a13007e3dba1866b3eb21c7a4',
        '# 散列（哈希）表总结\n\n之前给大家介绍了**链表**，**栈和队列**今天我们来说一种新的数据结构散列（哈希）表，散列是应用非常广泛的数据结构，在我们的刷题过程中，散列表的出场率特别高。所以我们快来一起把散列表的内些事给整明白吧。文章框架如下\n\n![脑图](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/脑图.1pk584kfatxc.png)\n\n说散列表之前，我们先设想以下场景。\n\n> 袁厨穿越回了古代，凭借从现代学习的做饭手艺，开了一个袁记菜馆，正值开业初期，店里生意十分火爆，但是顾客结账时就犯难了，每当结账的时候，老板娘总是按照菜单一个一个找价格（遍历查找），每次都要找半天，所以结账的地方总是排起长队，顾客们表示用户体验不咋滴。袁厨一想这不是办法啊，让顾客老是等着，太影响客户体验啦。所以袁厨就先把菜单按照首字母排序（二分查找），然后查找的时候根据首字母查找，这样结账的时候就能大大提高检索效率啦！但是呢？工作日顾客不多，老板娘完全应付的过来，但是每逢节假日，还是会排起长队。那么有没有什么更好的办法呢？对呀！我们把所有的价格都背下来不就可以了吗？每个菜的价格我们都了如指掌，结账的时候我们只需简单相加即可。所以袁厨和老板娘加班加点的进行背诵。下次再结账的时候一说吃了什么菜，我们立马就知道价格啦。自此以后收银台再也没有出现过长队啦，袁记菜馆开着开着一不小心就成了天下第一饭店了。\n\n下面我们来看一下袁记菜馆老板娘进化史。\n\n![image-20201117132633797](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117132633797.5dlsgarvplc0.png)\n\n上面的后期结账的过程则模拟了我们的散列表查找，那么在计算机中是如何使用进行查找的呢？\n\n### 散列表查找步骤\n\n散列表-------最有用的基本数据结构之一。是根据关键码的值儿直接进行访问的数据结构，散列表的实现常常叫做**散列（hasing）**。散列是一种用于以**常数平均时间**执行插入、删除和查找的技术，下面我们来看一下散列过程。\n\n我们的整个散列过程主要分为两步\n\n（1）通过**散列函数**计算记录的散列地址，并按此**散列地址**存储该记录。就好比麻辣鱼我们就让它在川菜区，糖醋鱼，我们就让它在鲁菜区。但是我们需要注意的是，无论什么记录我们都需要用**同一个散列函数**计算地址，再存储。\n\n（2)当我们查找时，我们通过**同样的散列函数**计算记录的散列地址，按此散列地址访问该记录。因为我们存和取得时候用的都是一个散列函数，因此结果肯定相同。\n\n刚才我们在散列过程中提到了散列函数，那么散列函数是什么呢？\n\n我们假设某个函数为 **f**，使得\n\n​ **存储位置 = f (关键字)**\n\n**输入：关键字** **输出：存储位置(散列地址)**\n\n那样我们就能通过查找关键字**不需要比较**就可获得需要的记录的存储位置。这种存储技术被称为散列技术。散列技术是在通过记录的存储位置和它的关键字之间建立一个确定的对应关系 **f** ,使得每个关键字 **key** 都对应一个存储位置 **f(key)**。见下图\n\n![image-20201117145348616](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117145348616.7l7om0vd7ww0.png)\n\n这里的 **f** 就是我们所说的散列函数（哈希）函数。我们利用散列技术将记录存储在一块连续的存储空间中，这块连续存储空间就是我们本文的主人公------**散列(哈希)表**\n\n上图为我们描述了用散列函数将关键字映射到散列表，但是大家有没有考虑到这种情况，那就是将关键字映射到同一个槽中的情况，即 **f(k4) = f(k3)** 时。这种情况我们将其称之为**冲突**，**k3** 和 **k4**则被称之为散列函数 **f** 的**同义词**，如果产生这种情况，则会让我们查找错误。幸运的是我们能找到有效的方法解决冲突。\n\n首先我们可以对哈希函数下手，我们可以精心设计哈希函数，让其尽可能少的产生冲突，所以我们创建哈希函数时应遵循以下规则\n\n（1）**必须是一致的**，假设你输入辣子鸡丁时得到的是**在看**，那么每次输入辣子鸡丁时，得到的也必须为**在看**。如果不是这样，散列表将毫无用处。\n\n（2）**计算简单**，假设我们设计了一个算法，可以保证所有关键字都不会冲突，但是这个算法计算复杂，会耗费很多时间，这样的话就大大降低了查找效率，反而得不偿失。所以咱们**散列函数的计算时间不应该超过其他查找技术与关键字的比较时间**，不然的话我们干嘛不使用其他查找技术呢?\n\n（3）**散列地址分布均匀**我们刚才说了冲突的带来的问题，所以我们最好的办法就是让**散列地址尽量均匀分布在存储空间中**，这样即保证空间的有效利用，又减少了处理冲突而消耗的时间。\n\n现在我们已经对散列表，散列函数等知识有所了解啦，那么我们来看几种常用的散列函数构造规则。这些方法的共同点为都是将原来的数字按某种规律变成了另一个数字。\n\n### 散列函数构造方法\n\n#### 直接定址法\n\n如果我们对盈利为 0-9 的菜品设计哈希表，我们则直接可以根据作为地址，则 **f(key) = key**;\n\n即下面这种情况。\n\n![直接定址法](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/直接定址法.b74l6bhzm0w.png)\n\n有没有感觉上面的图很熟悉，没错我们经常用的数组其实就是一张哈希表，关键码就是数组的索引下标，然后我们通过下标直接访问数组中的元素。\n\n另外我们假设每道菜的成本为 50 块，那我们还可以根据盈利+成本来作为地址，那么则 f(key) = key + 50。也就是说我们可以根据线性函数值作为散列地址。\n\n​ **f(key) = a \\* key + b** **a,b 均为常数**\n\n优点：简单、均匀、无冲突。\n\n应用场景：需要事先知道关键字的分布情况，适合查找表较小且连续的情况\n\n#### 数字分析法\n\n该方法也是十分简单的方法，就是分析我们的关键字，取其中一段，或对其位移，叠加，用作地址。比如我们的学号，前 6 位都是一样的，但是后面 3 位都不相同，我们则可以用学号作为键，后面的 3 位做为我们的散列地址。如果我们这样还是容易产生冲突，则可以对抽取数字再进行处理。我们的目的只有一个，提供一个散列函数将关键字合理的分配到散列表的各位置。这里我们提到了一种新的方式，抽取，这也是在散列函数中经常用到的手段。\n\n![image-20201117161754010](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117161754010.7k9ilkvmcfk0.png)\n\n优点：简单、均匀、适用于关键字位数较大的情况\n\n应用场景：关键字位数较大，知道关键字分布情况且关键字的若干位较均匀\n\n#### 折叠法\n\n其实这个方法也很简单，也是处理我们的关键字然后用作我们的散列地址，主要思路是将关键字从左到右分割成位数相等的几部分，然后叠加求和，并按散列表表长，取后几位作为散列地址。\n\n比如我们的关键字是 123456789，则我们分为三部分 123 ，456 ，789 然后将其相加得 1368 然后我们再取其后三位 368 作为我们的散列地址。\n\n优点：事先不需要知道关键字情况\n\n应用场景：适合关键字位数较多的情况\n\n#### 除法散列法\n\n在用来设计散列函数的除法散列法中，通过取 key 除以 p 的余数，将关键字映射到 p 个槽中的某一个上，对于散列表长度为 m 的散列函数公式为\n\n​ **f(k) = k mod p (p <= m)**\n\n例如，如果散列表长度为 12，即 m = 12 ，我们的参数 p 也设为 12，**那 k = 100 时 f(k) = 100 % 12 = 4**\n\n由于只需要做一次除法操作，所以除法散列法是非常快的。\n\n由上面的公式可以看出，该方法的重点在于 p 的取值，如果 p 值选的不好，就可能会容易产生同义词。见下面这种情况。我们哈希表长度为 6，我们选择 6 为 p 值，则有可能产生这种情况，所有关键字都得到了 0 这个地址数。![image-20201117191635083](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117191635083.4z4tf8bvv2g0.png)\n\n那我们在选用除法散列法时选取 p 值时应该遵循怎样的规则呢？\n\n- m 不应为 2 的幂，因为如果 m = 2^p ，则 f(k) 就是 k 的 p 个最低位数字。例 12 % 8 = 4 ，12 的二进制表示位 1100，后三位为 100。\n- 若散列表长为 m ,通常 p 为 小于或等于表长（最好接近 m）的最小质数或不包含小于 20 质因子的合数。\n\n> **合数：**合数是指在大于 1 的整数中除了能被 1 和本身整除外，还能被其他数（0 除外）整除的数。\n>\n> **质因子**：质因子（或质因数）在数论里是指能整除给定正整数的质数。\n\n![质因子](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/质因子.75q2ya0sdts0.png)\n\n这里的 2，3，5 为质因子\n\n还是上面的例子，我们根据规则选择 5 为 p 值，我们再来看。这时我们发现只有 6 和 36 冲突，相对来说就好了很多。\n\n![image-20201117192738889](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117192738889.4zt1f4q8isc0.png)\n\n优点：计算效率高，灵活\n\n应用场景：不知道关键字分布情况\n\n#### 乘法散列法\n\n构造散列函数的乘法散列法主要包含两个步骤\n\n- 用关键字 k 乘上常数 A(0 < A < 1)，并提取 k A 的小数部分\n- 用 m 乘以这个值，再向下取整\n\n散列函数为\n\n​ **f (k) = ⌊ m(kA mod 1) ⌋**\n\n这里的 **kA mod 1** 的含义是取 keyA 的小数部分，即 **kA - ⌊kA⌋** 。\n\n优点：对 m 的选择不是特别关键，一般选择它为 2 的某个幂次（m = 2 ^ p ,p 为某个整数）\n\n应用场景：不知道关键字情况\n\n#### 平方取中法\n\n这个方法就比较简单了，假设关键字是 321，那么他的平方就是 103041，再抽取中间的 3 位就是 030 或 304 用作散列地址。再比如关键字是 1234 那么它的平方就是 1522756 ，抽取中间 3 位就是 227 用作散列地址.\n\n优点：灵活，适用范围广泛\n\n适用场景：不知道关键字分布，而位数又不是很大的情况。\n\n#### 随机数法\n\n故名思意，取关键字的随机函数值为它的散列地址。也就是 **f(key) = random(key)**。这里的 random 是 随机函数。\n\n优点：易实现\n\n适用场景：关键字的长度不等时\n\n上面我们的例子都是通过数字进行举例，那么如果是字符串可不可以作为键呢？当然也是可以的，各种各样的符号我们都可以转换成某种数字来对待，比如我们经常接触的 ASCII 码，所以是同样适用的。\n\n以上就是常用的散列函数构造方法，其实他们的中心思想是一致的，将关键字经过加工处理之后变成另外一个数字，而这个数字就是我们的存储位置，是不是有一种间谍传递情报的感觉。\n\n一个好的哈希函数可以帮助我们尽可能少的产生冲突，但是也不能完全避免产生冲突，那么遇到冲突时应该怎么做呢？下面给大家带来几种常用的处理散列冲突的方法。\n\n### 处理散列冲突的方法\n\n我们在使用 hash 函数之后发现关键字 key1 不等于 key2 ，但是 f(key1) = f(key2)，即有冲突，那么该怎么办呢？不急我们慢慢往下看。\n\n#### 开放地址法\n\n了解开放地址法之前我们先设想以下场景。\n\n> 袁记菜馆内，铃铃铃，铃铃铃 电话铃响了\n>\n> 大鹏：老袁，给我订个包间，我今天要去带几个客户去你那谈生意。\n>\n> 袁厨：大鹏啊，你常用的那个包间被人订走啦。\n>\n> 大鹏：老袁你这不仗义呀，咋没给我留住呀，那你给我找个**空房间**吧。\n>\n> 袁厨：好滴老哥\n\n哦，穿越回古代就没有电话啦，那看来穿越的时候得带着几个手机了。\n\n上面的场景其实就是一种处理冲突的方法-----开放地址法\n\n**开放地址法**就是一旦发生冲突，就去寻找下一个空的散列地址，只要列表足够大，空的散列地址总能找到，并将记录存入，为了使用开放寻址法插入一个元素，需要连续地检查散列表，或称为**探查**，我们常用的有**线性探测，二次探测，随机探测**。\n\n##### 线性探测法\n\n下面我们先来看一下线性探测，公式：\n\n> **f,(key) = ( f(key) + di ) MOD m（di = 1,2,3,4,5,6....m-1）**\n\n我们来看一个例子，我们的关键字集合为{12，67，56，16，25，37，22，29，15，47，48，21}，表长为 12，我们再用散列函数 **f(key) = key mod 12。**\n\n我们求出每个 key 的 f(key)见下表\n\n![image-20201118121740324](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118121740324.26hu17vbf5fk.png)\n\n我们查看上表发现，前五位的 **f(key)** 都不相同，即没有冲突，可以直接存入，但是到了第六位 **f(37) = f(25) = 1**,那我们就需要利用上面的公式 **f(37) = f (f(37) + 1 ) mod 12 = 2**，这其实就是我们的订包间的做法。下面我们看一下将上面的所有数存入哈希表是什么情况吧。\n\n![image-20201118121801671](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118121801671.6g0iqe60o9c0.png)\n\n我们把这种解决冲突的开放地址法称为**线性探测法**。下面我们通过视频来模拟一下线性探测法的存储过程。\n\n![线性探测法](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/线性探测法.36c7dqr0r120.gif)\n\n另外我们在解决冲突的时候，会遇到 48 和 37 虽然不是同义词，却争夺一个地址的情况，我们称其为**堆积**。因为堆积使得我们需要不断的处理冲突，插入和查找效率都会大大降低。\n\n通过上面的视频我们应该了解了线性探测的执行过程了，那么我们考虑一下这种情况，若是我们的最后一位不为 21，为 34 时会有什么事情发生呢？\n\n![image-20201118133459372](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118133459372.2vdk7gxr7hg0.png)\n\n此时他第一次会落在下标为 10 的位置，那么如果继续使用线性探测的话，则需要通过不断取余后得到结果，数据量小还好，要是很大的话那也太慢了吧，但是明明他的前面就有一个空房间呀，如果向前移动只需移动一次即可。不要着急，前辈们已经帮我们想好了解决方法\n\n##### 二次探测法\n\n其实理解了我们的上个例子之后，这个一下就能整明白了，根本不用费脑子，这个方法就是更改了一下 di 的取值\n\n> **线性探测： f,(key) = ( f(key) + di ) MOD m（di = 1,2,3,4,5,6....m-1）**\n>\n> **二次探测：** **f,(key) = ( f(key) + di ) MOD m（di =1^2 , -1^2 , 2^2 , -2^2 .... q^2, -q^2, q<=m/2）**\n\n**注：这里的是 -1^2 为负值 而不是 （-1)^2**\n\n所以对于我们的 34 来说，当 di = -1 时，就可以找到空位置了。\n\n![image-20201118142851095](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118142851095.5hdys12bsgg0.png)\n\n二次探测法的目的就是为了不让关键字聚集在某一块区域。另外还有一种有趣的方法，位移量采用随机函数计算得到，接着往下看吧.\n\n##### 随机探测法\n\n大家看到这是不又有新问题了，刚才我们在散列函数构造规则的第一条中说\n\n> （1）**必须是一致的**，假设你输入辣子鸡丁时得到的是**在看**，那么每次输入辣子鸡丁时，得到的也必须为**在看**。如果不是这样，散列表将毫无用处。\n\n咦？怎么又是**在看**哈哈，那么问题来了，我们使用随机数作为他的偏移量，那么我们查找的时候岂不是查不到了？因为我们 di 是随机生成的呀，这里的随机其实是伪随机数，伪随机数含义为，我们设置**随机种子**相同，则不断调用随机函数可以生成**不会重复的数列**，我们在查找时，**用同样的随机种子**，**它每次得到的数列是相同的**，那么相同的 di 就能得到**相同的散列地址**。\n\n> 随机种子（Random Seed）是计算机专业术语，一种以随机数作为对象的以真随机数（种子）为初始条件的随机数。一般计算机的随机数都是伪随机数，以一个真随机数（种子）作为初始条件，然后用一定的算法不停迭代产生随机数\n\n![image-20201118154853554](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118154853554.36a1ec591620.png)\n\n![image-20201118205305792](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118205305792.3czdgupb1540.png)\n\n通过上面的测试是不是一下就秒懂啦，为什么我们可以使用随机数作为它的偏移量，理解那句，相同的随机种子，他每次得到的数列是相同的。\n\n下面我们再来看一下其他的函数处理散列冲突的方法\n\n#### 再哈希法\n\n这个方法其实也特别简单，利用不同的哈希函数再求得一个哈希地址，直到不出现冲突为止。\n\n> **f,(key) = RH,( key ) (i = 1,2,3,4.....k)**\n\n这里的 RH,就是不同的散列函数，你可以把我们之前说过的那些散列函数都用上，每当发生冲突时就换一个散列函数，相信总有一个能够解决冲突的。这种方法能使关键字不产生聚集，但是代价就是增加了计算时间。是不是很简单啊。\n\n#### 链地址法\n\n下面我们再设想以下情景。\n\n> 袁记菜馆内，铃铃铃，铃铃铃电话铃又响了，那个大鹏又来订房间了。\n>\n> 大鹏：老袁啊，我一会去你那吃个饭，还是上回那个包间\n>\n> 袁厨：大鹏你下回能不能早点说啊，又没人订走了，这回是老王订的\n>\n> 大鹏：老王这个老东西啊，反正也是熟人，你再给我整个桌子，我拼在他后面吧\n\n不好意思啊各位同学，信鸽最近太贵了还没来得及买。上面的情景就是模拟我们的新的处理冲突的方法链地址法。\n\n上面我们都是遇到冲突之后，就换地方。那么我们有没有不换地方的办法呢？那就是我们现在说的链地址法。\n\n还记得我们说过得同义词吗？就是 key 不同 f(key) 相同的情况，我们将这些同义词存储在一个单链表中，这种表叫做同义词子表，散列表中只存储同义词子表的头指针。我们还是用刚才的例子，关键字集合为{12，67，56，16，25，37，22，29，15，47，48，21}，表长为 12，我们再用散列函数 **f(key) = key mod 12。**我们用了链地址法之后就再也不存在冲突了，无论有多少冲突，我们只需在同义词子表中添加结点即可。下面我们看下链地址法的存储情况。\n\n![image-20201118161354566](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201118161354566.139yir8z205s.png)\n\n链地址法虽然能够不产生冲突，但是也带来了查找时需要遍历单链表的性能消耗，有得必有失嘛。\n\n#### 公共溢出区法\n\n下面我们再来看一种新的方法，这回大鹏又要来吃饭了。\n\n> 袁记菜馆内.....\n>\n> 袁厨：呦，这是什么风把你给刮来了，咋没开你的大奔啊。\n>\n> 大鹏：哎呀妈呀，别那么多废话了，我快饿死了，你快给我找个位置，我要吃点饭。\n>\n> 袁厨：你来的，太不巧了，咱们的店已经满了，你先去旁边的小屋看会电视，等有空了我再叫你。小屋里面还有几个和你一样来晚的，你们一起看吧。\n>\n> 大鹏：电视？看电视？\n\n上面得情景就是模拟我们的公共溢出区法，这也是很好理解的，你不是冲突吗？那冲突的各位我先给你安排个地方呆着，这样你就有地方住了。我们为所有冲突的关键字建立了一个公共的溢出区来存放。\n\n![溢出区法](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/溢出区法.6oq4m66ei000.png)\n\n那么我们怎么进行查找呢？我们首先通过散列函数计算出散列地址后，先于基本表对比，如果不相等再到溢出表去顺序查找。这种解决冲突的方法，对于冲突很少的情况性能还是非常高的。\n\n### 散列表查找算法(线性探测法)\n\n下面我们来看一下散列表查找算法的实现\n\n首先需要定义散列列表的结构以及一些相关常数，其中 elem 代表散列表数据存储数组，count 代表的是当前插入元素个数，size 代表哈希表容量，NULLKEY 散列表初始值，然后我们如果查找成功就返回索引，如果不存在该元素就返回元素不存在。\n\n我们将哈希表初始化，为数组元素赋初值。\n\n![第一行](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/第一行.70gxkpul4fc0.png)\n\n插入操作的具体步骤：\n\n（1）通过哈希函数（除法散列法），将 key 转化为数组下标\n\n（2）如果该下标中没有元素，则插入，否则说明有冲突，则利用线性探测法处理冲突。详细步骤见注释\n\n![第二行](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/第二行.cph9jb8m24o.png)\n\n查找操作的具体步骤：\n\n（1）通过哈希函数（同插入时一样），将 key 转成数组下标\n\n（2）通过数组下标找到 key 值，如果 key 一致，则查找成功，否则利用线性探测法继续查找。\n\n![第三张](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/第三张.4iqbtyns3li0.png)\n\n下面我们来看一下完整代码\n\n![第四张](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/第四张.2uwq29s75o80.png)\n\n### 散列表性能分析\n\n如果没有冲突的话，散列查找是我们查找中效率最高的，时间复杂度为 O(1),但是没有冲突的情况是一种理想情况，那么散列查找的平均查找长度取决于哪些方面呢？\n\n**1.散列函数是否均匀**\n\n我们在上文说到，可以通过设计散列函数减少冲突，但是由于不同的散列函数对一组关键字产生冲突可能性是相同的，因此我们可以不考虑它对平均查找长度的影响。\n\n**2.处理冲突的方法**\n\n相同关键字，相同散列函数，不同处理冲突方式，会使平均查找长度不同，比如我们线性探测有时会堆积，则不如二次探测法好，因为链地址法处理冲突时不会产生任何堆积，因而具有最佳的平均查找性能\n\n**3.散列表的装填因子**\n\n本来想在上文中提到装填因子的，但是后来发现即使没有说明也不影响我们对哈希表的理解，下面我们来看一下装填因子的总结\n\n> 装填因子 α = 填入表中的记录数 / 散列表长度\n\n散列因子则代表着散列表的装满程度，表中记录越多，α 就越大，产生冲突的概率就越大。我们上面提到的例子中 表的长度为 12，填入记录数为 6，那么此时的 α = 6 / 12 = 0.5 所以说当我们的 α 比较大时再填入元素那么产生冲突的可能性就非常大了。所以说散列表的平均查找长度取决于装填因子，而不是取决于记录数。所以说我们需要做的就是选择一个合适的装填因子以便将平均查找长度限定在一个范围之内。\n',
        '2022-08-26 14:59:34', '2022-08-26 14:59:34');

-- ----------------------------
-- Table structure for article_inform
-- ----------------------------
DROP TABLE IF EXISTS `article_inform`;
CREATE TABLE `article_inform`
(
    `id`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
    `create_time`    datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime(0)                                                   DEFAULT NULL COMMENT '更新时间',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建者',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '状态（0-下架，1-发布）',
    `article_title`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标题',
    `introduce`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简介',
    `log_img`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题图',
    `article_type`   char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '文章分类',
    `article_tag`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章标签',
    `top_status`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否置顶（0-不置顶，1-置顶）',
    `origin_status`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否原创（0-原创，1-转载）',
    `comment_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否开启评论（0-不开启，1-开启）',
    `click_rate`     bigint(20)                                                    DEFAULT NULL COMMENT '文章点击量',
    `number_like`    bigint(20)                                                    DEFAULT NULL COMMENT '点赞数',
    `aggregate_id`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '归档id',
    `sort`           int(11)                                                       DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '文章基础信息'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_inform
-- ----------------------------
INSERT INTO `article_inform`
VALUES ('0c5081f8f05d8d74ea7e33a3bba20898', '2022-08-26 15:05:17', '2022-08-26 15:52:49', 'admin', '1',
        'LeetCode27（移除元素）',
        '给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/1ed9b49cd3524b73bb339da9f9790610.jpg',
        '0', '5', '0', '0', '0', 5, 1, '1c52c4082a066ceb06af01387f779111', 0);
INSERT INTO `article_inform`
VALUES ('0ee59e9f57979176ca917161eb527eda', '2022-08-29 17:27:16', '2022-08-29 19:01:02', 'admin', '1', 'LockSupport',
        '尚硅谷LockSupport学习笔记',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg',
        '0', '0,6', '0', '0', '1', 4, 0, NULL, 0);
INSERT INTO `article_inform`
VALUES ('444709ddbb995036803ccf9e2ac9a3e8', '2022-08-19 15:58:19', '2022-08-24 14:53:00', 'admin', '1',
        '使用SDK访问OSS', '使用SDK访问OSS',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/19/d638dc0affcc452a8cc162de99693be9.jpg',
        '0', '0', '0', '0', '0', 28, 9, NULL, 0);
INSERT INTO `article_inform`
VALUES ('5190b3e11fac608dd2c1a8834a2e00b5', '2022-08-26 14:23:13', '2022-08-29 19:04:10', 'admin', '1',
        'LeetCode1（两数之和）', '力扣算法第一题动画图解',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg',
        '0', '0,5', '0', '1', '1', 7, 0, '1c52c4082a066ceb06af01387f779111', 1);
INSERT INTO `article_inform`
VALUES ('5d2bfbfc022be8f6efed090aecc200b3', '2022-08-19 16:47:56', '2022-08-24 14:32:55', 'admin', '1', '谷粒商城（1）',
        '党的十八大以来，总书记在长春和沈阳召开过两场以东北振兴为主题的座谈会，分别提出了“四个着力”和“六方面要求”，其中都包括创新和民生。这次在沈阳，总书记再次强调这两个关键词。\n',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/19/b2af0eacfbf5488cb779c9ac1cddfeac.jpg',
        '0', '0', '0', '0', '0', 1, 0, '18efe15a68f91f3a720893ef50651fce', 0);
INSERT INTO `article_inform`
VALUES ('e82e394a13007e3dba1866b3eb21c7a4', '2022-08-26 14:59:34', '2022-08-26 16:00:07', 'admin', '1',
        'Hash表的那些事', '散列（哈希）表总结',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/92812a95121b4b44bcddc7d521b8b1be.jpg',
        '0', '5', '0', '0', '1', 3, 0, '1d63280d97d4c1dd3d1b852a235b574f', 0);

-- ----------------------------
-- Table structure for article_summary
-- ----------------------------
DROP TABLE IF EXISTS `article_summary`;
CREATE TABLE `article_summary`
(
    `id`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归档表id',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归档名称',
    `banner`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归档图',
    `create_time` datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   DEFAULT NULL COMMENT '修改时间',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '状态',
    `top_status`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '是否显示在首页',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '文章归档'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_summary
-- ----------------------------
INSERT INTO `article_summary`
VALUES ('18efe15a68f91f3a720893ef50651fce', '谷粒商城',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/1b1829ccdad145399eb6182013716197.jpg',
        '2022-08-19 17:21:46', '2022-08-19 18:13:25', '1', '1');
INSERT INTO `article_summary`
VALUES ('1c52c4082a066ceb06af01387f779111', '力扣算法练习集',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg',
        '2022-08-26 14:25:12', '2022-08-26 14:38:00', '1', '1');
INSERT INTO `article_summary`
VALUES ('1d63280d97d4c1dd3d1b852a235b574f', '数据结构与算法',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg',
        '2022-08-26 14:54:37', '2022-08-26 14:57:08', '1', '1');
INSERT INTO `article_summary`
VALUES ('75e0850650e86dd75927ee87886bdb14', '短信服务',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/f25e3b05bd6e43ec963b664732c89c21.jpg',
        '2022-08-19 18:14:10', '2022-08-26 14:54:46', '1', '0');
INSERT INTO `article_summary`
VALUES ('f205ef468bd79a460837623f77d623bd', '阿里云OSS',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg',
        '2022-08-19 18:14:29', '2022-08-26 14:57:19', '1', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`           int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`  datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`  datetime(0)                                                   DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '参数配置表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-04-27 02:10:24', 'admin',
        '2022-07-22 02:28:46', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-04-27 02:10:24', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-04-27 02:10:24', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-04-27 02:10:24', '', NULL,
        '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-04-27 02:10:24',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (6, 'oss云存储-是否开启云存储', 'sys.oss.enable', 'true', 'Y', 'admin', '2022-07-27 14:52:18', 'admin',
        '2022-07-29 15:02:59', '开启云存储需要配置application.yml里的oss相关参数（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_count
-- ----------------------------
DROP TABLE IF EXISTS `sys_count`;
CREATE TABLE `sys_count`
(
    `id`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
    `article_count` bigint(20) DEFAULT NULL COMMENT '文章数',
    `summary_count` bigint(20) DEFAULT NULL COMMENT '归档数',
    `user_count`    bigint(20) DEFAULT NULL COMMENT '用户数',
    `click_count`   bigint(20) DEFAULT NULL COMMENT '点击数',
    `like_count`    bigint(20) DEFAULT NULL COMMENT '点赞数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '统计归档'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_count
-- ----------------------------
INSERT INTO `sys_count`
VALUES ('1', 5, 5, 0, 43, 10);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4)                                                        DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 128
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-04-27 02:10:24', 'admin',
        '2022-07-22 06:16:44', '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-04-27 02:10:24', 'admin',
        '2022-07-21 11:52:18', '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-04-27 02:10:24', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (101, 0, '编程', '0', 'sys_article_type', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 01:20:03', '', NULL,
        '编程');
INSERT INTO `sys_dict_data`
VALUES (102, 1, '日常', '1', 'sys_article_type', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 01:20:43', '', NULL,
        '日常');
INSERT INTO `sys_dict_data`
VALUES (103, 0, 'Java', '0', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 01:21:22', '', NULL,
        'Java');
INSERT INTO `sys_dict_data`
VALUES (104, 0, 'SQL', '1', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 01:21:38', 'admin',
        '2022-08-08 09:27:52', 'SQL');
INSERT INTO `sys_dict_data`
VALUES (105, 1, '下架', '0', 'sys_article_status', NULL, 'danger', 'N', '0', 'admin', '2022-07-22 19:22:30', 'admin',
        '2022-08-19 15:48:22', '文章下架');
INSERT INTO `sys_dict_data`
VALUES (106, 0, '发布', '1', 'sys_article_status', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 19:22:53', 'admin',
        '2022-08-19 15:48:16', '文章发布');
INSERT INTO `sys_dict_data`
VALUES (107, 0, '默认', '0', 'sys_article_top', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 19:24:59', 'admin',
        '2022-07-22 19:27:42', '不置顶');
INSERT INTO `sys_dict_data`
VALUES (108, 0, '置顶', '1', 'sys_article_top', NULL, 'success', 'N', '0', 'admin', '2022-07-22 19:25:07', 'admin',
        '2022-08-05 15:51:39', '置顶');
INSERT INTO `sys_dict_data`
VALUES (109, 0, '原创', '0', 'sys_article_origin', NULL, 'success', 'N', '0', 'admin', '2022-07-22 19:27:31', 'admin',
        '2022-08-05 15:51:53', '文章原创');
INSERT INTO `sys_dict_data`
VALUES (110, 0, '转载', '1', 'sys_article_origin', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 19:28:10', '', NULL,
        '转载');
INSERT INTO `sys_dict_data`
VALUES (111, 0, '开启', '0', 'sys_article_comment', NULL, 'primary', 'N', '0', 'admin', '2022-07-22 19:28:36', 'admin',
        '2022-07-22 19:28:40', '开启评论');
INSERT INTO `sys_dict_data`
VALUES (112, 0, '关闭', '1', 'sys_article_comment', NULL, 'danger', 'N', '0', 'admin', '2022-07-22 19:28:54', 'admin',
        '2022-08-05 15:52:04', '关闭评论');
INSERT INTO `sys_dict_data`
VALUES (113, 0, '工具', '0', 'sys_website_type', NULL, 'primary', 'N', '0', 'admin', '2022-07-26 15:28:50', '', NULL,
        '工具');
INSERT INTO `sys_dict_data`
VALUES (114, 0, 'Java', '1', 'sys_website_type', NULL, 'primary', 'N', '0', 'admin', '2022-07-26 15:29:03', '', NULL,
        'Java');
INSERT INTO `sys_dict_data`
VALUES (115, 0, '前端', '2', 'sys_website_type', NULL, 'primary', 'N', '0', 'admin', '2022-07-26 15:29:13', 'admin',
        '2022-07-26 15:29:18', '前端');
INSERT INTO `sys_dict_data`
VALUES (116, 0, '正常', '0', 'sys_website_status', NULL, 'success', 'N', '0', 'admin', '2022-07-26 15:32:28', 'admin',
        '2022-07-27 16:36:30', '正常');
INSERT INTO `sys_dict_data`
VALUES (117, 0, '下架', '1', 'sys_website_status', NULL, 'info', 'N', '0', 'admin', '2022-07-26 15:32:42', 'admin',
        '2022-07-27 16:36:26', '下架');
INSERT INTO `sys_dict_data`
VALUES (118, 0, 'Spring', '2', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-08-08 09:27:25', 'admin',
        '2022-08-08 09:27:39', 'spring');
INSERT INTO `sys_dict_data`
VALUES (119, 0, 'Spring MVC', '3', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-08-08 09:28:23', '',
        NULL, 'Spring MVC');
INSERT INTO `sys_dict_data`
VALUES (120, 0, 'MyBatis', '4', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-08-08 09:28:42', 'admin',
        '2022-08-08 09:28:54', 'Mybatis');
INSERT INTO `sys_dict_data`
VALUES (121, 0, '上架', '1', 'sys_summary_status', NULL, 'primary', 'N', '0', 'admin', '2022-08-11 11:31:07', 'admin',
        '2022-08-11 11:31:40', '上架');
INSERT INTO `sys_dict_data`
VALUES (122, 0, '下架', '0', 'sys_summary_status', NULL, 'danger', 'N', '0', 'admin', '2022-08-11 11:31:26', 'admin',
        '2022-08-11 11:31:35', '下架');
INSERT INTO `sys_dict_data`
VALUES (123, 0, '默认', '0', 'sys_summary_top', NULL, 'success', 'N', '0', 'admin', '2022-08-12 19:17:40', 'admin',
        '2022-08-12 19:43:52', '不显示在首页');
INSERT INTO `sys_dict_data`
VALUES (124, 0, '展示', '1', 'sys_summary_top', NULL, 'primary', 'N', '0', 'admin', '2022-08-12 19:17:54', 'admin',
        '2022-08-12 19:43:48', '显示在首页');
INSERT INTO `sys_dict_data`
VALUES (125, 0, 'BUG', '2', 'sys_article_type', NULL, 'primary', 'N', '0', 'admin', '2022-08-19 15:45:26', 'admin',
        '2022-08-19 15:45:32', 'BUG');
INSERT INTO `sys_dict_data`
VALUES (126, 0, '算法', '5', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-08-19 15:46:31', '', NULL,
        '算法');
INSERT INTO `sys_dict_data`
VALUES (127, 0, 'JUC', '6', 'sys_article_tag', NULL, 'primary', 'N', '0', 'admin', '2022-08-29 09:25:52', '', NULL,
        'JUC');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime(0)                                                   DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 114
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典类型表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-04-27 02:10:24', 'admin', '2022-07-22 06:57:38',
        '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-04-27 02:10:24', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type`
VALUES (100, '文章分类', 'sys_article_type', '0', 'admin', '2022-07-20 01:14:22', 'admin', '2022-07-22 06:17:14',
        '文章分类');
INSERT INTO `sys_dict_type`
VALUES (104, '文章标签', 'sys_article_tag', '0', 'admin', '2022-07-22 01:19:31', '', NULL, '文章标签');
INSERT INTO `sys_dict_type`
VALUES (106, '文章状态', 'sys_article_status', '0', 'admin', '2022-07-22 17:09:06', '', NULL, '文章状态');
INSERT INTO `sys_dict_type`
VALUES (107, '文章置顶', 'sys_article_top', '0', 'admin', '2022-07-22 19:23:51', '', NULL, '文章是否置顶');
INSERT INTO `sys_dict_type`
VALUES (108, '文章原创', 'sys_article_origin', '0', 'admin', '2022-07-22 19:26:02', '', NULL, '文章是否原创');
INSERT INTO `sys_dict_type`
VALUES (109, '文章评论', 'sys_article_comment', '0', 'admin', '2022-07-22 19:26:44', '', NULL, '是否开启评论');
INSERT INTO `sys_dict_type`
VALUES (110, '资源分类', 'sys_website_type', '0', 'admin', '2022-07-26 15:27:22', '', NULL, '资源分类');
INSERT INTO `sys_dict_type`
VALUES (111, '资源状态', 'sys_website_status', '0', 'admin', '2022-07-26 15:32:05', '', NULL, '资源状态');
INSERT INTO `sys_dict_type`
VALUES (112, '归档状态', 'sys_summary_status', '0', 'admin', '2022-08-11 11:30:26', '', NULL, '归档状态');
INSERT INTO `sys_dict_type`
VALUES (113, '归档置顶', 'sys_summary_top', '0', 'admin', '2022-08-12 19:17:03', '', NULL, '归档置顶');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime(0)                                                   DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 112
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 02:14:22');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 07:16:40');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-11 01:19:05');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-11 06:03:09');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-11 07:08:20');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-20 00:52:08');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 08:29:27');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-07-21 09:20:15');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 09:20:21');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-21 09:30:15');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 09:30:22');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 11:05:38');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4)                                                       NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime(0)                                                   DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '通知公告表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '模块标题',
    `business_type`  int(2)                                                         DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '请求方式',
    `operator_type`  int(1)                                                         DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
    `status`         int(1)                                                         DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime(0)                                                    DEFAULT NULL COMMENT '操作时间',
    PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 83
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (1, '操作日志', 9, 'com.jzj.vblog.web.controller.admin.SysOperLogController.clean()', 'DELETE', 1, 'admin', NULL,
        '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 09:03:27');
INSERT INTO `sys_oper_log`
VALUES (2, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleLog',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:22:07');
INSERT INTO `sys_oper_log`
VALUES (3, '文章管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleInformController.add()', 'POST', 1, 'admin', NULL,
        '/article/inform/add', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"leetcode1两数之和\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def twoSum(nums: List[int], target: int)->List[int]:\\n        if len(nums) < 2:\\n            return [0]\\n        rearr = [0] * 2\\n        # 查询元素\\n        for i in range(0, len(nums)):\\n            for j in range(i + 1, len(nums)):\\n                # 发现符合条件情况\\n                if nums[i] + nums[j] == target:\\n                    rearr[0] = i\\n                    rearr[1] = j\\n        return rearr\\n```\\n\\nSwift Code:\\n\\n```swift\\nclass Solution {\\n    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {\\n        let count = nums.',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:23:13');
INSERT INTO `sys_oper_log`
VALUES (4, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:25:10');
INSERT INTO `sys_oper_log`
VALUES (5, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin', NULL,
        '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495111780,\"topStatus\":\"0\",\"name\":\"力扣算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495111780,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:25:11');
INSERT INTO `sys_oper_log`
VALUES (6, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin', NULL,
        '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904069000,\"topStatus\":\"0\",\"name\":\"阿里云OSS\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg\",\"updateTime\":1661495119389,\"id\":\"f205ef468bd79a460837623f77d623bd\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:25:19');
INSERT INTO `sys_oper_log`
VALUES (7, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin', NULL,
        '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495112000,\"topStatus\":\"1\",\"name\":\"力扣算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495123121,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:25:22');
INSERT INTO `sys_oper_log`
VALUES (8, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"leetcode1两数之和\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def twoSum(nums: List[int], target: int)->List[int]:\\n        if len(nums) < 2:\\n            return [0]\\n        rearr = [0] * 2\\n        # 查询元素\\n        for i in range(0, len(nums)):\\n            for j in range(i + 1, len(nums)):\\n                # 发现符合条件情况\\n                if nums[i] + nums[j] == target:\\n                    rearr[0] = i\\n                    rearr[1] = j\\n        return rearr\\n```\\n\\nSwift Code:\\n\\n```swift\\nclass Solution {\\n    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {\\n        let count = nums.',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:26:17');
INSERT INTO `sys_oper_log`
VALUES (9, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode1（两数之和）\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def twoSum(nums: List[int], target: int)->List[int]:\\n        if len(nums) < 2:\\n            return [0]\\n        rearr = [0] * 2\\n        # 查询元素\\n        for i in range(0, len(nums)):\\n            for j in range(i + 1, len(nums)):\\n                # 发现符合条件情况\\n                if nums[i] + nums[j] == target:\\n                    rearr[0] = i\\n                    rearr[1] = j\\n        return rearr\\n```\\n\\nSwift Code:\\n\\n```swift\\nclass Solution {\\n    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {\\n        let count = num',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:28:12');
INSERT INTO `sys_oper_log`
VALUES (10, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode1（两数之和）\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\n\\n**哈希表**\\n\\n**解析**\\n\\n哈希表的做法很容易理解，我们只需通过一次循环即可，假如我们的 target 值为 9，当前指针指向的值为 2 ，我们只需从哈希表中查找是否含有 7，因为 9 - 2 =7 。如果含有 7 我们直接返回即可，如果不含有则将当前的 2 存入哈希表中，指针移动，指向下一元素。注： key 为元素值，value 为元素索引。\\n\\n**动图解析：**\\n\\n![两数之和](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/两数之和.7228lcxkqpw0.gif)\\n\\n是不是很容易理解，下面我们来看一下题目代码。\\n\\n**题目代码：**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();\\n        for(int i = 0; i < nums.length; i++){\\n            //如果存在则返回\\n            if(map.contai',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:32:04');
INSERT INTO `sys_oper_log`
VALUES (11, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495112000,\"topStatus\":\"1\",\"name\":\"力扣算法练习集\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495123000,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:33:20');
INSERT INTO `sys_oper_log`
VALUES (12, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495112000,\"topStatus\":\"1\",\"name\":\"力扣算法练习集\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495123000,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:34:58');
INSERT INTO `sys_oper_log`
VALUES (13, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495112000,\"topStatus\":\"1\",\"name\":\"力扣算法练习集\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495123000,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:37:21');
INSERT INTO `sys_oper_log`
VALUES (14, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495112000,\"topStatus\":\"1\",\"name\":\"力扣算法练习集\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/7091021b67314a7db82601b53a89a3fe.jpg\",\"updateTime\":1661495879682,\"id\":\"1c52c4082a066ceb06af01387f779111\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:37:59');
INSERT INTO `sys_oper_log`
VALUES (15, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/503f7ac7b24d4362b19065305ada5259.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:39:22');
INSERT INTO `sys_oper_log`
VALUES (16, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661495963805,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/503f7ac7b24d4362b19065305ada5259.jpg\",\"updateTime\":1661495963805,\"id\":\"0551c73729133c7125d7a08a8ea7da64\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:39:23');
INSERT INTO `sys_oper_log`
VALUES (17, '归档管理', 3, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.remove()', 'DELETE', 1, 'admin',
        NULL, '/article/summary/0551c73729133c7125d7a08a8ea7da64', '127.0.0.1', '内网IP',
        '{ids=0551c73729133c7125d7a08a8ea7da64}', '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL,
        '2022-08-26 14:42:12');
INSERT INTO `sys_oper_log`
VALUES (18, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:42:21');
INSERT INTO `sys_oper_log`
VALUES (19, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:42:22');
INSERT INTO `sys_oper_log`
VALUES (20, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496150943,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\",\"updateTime\":1661496150944,\"id\":\"a2dc1dc4730197016af174cedd40abcb\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:42:30');
INSERT INTO `sys_oper_log`
VALUES (21, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496151000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\",\"updateTime\":1661496156941,\"id\":\"a2dc1dc4730197016af174cedd40abcb\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:42:36');
INSERT INTO `sys_oper_log`
VALUES (22, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496151000,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\",\"updateTime\":1661496172876,\"id\":\"a2dc1dc4730197016af174cedd40abcb\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:42:52');
INSERT INTO `sys_oper_log`
VALUES (23, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496151000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/530a8bc0b58e4327bf34939c3b86dd42.jpg\",\"updateTime\":1661496173000,\"id\":\"a2dc1dc4730197016af174cedd40abcb\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:44:54');
INSERT INTO `sys_oper_log`
VALUES (24, '归档管理', 3, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.remove()', 'DELETE', 1, 'admin',
        NULL, '/article/summary/a2dc1dc4730197016af174cedd40abcb', '127.0.0.1', '内网IP',
        '{ids=a2dc1dc4730197016af174cedd40abcb}', '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL,
        '2022-08-26 14:45:01');
INSERT INTO `sys_oper_log`
VALUES (25, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:45:07');
INSERT INTO `sys_oper_log`
VALUES (26, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:45:08');
INSERT INTO `sys_oper_log`
VALUES (27, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:45:10');
INSERT INTO `sys_oper_log`
VALUES (28, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496736866,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496736866,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:52:16');
INSERT INTO `sys_oper_log`
VALUES (29, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496742695,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:52:22');
INSERT INTO `sys_oper_log`
VALUES (30, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496813922,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:53:33');
INSERT INTO `sys_oper_log`
VALUES (31, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496814000,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:53:39');
INSERT INTO `sys_oper_log`
VALUES (32, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"0\",\"name\":\"数据结构与算法1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496823402,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:53:43');
INSERT INTO `sys_oper_log`
VALUES (33, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"1\",\"name\":\"数据结构与算法1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496823000,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:53:49');
INSERT INTO `sys_oper_log`
VALUES (34, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496823000,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:53:54');
INSERT INTO `sys_oper_log`
VALUES (35, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496838675,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:53:58');
INSERT INTO `sys_oper_log`
VALUES (36, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"0\",\"name\":\"数据结构与算法1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496845709,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:54:05');
INSERT INTO `sys_oper_log`
VALUES (37, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496737000,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/4f8a33876cfe4c42b9fface62c326f5a.jpg\",\"updateTime\":1661496851321,\"id\":\"1461a07470cd32400813fde1ae6f18b9\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:54:11');
INSERT INTO `sys_oper_log`
VALUES (38, '归档管理', 3, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.remove()', 'DELETE', 1, 'admin',
        NULL, '/article/summary/1461a07470cd32400813fde1ae6f18b9', '127.0.0.1', '内网IP',
        '{ids=1461a07470cd32400813fde1ae6f18b9}', '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL,
        '2022-08-26 14:54:22');
INSERT INTO `sys_oper_log`
VALUES (39, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:54:32');
INSERT INTO `sys_oper_log`
VALUES (40, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:54:34');
INSERT INTO `sys_oper_log`
VALUES (41, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496876884,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661496876884,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:54:36');
INSERT INTO `sys_oper_log`
VALUES (42, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904050000,\"topStatus\":\"0\",\"name\":\"短信服务\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/f25e3b05bd6e43ec963b664732c89c21.jpg\",\"updateTime\":1661496886229,\"id\":\"75e0850650e86dd75927ee87886bdb14\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:54:46');
INSERT INTO `sys_oper_log`
VALUES (43, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661496890994,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:54:50');
INSERT INTO `sys_oper_log`
VALUES (44, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"1\",\"name\":\"数据结构与算法1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661496891000,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:54:53');
INSERT INTO `sys_oper_log`
VALUES (45, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"1\",\"name\":\"数据结构与算法1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661497015143,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:56:54');
INSERT INTO `sys_oper_log`
VALUES (46, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661497018752,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:56:58');
INSERT INTO `sys_oper_log`
VALUES (47, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"0\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661497022613,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:57:02');
INSERT INTO `sys_oper_log`
VALUES (48, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1661496877000,\"topStatus\":\"1\",\"name\":\"数据结构与算法\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/0985b0873c304148a2454a3a73a53924.jpg\",\"updateTime\":1661497027683,\"id\":\"1d63280d97d4c1dd3d1b852a235b574f\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:57:07');
INSERT INTO `sys_oper_log`
VALUES (49, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904069000,\"topStatus\":\"1\",\"name\":\"阿里云OSS\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg\",\"updateTime\":1661495119000,\"id\":\"f205ef468bd79a460837623f77d623bd\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:57:11');
INSERT INTO `sys_oper_log`
VALUES (50, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904069000,\"topStatus\":\"1\",\"name\":\"阿里云OSS\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg\",\"updateTime\":1661495119000,\"id\":\"f205ef468bd79a460837623f77d623bd\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:57:13');
INSERT INTO `sys_oper_log`
VALUES (51, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904069000,\"topStatus\":\"1\",\"name\":\"阿里云OSS1\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg\",\"updateTime\":1661495119000,\"id\":\"f205ef468bd79a460837623f77d623bd\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:57:15');
INSERT INTO `sys_oper_log`
VALUES (52, '归档管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.edit()', 'PUT', 1, 'admin',
        NULL, '/article/summary/', '127.0.0.1', '内网IP',
        '{\"createTime\":1660904069000,\"topStatus\":\"0\",\"name\":\"阿里云OSS\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/19/0ebaed38e57348179a5e9565fd5dbb3d.jpg\",\"updateTime\":1661497038934,\"id\":\"f205ef468bd79a460837623f77d623bd\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:57:18');
INSERT INTO `sys_oper_log`
VALUES (53, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleSummary',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/92779e36c3344d6ba37cb502668da6de.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:57:27');
INSERT INTO `sys_oper_log`
VALUES (54, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"topStatus\":\"1\",\"name\":\"11\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/92779e36c3344d6ba37cb502668da6de.jpg\",\"params\":{},\"status\":\"1\"}',
        NULL, 1, '归档置顶数置顶数超过最大值3', '2022-08-26 14:57:30');
INSERT INTO `sys_oper_log`
VALUES (55, '归档管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.add()', 'POST', 1, 'admin',
        NULL, '/article/summary/add', '127.0.0.1', '内网IP',
        '{\"createTime\":1661497053193,\"topStatus\":\"0\",\"name\":\"11\",\"banner\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleSummary/2022/08/26/92779e36c3344d6ba37cb502668da6de.jpg\",\"updateTime\":1661497053193,\"id\":\"2bd320b3ad8154c86239eedb4e01e71b\",\"params\":{},\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:57:33');
INSERT INTO `sys_oper_log`
VALUES (56, '归档管理', 3, 'com.jzj.vblog.web.controller.admin.ArticleSummaryController.remove()', 'DELETE', 1, 'admin',
        NULL, '/article/summary/2bd320b3ad8154c86239eedb4e01e71b', '127.0.0.1', '内网IP',
        '{ids=2bd320b3ad8154c86239eedb4e01e71b}', '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL,
        '2022-08-26 14:57:36');
INSERT INTO `sys_oper_log`
VALUES (57, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleLog',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/92812a95121b4b44bcddc7d521b8b1be.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 14:59:13');
INSERT INTO `sys_oper_log`
VALUES (58, '文章管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleInformController.add()', 'POST', 1, 'admin', NULL,
        '/article/inform/add', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"Hash表的那些事\",\"introduce\":\"散列（哈希）表总结\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/92812a95121b4b44bcddc7d521b8b1be.jpg\",\"content\":\"# 散列（哈希）表总结\\n\\n之前给大家介绍了**链表**，**栈和队列**今天我们来说一种新的数据结构散列（哈希）表，散列是应用非常广泛的数据结构，在我们的刷题过程中，散列表的出场率特别高。所以我们快来一起把散列表的内些事给整明白吧。文章框架如下\\n\\n![脑图](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/脑图.1pk584kfatxc.png)\\n\\n说散列表之前，我们先设想以下场景。\\n\\n> 袁厨穿越回了古代，凭借从现代学习的做饭手艺，开了一个袁记菜馆，正值开业初期，店里生意十分火爆，但是顾客结账时就犯难了，每当结账的时候，老板娘总是按照菜单一个一个找价格（遍历查找），每次都要找半天，所以结账的地方总是排起长队，顾客们表示用户体验不咋滴。袁厨一想这不是办法啊，让顾客老是等着，太影响客户体验啦。所以袁厨就先把菜单按照首字母排序（二分查找），然后查找的时候根据首字母查找，这样结账的时候就能大大提高检索效率啦！但是呢？工作日顾客不多，老板娘完全应付的过来，但是每逢节假日，还是会排起长队。那么有没有什么更好的办法呢？对呀！我们把所有的价格都背下来不就可以了吗？每个菜的价格我们都了如指掌，结账的时候我们只需简单相加即可。所以袁厨和老板娘加班加点的进行背诵。下次再结账的时候一说吃了什么菜，我们立马就知道价格啦。自此以后收银台再也没有出现过长队啦，袁记菜馆开着开着一不小心就成了天下第一饭店了。\\n\\n下面我们来看一下袁记菜馆老板娘进化史。\\n\\n![image-20201117132633797](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117132633797.5dlsgarvplc0.png)\\n\\n上面的后期结账的过程则模拟了我们的散列表查找，那么在计算机中是如何使用进行查找的呢？\\n\\n### 散列表查找步骤\\n\\n散列表-------最有用的基本数据结构之一。是根据关键码的值儿直接进行访问的数据结构，散列表的实现常常叫做**散列（hasing）**。散列是一种用于以**常数平均时间**执行插入、删除和查找的技术，下面我们来看一下散列过程。\\n\\n我们的整个散列过程主要分为两步\\n\\n（1）通过**散列函数**计算记录的散列地址，并按此**散列地址**存储该记录。就好比麻辣鱼我们就让它在川菜区，糖醋鱼，我们就让它在鲁菜区。但是我们需要注意的是，无论什么记录我们都需要用**同一个散列函数**计算地址，再存储。\\n\\n（2)当我们查找时，我们通过**同样的散列函数**计算记录的散列地址，按此散列地址访问该记录。因为我们存和取得时候用的都是一个散列函数，因此结果肯定相同。\\n\\n刚才我们在散列过程中提到了散列函数，那么散列函数是什么呢？\\n\\n我们假设某个函数为 **f**，使得\\n\\n​ **存储位置 = f (关键字)**\\n\\n**输入：关键字** **输出：存储位置(散列地址)**\\n\\n那样我们就能通过查找关键字**不需要比较**就可获得需要的记录的存储位置。这种存储技术被称为散列技术。散列技术是在通过记录的存储位置和它的关键字之间建立一个确定的对应关系 **f** ,使得每个关键字 **key** 都对应一个存储位置 **f(key)**。见下图\\n\\n![image-20201117145348616](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/image-20201117145348616.7l7om0vd7ww0.png)\\n\\n这里的 **f** 就是我们所说的散列函数（哈希）函数。我们利用散列技术将记录存储在一块连续的存储空间中，这块连续存储空间就是我们本文的主人公------**散列(哈希)表**\\n\\n上图为我们描述了用散列函数将关键字映射到散列表，但是大家有没有考虑到这种情况，那就是将关键字映射到同一个槽中的情况，即 **f(k4) = f(k3)** 时。这种情况我们将其称之为**冲突**，**k3** 和 **k4*',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 14:59:33');
INSERT INTO `sys_oper_log`
VALUES (59, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleLog',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/1ed9b49cd3524b73bb339da9f9790610.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-26 15:04:55');
INSERT INTO `sys_oper_log`
VALUES (60, '文章管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleInformController.add()', 'POST', 1, 'admin', NULL,
        '/article/inform/add', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode27（移除元素）\",\"introduce\":\"给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/1ed9b49cd3524b73bb339da9f9790610.jpg\",\"content\":\"#### [27. 移除元素](https://leetcode-cn.com/problems/remove-element/)\\n\\n**题目描述**\\n\\n> 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\\n>\\n> 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。\\n>\\n> 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 1:**\\n\\n> 给定 nums = [3,2,2,3], val = 3,\\n>\\n> 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 2:**\\n\\n> 给定 nums = [0,1,2,2,3,0,4,2], val = 2,\\n>\\n> 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。\\n>\\n> 注意这五个元素可为任意顺序。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**暴力法**\\n\\n**解析**\\n\\n该题目也算是简单题目，适合新手来做，然后大家也不要看不起暴力解法，我们可以先写出暴力解法，然后再思考其他方法，这对于我们的编码能力有很大的帮助。我们来解析一下这个题目的做题思路，他的含义就是让我们删除掉数组中的元素，然后将数组后面的元素跟上来。最后返回删除掉元素的数组长度即可。比如数组长度为 10，里面有 2 个目标值，我们最后返回的长度为 8，但是返回的 8 个元素，需要排在数组的最前面。那么暴力解法的话则就需要两个 for 循环，一个用来找到删除，另一个用来更新数组。\\n\\n![移除数组元素暴力法](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/移除数组元素.lhuefelqd5o.png)\\n\\n总体思路就是这样的，后面的会不断往前覆盖。暴力解法也是不超时的，实现也不算太简单主要需要注意两个地方。\\n\\n（1）需要先定义变量 len 获取数组长度，因为后面我们的返回的数组长度是改变的，所以不可以用 nums.length 作为上界\\n\\n（2）我们每找到一个需要删除的值的时候，需要 i--，防止出现多个需要删除的值在一起的情况，然后漏删。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int removeElement(int[] nums, int val) {\\n        //获取数组长度\\n        int len = nums.length;\\n        if (len == 0) {\\n            return 0;\\n        }\\n        int i = 0;\\n        for (i = 0; i < len; ++i) {\\n            //发现符合条件的情况\\n            if (nums[i] == val) {\\n                //前移一位\\n                for (int j = i; j < len-1; ++j) {\\n                    nums[j] = nums[j+1];\\n                }\\n                i--;\\n                len--;\\n            }\\n        }\\n        return i;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def removeElement(self, nums: List[int], val: int)->int:\\n     ',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 15:05:16');
INSERT INTO `sys_oper_log`
VALUES (61, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode1（两数之和）\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\n\\n**哈希表**\\n\\n**解析**\\n\\n哈希表的做法很容易理解，我们只需通过一次循环即可，假如我们的 target 值为 9，当前指针指向的值为 2 ，我们只需从哈希表中查找是否含有 7，因为 9 - 2 =7 。如果含有 7 我们直接返回即可，如果不含有则将当前的 2 存入哈希表中，指针移动，指向下一元素。注： key 为元素值，value 为元素索引。\\n\\n**动图解析：**\\n\\n![两数之和](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/两数之和.7228lcxkqpw0.gif)\\n\\n是不是很容易理解，下面我们来看一下题目代码。\\n\\n**题目代码：**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();\\n        for(int i = 0; i < nums.length; i++){\\n            //如果存在则返回\\n            if(map.contai',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 15:47:55');
INSERT INTO `sys_oper_log`
VALUES (62, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode1（两数之和）\",\"introduce\":\"力扣算法第一题动画图解\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/26a0e7c1f8c54eaea5707263b2d7a26c.jpg\",\"sort\":1,\"content\":\"#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)\\n\\n**题目描述：**\\n\\n> 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\\n>\\n> 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。\\n\\n**示例:**\\n\\n> 给定 nums = [2, 7, 11, 15], target = 9\\n>\\n> 因为 nums[0] + nums[1] = 2 + 7 = 9\\n> 所以返回 [0, 1]\\n\\n题目很容易理解，即让查看数组中有没有两个数的和为目标数，如果有的话则返回两数下标，我们为大家提供两种解法双指针（暴力）法，和哈希表法\\n\\n**双指针（暴力）法**\\n\\n**解析**\\n\\n双指针（L,R）法的思路很简单，L 指针用来指向第一个值，R 指针用来从第 L 指针的后面查找数组中是否含有和 L 指针指向值和为目标值的数。见下图\\n\\n![图示](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/微信图片_20210104150003.3unncifeoe80.jpg)\\n\\n例：绿指针指向的值为 3，蓝指针需要在绿指针的后面遍历查找是否含有 target - 3 = 2 的元素，若含有返回即可。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        if(nums.length < 2){\\n            return new int[0];\\n        }\\n        int[] rearr = new int[2];\\n        //查询元素\\n        for(int i = 0; i < nums.length; i++){\\n            for(int j = i+1; j < nums.length; j++ ){\\n                //发现符合条件情况\\n                if(nums[i] + nums[j] ==target){\\n                    rearr[0] = i;\\n                    rearr[1] = j;\\n                }\\n            }\\n        }\\n        return rearr;\\n    }\\n}\\n```\\n\\n\\n**哈希表**\\n\\n**解析**\\n\\n哈希表的做法很容易理解，我们只需通过一次循环即可，假如我们的 target 值为 9，当前指针指向的值为 2 ，我们只需从哈希表中查找是否含有 7，因为 9 - 2 =7 。如果含有 7 我们直接返回即可，如果不含有则将当前的 2 存入哈希表中，指针移动，指向下一元素。注： key 为元素值，value 为元素索引。\\n\\n**动图解析：**\\n\\n![两数之和](https://cdn.jsdelivr.net/gh/tan45du/tan45du.github.io.photo@master/photo/两数之和.7228lcxkqpw0.gif)\\n\\n是不是很容易理解，下面我们来看一下题目代码。\\n\\n**题目代码：**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int[] twoSum(int[] nums, int target) {\\n        HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();\\n        for(int i = 0; i < nums.length; i++){\\n            //如果存在则返回\\n            if(m',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 15:50:56');
INSERT INTO `sys_oper_log`
VALUES (63, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode27（移除元素）\",\"introduce\":\"给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/1ed9b49cd3524b73bb339da9f9790610.jpg\",\"sort\":3,\"content\":\"#### [27. 移除元素](https://leetcode-cn.com/problems/remove-element/)\\n\\n**题目描述**\\n\\n> 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\\n>\\n> 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。\\n>\\n> 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 1:**\\n\\n> 给定 nums = [3,2,2,3], val = 3,\\n>\\n> 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 2:**\\n\\n> 给定 nums = [0,1,2,2,3,0,4,2], val = 2,\\n>\\n> 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。\\n>\\n> 注意这五个元素可为任意顺序。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**暴力法**\\n\\n**解析**\\n\\n该题目也算是简单题目，适合新手来做，然后大家也不要看不起暴力解法，我们可以先写出暴力解法，然后再思考其他方法，这对于我们的编码能力有很大的帮助。我们来解析一下这个题目的做题思路，他的含义就是让我们删除掉数组中的元素，然后将数组后面的元素跟上来。最后返回删除掉元素的数组长度即可。比如数组长度为 10，里面有 2 个目标值，我们最后返回的长度为 8，但是返回的 8 个元素，需要排在数组的最前面。那么暴力解法的话则就需要两个 for 循环，一个用来找到删除，另一个用来更新数组。\\n\\n![移除数组元素暴力法](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/移除数组元素.lhuefelqd5o.png)\\n\\n总体思路就是这样的，后面的会不断往前覆盖。暴力解法也是不超时的，实现也不算太简单主要需要注意两个地方。\\n\\n（1）需要先定义变量 len 获取数组长度，因为后面我们的返回的数组长度是改变的，所以不可以用 nums.length 作为上界\\n\\n（2）我们每找到一个需要删除的值的时候，需要 i--，防止出现多个需要删除的值在一起的情况，然后漏删。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int removeElement(int[] nums, int val) {\\n        //获取数组长度\\n        int len = nums.length;\\n        if (len == 0) {\\n            return 0;\\n        }\\n        int i = 0;\\n        for (i = 0; i < len; ++i) {\\n            //发现符合条件的情况\\n            if (nums[i] == val) {\\n                //前移一位\\n                for (int j = i; j < len-1; ++j) {\\n                    nums[j] = nums[j+1];\\n                }\\n                i--;\\n                len--;\\n            }\\n        }\\n        return i;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def removeElement(self, nums: List[int], val: int)->in',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 15:52:37');
INSERT INTO `sys_oper_log`
VALUES (64, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LeetCode27（移除元素）\",\"introduce\":\"给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/26/1ed9b49cd3524b73bb339da9f9790610.jpg\",\"sort\":0,\"content\":\"#### [27. 移除元素](https://leetcode-cn.com/problems/remove-element/)\\n\\n**题目描述**\\n\\n> 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\\n>\\n> 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。\\n>\\n> 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 1:**\\n\\n> 给定 nums = [3,2,2,3], val = 3,\\n>\\n> 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**示例 2:**\\n\\n> 给定 nums = [0,1,2,2,3,0,4,2], val = 2,\\n>\\n> 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。\\n>\\n> 注意这五个元素可为任意顺序。\\n>\\n> 你不需要考虑数组中超出新长度后面的元素。\\n\\n**暴力法**\\n\\n**解析**\\n\\n该题目也算是简单题目，适合新手来做，然后大家也不要看不起暴力解法，我们可以先写出暴力解法，然后再思考其他方法，这对于我们的编码能力有很大的帮助。我们来解析一下这个题目的做题思路，他的含义就是让我们删除掉数组中的元素，然后将数组后面的元素跟上来。最后返回删除掉元素的数组长度即可。比如数组长度为 10，里面有 2 个目标值，我们最后返回的长度为 8，但是返回的 8 个元素，需要排在数组的最前面。那么暴力解法的话则就需要两个 for 循环，一个用来找到删除，另一个用来更新数组。\\n\\n![移除数组元素暴力法](https://cdn.jsdelivr.net/gh/tan45du/github.io.phonto2@master/myphoto/移除数组元素.lhuefelqd5o.png)\\n\\n总体思路就是这样的，后面的会不断往前覆盖。暴力解法也是不超时的，实现也不算太简单主要需要注意两个地方。\\n\\n（1）需要先定义变量 len 获取数组长度，因为后面我们的返回的数组长度是改变的，所以不可以用 nums.length 作为上界\\n\\n（2）我们每找到一个需要删除的值的时候，需要 i--，防止出现多个需要删除的值在一起的情况，然后漏删。\\n\\n**题目代码**\\n\\nJava Code:\\n\\n```java\\nclass Solution {\\n    public int removeElement(int[] nums, int val) {\\n        //获取数组长度\\n        int len = nums.length;\\n        if (len == 0) {\\n            return 0;\\n        }\\n        int i = 0;\\n        for (i = 0; i < len; ++i) {\\n            //发现符合条件的情况\\n            if (nums[i] == val) {\\n                //前移一位\\n                for (int j = i; j < len-1; ++j) {\\n                    nums[j] = nums[j+1];\\n                }\\n                i--;\\n                len--;\\n            }\\n        }\\n        return i;\\n    }\\n}\\n```\\n\\nPython3 Code:\\n\\n```python\\nfrom typing import List\\nclass Solution:\\n    def removeElement(self, nums: List[int], val: int)->in',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 15:52:48');
INSERT INTO `sys_oper_log`
VALUES (65, '备忘录', 2, 'com.jzj.vblog.web.controller.admin.SysTodoController.edit()', 'PUT', 1, 'admin', NULL,
        '/sys/todo', '127.0.0.1', '内网IP',
        '{\"createTime\":1660470423000,\"updateTime\":1661513575578,\"id\":\"5968d94f9d2d78f383c9cb8ee0595756\",\"text\":\"好好好学习天天向上\",\"params\":{},\"done\":true}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 19:32:54');
INSERT INTO `sys_oper_log`
VALUES (66, '备忘录', 2, 'com.jzj.vblog.web.controller.admin.SysTodoController.edit()', 'PUT', 1, 'admin', NULL,
        '/sys/todo', '127.0.0.1', '内网IP',
        '{\"createTime\":1660470423000,\"updateTime\":1661513580332,\"id\":\"5968d94f9d2d78f383c9cb8ee0595756\",\"text\":\"好好好学习天天向上\",\"params\":{},\"done\":false}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-26 19:32:59');
INSERT INTO `sys_oper_log`
VALUES (67, '字典类型', 1, 'com.jzj.vblog.web.controller.admin.SysDictDataController.add()', 'POST', 1, 'admin', NULL,
        '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"dictValue\":\"6\",\"listClass\":\"primary\",\"dictSort\":0,\"remark\":\"JUC\",\"updateTime\":1661765152482,\"params\":{},\"dictType\":\"sys_article_tag\",\"dictLabel\":\"JUC\",\"createBy\":\"admin\",\"createTime\":1661765152482,\"status\":\"0\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 09:25:52');
INSERT INTO `sys_oper_log`
VALUES (68, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '//api/upload/uploadImg', '127.0.0.1', '内网IP', 'articleLog',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 09:26:58');
INSERT INTO `sys_oper_log`
VALUES (69, '文章管理', 1, 'com.jzj.vblog.web.controller.admin.ArticleInformController.add()', 'POST', 1, 'admin', NULL,
        '/article/inform/add', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LockSupport\",\"introduce\":\"尚硅谷LockSupport学习笔记\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\",\"sort\":0,\"content\":\"\",\"commentStatus\":\"1\",\"articleTag\":\"0,6\",\"articleType\":\"0\",\"topStatus\":\"0\",\"originStatus\":\"0\",\"status\":\"1\"}',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 09:27:15');
INSERT INTO `sys_oper_log`
VALUES (70, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/8410db84db064621ae8c9850f4182fc6.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 09:28:29');
INSERT INTO `sys_oper_log`
VALUES (71, '文件管理', 3, 'com.jzj.vblog.web.controller.UploadController.deleteImg()', 'DELETE', 1, 'admin', NULL,
        '/api/upload/deleteImg', '127.0.0.1', '内网IP', '{}',
        '{\"code\":20000,\"data\":\"删除成功\",\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 09:28:42');
INSERT INTO `sys_oper_log`
VALUES (72, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 09:42:12');
INSERT INTO `sys_oper_log`
VALUES (73, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 09:52:15');
INSERT INTO `sys_oper_log`
VALUES (74, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 09:55:31');
INSERT INTO `sys_oper_log`
VALUES (75, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LockSupport\",\"introduce\":\"尚硅谷LockSupport学习笔记\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\",\"sort\":0,\"content\":\"::: hljs-center\\n\\n# LockSupport\\n\\n\\n:::\\n## LockSupport是什么\\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\\n\\n\\n==下面这句话，后面详细说==\\n\\nLockSupport中的park()和unpark()的作用分别是阻塞线程和解除阻塞线程。\\n\\n## 线程等待唤醒机制\\n\\n### 3种让线程等待和唤醒的方法\\n1. 使用Object中的wait()方法让线程等待，使用Object中的notify()方法唤醒线程。\\n2. 使用JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程。\\n3. LockSupport类可以阻塞当前线程以及唤醒指定被阻塞的线程。\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png)\\n\\n### Object 类中的wait和notify方法实现线程等待和唤醒\\n\\n```java\\npublic static void main(String[] args) throws InterruptedException {\\n        Object objectLock = new Object();\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----come in\\\");\\n                try {\\n                    objectLock.wait();\\n                } catch (InterruptedException e) {\\n                    throw new RuntimeException(e);\\n                }\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----被唤醒\\\");\\n            }\\n        },\\\"t1\\\").start();\\n\\n        TimeUnit.SECONDS.sleep(1);\\n\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                    objectLock.notify();\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----发出通知\\\");\\n            }\\n        },\\\"t2\\\").start();\\n    }\\n```\\n==正常情况输出：==\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png)\\n\\n:::\\n==异常情况1:==\\n去掉synchronized后抛出\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png)\\n得出wait关键字必须在synchronized里使用。\\n\\n==异常情况2:==\\n先执行notify后执行wait会导致程序无法被唤醒。\\n\\n总结：wait和notify方法必须要在同步块或者方法里',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 10:01:13');
INSERT INTO `sys_oper_log`
VALUES (76, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/22d93f41bd1b4306a76ff6b2a6ed32ac.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 10:09:44');
INSERT INTO `sys_oper_log`
VALUES (77, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LockSupport\",\"introduce\":\"尚硅谷LockSupport学习笔记\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\",\"sort\":0,\"content\":\"::: hljs-center\\n\\n# LockSupport\\n\\n\\n:::\\n## LockSupport是什么\\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\\n\\n\\n==下面这句话，后面详细说==\\n\\nLockSupport中的park()和unpark()的作用分别是阻塞线程和解除阻塞线程。\\n\\n## 线程等待唤醒机制\\n\\n### 3种让线程等待和唤醒的方法\\n1. 使用Object中的wait()方法让线程等待，使用Object中的notify()方法唤醒线程。\\n2. 使用JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程。\\n3. LockSupport类可以阻塞当前线程以及唤醒指定被阻塞的线程。\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png)\\n\\n:::\\n\\n\\n### Object 类中的wait和notify方法实现线程等待和唤醒\\n\\n```java\\npublic static void main(String[] args) throws InterruptedException {\\n        Object objectLock = new Object();\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----come in\\\");\\n                try {\\n                    objectLock.wait();\\n                } catch (InterruptedException e) {\\n                    throw new RuntimeException(e);\\n                }\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----被唤醒\\\");\\n            }\\n        },\\\"t1\\\").start();\\n\\n        TimeUnit.SECONDS.sleep(1);\\n\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                    objectLock.notify();\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----发出通知\\\");\\n            }\\n        },\\\"t2\\\").start();\\n    }\\n```\\n==正常情况输出：==\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png)\\n\\n:::\\n\\n==异常情况1:==\\n去掉synchronized后抛出\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png)\\n\\n:::\\n\\n得出wait关键字必须在synchronized里使用。\\n\\n==异常情况2:==\\n先',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 10:10:41');
INSERT INTO `sys_oper_log`
VALUES (78, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/1ec256d2da4a4b6ba657ceb49c006d55.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 10:13:13');
INSERT INTO `sys_oper_log`
VALUES (79, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/dbfc16ffcea44e9ea5f7b90207e03686.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 10:20:55');
INSERT INTO `sys_oper_log`
VALUES (80, '文件管理', 1, 'com.jzj.vblog.web.controller.UploadController.uploadImg()', 'POST', 1, 'admin', NULL,
        '/api/upload/uploadImg', '127.0.0.1', '内网IP', 'article',
        '{\"code\":20000,\"data\":{\"url\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/6c87ccee606b4cf1b82f40b6a8c22bb1.png\"},\"msg\":\"操作成功\",\"success\":true}',
        0, NULL, '2022-08-29 10:36:39');
INSERT INTO `sys_oper_log`
VALUES (81, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LockSupport\",\"introduce\":\"尚硅谷LockSupport学习笔记\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\",\"sort\":0,\"content\":\"::: hljs-center\\n\\n# LockSupport\\n\\n\\n:::\\n## LockSupport是什么\\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\\n\\n\\n==下面这句话，后面详细说==\\n\\nLockSupport中的park()和unpark()的作用分别是阻塞线程和解除阻塞线程。\\n\\n## 线程等待唤醒机制\\n\\n### 3种让线程等待和唤醒的方法\\n1. 使用Object中的wait()方法让线程等待，使用Object中的notify()方法唤醒线程。\\n2. 使用JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程。\\n3. LockSupport类可以阻塞当前线程以及唤醒指定被阻塞的线程。\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png)\\n\\n:::\\n\\n\\n### Object 类中的wait和notify方法实现线程等待和唤醒\\n\\n```java\\npublic static void main(String[] args) throws InterruptedException {\\n        Object objectLock = new Object();\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----come in\\\");\\n                try {\\n                    objectLock.wait();\\n                } catch (InterruptedException e) {\\n                    throw new RuntimeException(e);\\n                }\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----被唤醒\\\");\\n            }\\n        },\\\"t1\\\").start();\\n\\n        TimeUnit.SECONDS.sleep(1);\\n\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                    objectLock.notify();\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----发出通知\\\");\\n            }\\n        },\\\"t2\\\").start();\\n    }\\n```\\n==正常情况输出：==\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png)\\n\\n:::\\n\\n==异常情况1:==\\n去掉synchronized后抛出\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png)\\n\\n:::\\n\\n得出wait关键字必须在synchronized里使用。\\n\\n==异常情况2:==\\n先',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 10:41:39');
INSERT INTO `sys_oper_log`
VALUES (82, '文章管理', 2, 'com.jzj.vblog.web.controller.admin.ArticleInformController.updateById()', 'PUT', 1, 'admin',
        NULL, '/article/inform/updateById', '127.0.0.1', '内网IP',
        '{\"articleTitle\":\"LockSupport\",\"introduce\":\"尚硅谷LockSupport学习笔记\",\"logImg\":\"https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/articleLog/2022/08/29/e3a851ed32004624bd0665c95e1284f0.jpg\",\"sort\":0,\"content\":\"::: hljs-center\\n\\n# LockSupport\\n\\n\\n:::\\n## LockSupport是什么\\nLockSupport是用来创建锁和其他同步类的基本线程阻塞原语。\\n\\n\\n==下面这句话，后面详细说==\\n\\nLockSupport中的park()和unpark()的作用分别是阻塞线程和解除阻塞线程。\\n\\n## 线程等待唤醒机制\\n\\n### 3种让线程等待和唤醒的方法\\n1. 使用Object中的wait()方法让线程等待，使用Object中的notify()方法唤醒线程。\\n2. 使用JUC包中Condition的await()方法让线程等待,使用signal()方法唤醒线程。\\n3. LockSupport类可以阻塞当前线程以及唤醒指定被阻塞的线程。\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/0a9a576ad2d44171bd8e742286f1f309.png)\\n\\n:::\\n\\n\\n### Object 类中的wait和notify方法实现线程等待和唤醒\\n\\n```java\\npublic static void main(String[] args) throws InterruptedException {\\n        Object objectLock = new Object();\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----come in\\\");\\n                try {\\n                    objectLock.wait();\\n                } catch (InterruptedException e) {\\n                    throw new RuntimeException(e);\\n                }\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----被唤醒\\\");\\n            }\\n        },\\\"t1\\\").start();\\n\\n        TimeUnit.SECONDS.sleep(1);\\n\\n        new Thread(()->{\\n            synchronized(objectLock){\\n                    objectLock.notify();\\n                System.out.println(Thread.currentThread().getName()+\\\"\\\\t----发出通知\\\");\\n            }\\n        },\\\"t2\\\").start();\\n    }\\n```\\n==正常情况输出：==\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/fd75e36d90254b8bb8147eb4f88dea1a.png)\\n\\n:::\\n\\n==异常情况1:==\\n去掉synchronized后抛出\\n::: hljs-center\\n\\n![image.png](https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/article/2022/08/29/4500b84b49a0400caf5c6330ae55f9d0.png)\\n\\n:::\\n\\n得出wait关键字必须在synchronized里使用。\\n\\n==异常情况2:==\\n先',
        '{\"code\":20000,\"msg\":\"操作成功\",\"success\":true}', 0, NULL, '2022-08-29 11:00:56');

-- ----------------------------
-- Table structure for sys_todo
-- ----------------------------
DROP TABLE IF EXISTS `sys_todo`;
CREATE TABLE `sys_todo`
(
    `id`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
    `create_time` datetime(0)                                                  DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                  DEFAULT NULL COMMENT '修改时间',
    `done`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '状态',
    `text`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '备忘录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_todo
-- ----------------------------
INSERT INTO `sys_todo`
VALUES ('36b25f306cd7ce2bd1f69e5a813d494b', '2022-08-14 17:46:40', '2022-08-23 20:14:21', '0', '明天去上学');
INSERT INTO `sys_todo`
VALUES ('51f1a28c08365c0112c07addfcd5114e', '2022-08-14 17:46:18', '2022-08-23 20:13:19', '0', '等下吃饭');
INSERT INTO `sys_todo`
VALUES ('5968d94f9d2d78f383c9cb8ee0595756', '2022-08-14 17:47:03', '2022-08-26 19:33:00', '0', '好好好学习天天向上');

-- ----------------------------
-- Table structure for sys_web_information
-- ----------------------------
DROP TABLE IF EXISTS `sys_web_information`;
CREATE TABLE `sys_web_information`
(
    `id`             int(11) NOT NULL COMMENT 'id',
    `web_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网站名称',
    `web_details`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网站详情',
    `web_avatar`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
    `qq`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'qq',
    `wechat`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信',
    `github`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'github',
    `gitee`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'gitee',
    `create_time`    datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime(0)                                                   DEFAULT NULL COMMENT '修改时间',
    `home_banner`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首页背景图',
    `article_banner` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章背景图',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '网站基本信息'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_web_information
-- ----------------------------
INSERT INTO `sys_web_information`
VALUES (1, '漫漫长路', '<p>长路漫漫，吾将上下而求索。</p>',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/webLogo/2022/08/11/894545a484d24866bcf4f928914dda89.jpg',
        '946232976', 'fr946232976', 'https://github.com/Jzjzzzz', 'https://gitee.com/jzjzz', '2022-07-28 20:16:13',
        '2022-08-19 19:07:46',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/webLogo/2022/08/09/a108c42fa21a43a4940c3e08cfd33c4f.jpg',
        'https://vue-vblog.oss-cn-shenzhen.aliyuncs.com/webLogo/2022/08/10/9d26abe18ec84eadbaa8b9f180fefee6.jpg');

-- ----------------------------
-- Table structure for website_resource
-- ----------------------------
DROP TABLE IF EXISTS `website_resource`;
CREATE TABLE `website_resource`
(
    `id`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源站点表id',
    `create_time`      datetime(0)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime(0)                                                   DEFAULT NULL COMMENT '修改时间',
    `status`           char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '状态',
    `resource_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源名称',
    `resource_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源地址',
    `resource_img`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源图片',
    `resource_type`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源分类',
    `click_rate`       bigint(20)                                                   NOT NULL COMMENT '点击量',
    `resource_detail`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '资源站点'
  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
