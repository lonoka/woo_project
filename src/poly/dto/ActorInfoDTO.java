package poly.dto;

public class ActorInfoDTO {
	
	private String link;
	private String actor_name;
	private String actor_birth;
	private String actor_job;
	private String naver_url;
	private String actor_img;
	public String getActor_img() {
		return actor_img;
	}
	public void setActor_img(String actor_img) {
		this.actor_img = actor_img;
	}
	public String getNaver_url() {
		return naver_url;
	}
	public void setNaver_url(String naver_url) {
		this.naver_url = naver_url;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getActor_name() {
		return actor_name;
	}
	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}
	public String getActor_birth() {
		return actor_birth;
	}
	public void setActor_birth(String actor_birth) {
		this.actor_birth = actor_birth;
	}
	public String getActor_job() {
		return actor_job;
	}
	public void setActor_job(String actor_job) {
		this.actor_job = actor_job;
	}

}
