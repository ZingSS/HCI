package nju.edu.homework.test;
/**
 * 
 */

/**
 *
 * @author 霄汉
 * @since 2016年3月10日 下午8:15:21
 * @version 1.0
 */
public class JWStub {
	
	private static final String [] FAMILY_NAMES = {"赵","钱","马","文","周","王","郑","胡","温",
			"牛","杨","金"};
	
	private static final String [] LAST_NAMES = {"爽","富贵","建国","洪波","煊义","志军","云","彦宏",
			"婧","思思","心蓓","波","云迪","梦雨","潇涵","薇薇","淑怡","方平","馨予"};
	
	public static String lookupUser(String uid) {
			if (uid.length() < 8) return null;
			int hash = Math.abs(uid.hashCode());
			String name = FAMILY_NAMES[hash % 12] + LAST_NAMES[hash % 19];
			return name;
	}
	
}
