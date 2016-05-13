package com.myClass.Common;

public class MyclassCommon {
	public static String appName = "우리반";
	public static String enAppName = "myClass";
	
	public static int adminType = 0;
	public static int teacherType = 1;
	public static int parentType = 2;
	public static int studentType = 3;
	
	public static String[] memberType = {
		"관리자", //0
		"선생님", //1
		"부모님", //2
		"학생"   //3
	};
	
	public static String[] mainColor = {
		"#e66659", //red
		"#e6bd59", //green
		"#452da5", //navy
		"#FFA500", //orange
		"#90d0f4", //sky
		"#cbe205" //yellow
	};
	public static String[] mainColorClass = {
			"red", //red
			"green", //green
			"navy", //navy
			"orange", //orange
			"sky", //sky
			"yellow" //yellow
	};
	public static String[] classColor = {
			"#e66659", //red
			"#e81d62", //pink
			"#9b26af", //pubple
			"#3e50b4", //indigo
			"#6639b6", //deep purple
			"#2095f2", //blue
			"#02a8f3", //light blue
			"#00bbd3", //cyan
			"#009587", //teal
			"#4bae4f", //green
			"#8ac249", //light green
			"#ccdb38", //lime
			"#feea3a", //yellow
			"#fec006", //amber
			"#fe9700", //orange
			"#fe5621", //deep orange
			"#785447", //brown
			"#9d9d9d", //gray
			"#5f7c8a", //blue gray
			"#333333" //black
	};
	public static String[] schoolGubun = {
			"elem_list", //초등학교
			"midd_list", //중학교
			"high_list" //고등학교
	};
	
	public static String [][] schoolRegion = {
            {"100260", "서울특별시"},
            {"100267", "부산광역시"},
            {"100269", "인천광역시"},
            {"100271", "대전광역시"},
            {"100272", "대구광역시"},
            {"100273", "울산광역시"},
            {"100275", "광주광역시"},
            {"100276", "경기도"},
            {"100278", "강원도"},
            {"100280", "충청북도"},
            {"100281", "충청남도"},
            {"100282", "전라북도"},
            {"100283", "전라남도"},
            {"100285", "경상북도"},
            {"100291", "경상남도"},
            {"100292", "제주도"}
	};
	
	public static String[] subject = {
			"수학",
			"국어"
	};
	
	public static String[] schoolLevel = {
			"초등학교",
			"중학교",
			"고등학교"
	};
	public static String[][] schoolYear = {
			{"4학년", "5학년", "6학년"},
			{"1학년", "2학년", "3학년"},
			{"1학년", "2학년", "3학년"}
	};
	
	public static int early = 0;
	public static int invite = 1;
	public static int complete = 2;
	public static int withdrawal = 3;
	
	public static String jusoApiKey = "0ca91af6a632400daf52611c45f2cda6";

}
