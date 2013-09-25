package cn.com.kxcomm.common;

import java.util.Timer;
import java.util.TimerTask;
import com.jcraft.jsch.SftpProgressMonitor;


public class FileProgressMonitor extends TimerTask implements SftpProgressMonitor {
    
    private long progressInterval = 5 * 1000; // 默认间隔时候为5秒
    
    private boolean isEnd = false; // 记录传输是否停止
    
    private long transfered; // 记录已传输的数据总大小
    
    private long fileSize; // 记录文件总大小
    
    private Timer timer; // 按时器对象
    
    private boolean isScheduled = false; // 记录是否已启动timer记时器
    
    public FileProgressMonitor(long fileSize) {
        this.fileSize = fileSize;
    }
    
    @Override
    public void run() {
        if (!isEnd()) { // 断定传输是否已停止
            System.out.println("Transfering is in progress.");
            long transfered = getTransfered();
            if (transfered != fileSize) { // 断定当前已传输数据大小是否便是文件总大小
                System.out.println("Current transfered: " + transfered + " bytes");
                sendProgressMessage(transfered);
            } else {
                System.out.println("File transfering is done.");
                setEnd(true); // 若是当前已传输数据大小便是文件总大小,申明已完成,设置end
            }
        } else {
            System.out.println("Transfering done. Cancel timer.");
            stop(); // 若是传输停止,停止timer记时器
            return;
        }
    }
    
    public void stop() {
        System.out.println("Try to stop progress monitor.");
        if (timer != null) {
            timer.cancel();
            timer.purge();
            timer = null;
            isScheduled = false;
        }
        System.out.println("Progress monitor stoped.");
    }
    
    public void start() {
        System.out.println("Try to start progress monitor.");
        if (timer == null) {
            timer = new Timer();
        }
        timer.schedule(this, 1000, progressInterval);
        isScheduled = true;
        System.out.println("Progress monitor started.");
    }
    
    /**
     * 打印progress信息
     * @param transfered
     */
    private void sendProgressMessage(long transfered) {
        if (fileSize != 0) {
            int d = ((int)transfered * 100)/(int)fileSize;	
//            DecimalFormat df = new DecimalFormat( "＃.＃＃"); 
            System.out.println("Sending progress message: " + d + "％");
        } else {
            System.out.println("Sending progress message: " + transfered);
        }
    }

    /**
     * 实现了SftpProgressMonitor接口的count办法
     */
    public boolean count(long count) {
        if (isEnd()) return false;
        if (!isScheduled) {
            start();
        }
        add(count);
        return true;
    }

    /**
     * 实现了SftpProgressMonitor接口的end办法
     */
    public void end() {
        setEnd(true);
        System.out.println("transfering end.");
    }
    
    private synchronized void add(long count) {
        transfered = transfered + count;
    }
    
    private synchronized long getTransfered() {
        return transfered;
    }
    
    public synchronized void setTransfered(long transfered) {
        this.transfered = transfered;
    }
    
    private synchronized void setEnd(boolean isEnd) {
        this.isEnd = isEnd;
    }
    
    private synchronized boolean isEnd() {
        return isEnd;
    }

    public void init(int op, String src, String dest, long max) {
        // Not used for putting InputStream
    }
}