package light.mvc.service.task.impl;

import light.mvc.service.task.TaskDemoServiceI;

import org.springframework.stereotype.Service;

/**  
 * @ClassName:  
 * @Description: TODO(这里用一句话描述这个类的作用)  
 * @author 宫传华 
 * @date 2015年9月9日 上午9:10:48  
 *    
 */
@Service
public class TaskDemoServiceImpl implements TaskDemoServiceI {

	@Override
	public void test() {
		System.out.println("备用，定时任务执行...");
	}

}
