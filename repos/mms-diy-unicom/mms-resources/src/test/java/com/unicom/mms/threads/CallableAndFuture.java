package com.unicom.mms.threads;

import java.util.concurrent.Callable;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CallableAndFuture {  
    public static void main(String[] args) {  
        ExecutorService threadPool = Executors.newCachedThreadPool();  
        CompletionService<String> cs = new ExecutorCompletionService<String>(threadPool);  
        for(int i = 1; i < 15; i++) {  
            final String taskID = i+"_"+System.currentTimeMillis();  
            cs.submit(new Callable<String>() {  
                public String call() throws Exception {  
                    return taskID;  
                }  
            });  
        }  
        // 可能做一些事情  
        for(int i = 1; i < 5; i++) {  
            try {  
                System.out.println(cs.take().get());  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            } catch (ExecutionException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}        