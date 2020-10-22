package concur;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-23 20:25
 */
public class MyRejected implements RejectedExecutionHandler {

    public MyRejected(){
    }

    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
        System.out.println("自定义处理..");
        System.out.println("当前被拒绝任务为：" + r.toString());
        System.out.println(executor.getMaximumPoolSize());
        System.out.println(executor.getCompletedTaskCount()+"");
        System.out.println(executor.getKeepAliveTime(TimeUnit.SECONDS));
    }
}
