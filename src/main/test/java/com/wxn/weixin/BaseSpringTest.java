package com.wxn.weixin;

import lombok.extern.slf4j.Slf4j;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 标题<br>
 * User: Jwxa<br>
 * Date: 2016/10/17.
 */
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
//@Transactional(transactionManager = "transactionManager")
public class BaseSpringTest {

}
