package concur;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-23 20:31
 */
public class UseThreadPoolExecutor2  implements Runnable{
    private static AtomicInteger count = new AtomicInteger(0);

    @Override
    public void run() {
        try {
            int temp = count.incrementAndGet();
            System.out.println("任务" + temp);
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception{
        //System.out.println(Runtime.getRuntime().availableProcessors());
        BlockingQueue<Runnable> queue =
                new LinkedBlockingQueue<Runnable>();//5 5 一组
                //new ArrayBlockingQueue<Runnable>(10);  //10一组 改成有界队列
        ExecutorService executor  = new ThreadPoolExecutor(
                5, 		//core
                10, 	//max  没有作用 根据capacity定的
                120L, 	//2fenzhong
                TimeUnit.SECONDS,
                queue);   //指定一种队列 queue（无界队列）

        for(int i = 0 ; i < 20; i++){
            executor.execute(new UseThreadPoolExecutor2());
        }
        Thread.sleep(1000);
        System.out.println("queue size:" + queue.size());		//10
        Thread.sleep(2000);
    }
}
