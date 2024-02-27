package jdbc;
// VO(value object) 데이터를 객체 혀앹로 표헌하는 자바 클래스
// VO or DTO(data transfer dbject)라고함
public class UserVO {
	private String userId; // carmel 표기법 _< 부분을 대문자로(낙타표기법)
	private String userPw;
	private String userNm;
	private String useYn;
	//setter getter, toString
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", uerPw=" + userPw + ", userNm=" + userNm + ", useYn=" + useYn + "]";
	}

}
