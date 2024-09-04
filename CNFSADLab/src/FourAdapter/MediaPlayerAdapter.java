package FourAdapter;

class MediaPlayerAdapter implements MediaPlayer {
	 private AdvancedMediaPlayer advancedMediaPlayer;
	 public MediaPlayerAdapter(AdvancedMediaPlayer advancedMediaPlayer) {
	    this.advancedMediaPlayer = advancedMediaPlayer;
	 }
	 @Override
	 public void play(String filename) {
	   System.out.print("Using MediaPlayerAdapter - ");
	   advancedMediaPlayer.playFile(filename);
	 }
}