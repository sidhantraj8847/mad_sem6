// Abstract class representing various media items
abstract class MediaItem {
  String title;
  String? artist;

  MediaItem(this.title, this.artist);

  void displayInfo();
}

// Concrete class representing a song
class Song extends MediaItem with Logger implements Playable {
  String duration;

  Song(String title, String artist, this.duration) : super(title, artist);

  @override
  void displayInfo() {
    print('Song: $title - $artist, Duration: $duration');
  }

  @override
  void play() {
    logInfo('Playing $title by $artist');
  }
}

// Concrete class representing an album
class Album extends MediaItem with Logger {
  List<String> tracks;

  Album(String title, String artist, this.tracks) : super(title, artist);

  @override
  void displayInfo() {
    print('Album: $title - $artist, Tracks: ${tracks.join(', ')}');
  }
}

// Concrete class representing a playlist
class Playlist extends MediaItem with Logger {
  List<MediaItem> items;

  Playlist(String title, this.items) : super(title, null);

  @override
  void displayInfo() {
    print(
        'Playlist: $title, Items: ${items.map((item) => item.title).join(', ')}');
  }
}

// Interface defining a method to play media items
abstract class Playable {
  void play();
}

// Logger mixin providing logging functionality
mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

void main() {
  var song1 = Song('Song 1', 'Artist 1', '3:45');
  var album1 = Album('Album 1', 'Artist 1', ['Track 1', 'Track 2', 'Track 3']);
  var Pl = Playlist('Playlist 1', [song1, album1]);

  song1.play();
}
