package FourAdapter;

class VLCPlayer implements AdvancedMediaPlayer {
	@Override
	public void playFile(String filename) {
		System.out.println("Playing VLC file " + filename);		
	}
}
