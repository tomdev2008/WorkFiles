import com.unicom.mms.sgip.SgipMT;


public class TestSGIP {

	public static  void main(String[] ss) {
		try{
			String[] UserNumber = new String[1];
			UserNumber[0] = "15580898198";
			String ServiceType="3174201001";
			int Priority = 9;
			String MessageContent="hello world";
			SgipMT mt = new SgipMT();
			for(int i=0;i<10;i++){
				boolean su = mt.send(UserNumber, ServiceType, Priority, MessageContent);
				if(!su){
					System.out.println("发送失败");
				}				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
