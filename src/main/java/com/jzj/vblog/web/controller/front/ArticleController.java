package com.jzj.vblog.web.controller.front;

import com.jzj.vblog.utils.result.R;
import com.jzj.vblog.web.controller.BaseController;
import com.jzj.vblog.web.pojo.vo.ArticleAddVo;
import com.jzj.vblog.web.service.ArticleInformService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author Jzj
 * @Date 2022/7/29 17:17
 * @Version 1.0
 * @Message: 前台文章控制器
 */
@RestController
@RequestMapping("/front/article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleInformService articleInformService;

    @ApiOperation("获取文章列表")
    @PostMapping("/listPage")
    public R listPage(@RequestBody Map<String,Object> queryMap){
        HashMap<String, Object> map = articleInformService.listPage(queryMap);
        return R.ok("map",map);
    }

    @ApiOperation("根据Id获取文章")
    @GetMapping("/getById/{id}")
    public R getById(@PathVariable String id){
        ArticleAddVo articleAddVo = articleInformService.getFrontArticleById(id);
        return R.ok(articleAddVo);
    }
}
