package com.jzj.vblog.job;

import cn.hutool.core.date.DateUtil;
import com.jzj.vblog.job.base.BaseJob;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;

/**
 * <p>
 * Hello Job
 * </p>
 *
 * @author Jzj
 * @date Created in 2022-08-22
 */
@Slf4j
public class HelloJob implements BaseJob {

    @Override
    public void execute(JobExecutionContext context) {
        log.error("Hello Job 执行时间: {}", DateUtil.now());
    }
}
