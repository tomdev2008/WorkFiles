package cn.com.kxcomm.common;

public class Result {
	public Result(){
		
	}
    private boolean success;
    private long totalCount;
    private int flag;
    private String msg;
    static final public int FLAG_SUCCESS = 1;
    static final public int FLAG_ERROE = 2;
    static final public int FLAG_FAILURE = 3;
    
    public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public boolean getSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object data;

    public Result(Object data) {
        this.success = true;
        this.data = data;
    }

    public  Result(boolean success, Object data,long totalCount) {
        this.success = success;
        this.data = data;
        this.totalCount = totalCount;
    }
}
