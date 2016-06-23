package nju.edu.homework.test;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

/**  
 * 创建时间：2015年3月10日 下午1:41:09  
 * 项目名称：DBTest  
 * @author Xiaohan Ding
 * @version 1.0   
 * @since JDK 1.7 
 * 文件名称：DBTest.java  
 * 类说明：  
 */
public class DBTest {
	// 驱动程序名
    static String driver = "com.mysql.jdbc.Driver";
    // URL指向要访问的数据库名scutcs
    static String url = "jdbc:mysql://127.0.0.1:3306/homeworksystem?useUnicode=true&characterEncoding=UTF-8&characterSetResults=utf8";
    // MySQL配置时的用户名
    static String user = "root"; 
    // MySQL配置时的密码
    static String password = "123456";
    static Connection conn;
    
    static{
    	try { 
            // 加载驱动程序
            Class.forName(driver);
            // 连续数据库
            conn = DriverManager.getConnection(url, user, password);
            if(!conn.isClosed()) 
             System.out.println("Sucsceeded connecting to the Database!");
    	} catch(ClassNotFoundException e) {
            System.out.println("Sorry,can`t find the Driver!"); 
            e.printStackTrace();
           } catch(SQLException e) {
            e.printStackTrace();
           } catch(Exception e) {
            e.printStackTrace();
           } 
    }
    
    public static void main(String[]args){
    	try {
    		// 生成学生
//    	for (int i=141250001;i<=141250120;i++) {
//    		String name = JWStub.lookupUser(i + "");
//    		PreparedStatement ps = conn.prepareStatement("insert into user(userId,password,name,role,createdTime) values(?,?,?,?,?)");
//    		ps.setString(1, i + "");
//    		ps.setString(2, "123");
//    		ps.setString(3, name);
//    		ps.setString(4, "student");
//    		ps.setDate(5, new Date(new java.util.Date().getTime()));
//    		ps.executeUpdate();
//    	}
    		
    		
//    	for (int i=28;i<=142;i++) {
//    		PreparedStatement ps = conn.prepareStatement("insert into course_user values('20', ?)");
//    		ps.setInt(1, i);
//    		ps.executeUpdate();
//    	}
    	
//    	for (int i=28;i<=142;i++) {
//    		PreparedStatement ps = conn.prepareStatement("insert into user_course values(?, '20')");
//    		ps.setInt(1, i);
//    		ps.executeUpdate();
//    	}
//    		
    	
//    	
    	
    		int homeworkId = 61;
    		int beginGrade = 152;
    		
//    		强行模拟正太分布的成绩
//    	Random r = new Random();
//    	int[] grades = new int[120];
//    	
//    	for (int i=0;i<120;i++) {
//    		double d = 6;
//    		while (d > 2 || d < -4) {
//    			d = r.nextGaussian();
//    		}
//    		
//    		grades[i] = (int)(d * 12.5 + 75);
//    	}
//    	
//    	for (int i=0;i<120;i++) {
//    		System.out.println(i);
//    		PreparedStatement ps = conn.prepareStatement("insert into grade(grade, homework_id, user_id) values(?,?,?)");
//    		ps.setString(1, grades[i]+"");
//    		ps.setInt(2, homeworkId);
//    		ps.setInt(3, i + 23);
//    		ps.executeUpdate();
//    	}
//    	
    	for (int i=0;i<120;i++) {
    		PreparedStatement ps = conn.prepareStatement("insert into user_grade values(?,?)");
    		ps.setInt(1, i + 23);
    		ps.setInt(2, i + beginGrade);
    		ps.executeUpdate();
    	}
   	
    	for (int i=0;i<120;i++) {
    		PreparedStatement ps = conn.prepareStatement("insert into homework_grade values(?,?)");
    		ps.setInt(1, homeworkId);
    		ps.setInt(2, i + beginGrade);
    		ps.executeUpdate();
    	}
//    	
    		
    	
    	}catch (Exception e) {
			e.printStackTrace();
		}
    }

}
