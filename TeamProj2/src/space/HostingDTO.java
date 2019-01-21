package space;

public class HostingDTO {
	int host_no;	//호스트 번호
	int room_no;	//룸자동생성번호
	String subject;	//제목
	String room;	//공간타입
	int people;		//수용인원수
	int drink;		//기본음료제공
	int elevator;	//엘리베이터
	int toilet;		//화장실
	int airconditioner;//에어컨
	int heating;	//난방
	int socket;		//콘센트
	
	
	
	public int getHost_no() {
		return host_no;
	}
	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getDrink() {
		return drink;
	}
	public void setDrink(int drink) {
		this.drink = drink;
	}
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public int getAirconditioner() {
		return airconditioner;
	}
	public void setAirconditioner(int airconditioner) {
		this.airconditioner = airconditioner;
	}
	public int getHeating() {
		return heating;
	}
	public void setHeating(int heating) {
		this.heating = heating;
	}
	public int getSocket() {
		return socket;
	}
	public void setSocket(int socket) {
		this.socket = socket;
	}
}
