package FourAdapter;

public class Main {
	public static void main(String args[]){
	    MediaPlayer player = new MP3Player();
	    player.play("sample.mp3");
	    player = new MediaPlayerAdapter(new MP4Player());
	    player.play("sample.mp4");
	    player = new MediaPlayerAdapter(new VLCPlayer());
	    player.play("sample.avi");
	}
}
