


# Count all the tracks on each album by a given artist


# app/models/track.rb
class Track
   belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/album.rb
class Album
  has_many(
  :tracks,
  class_name: "Track",
  foreign_key: :album_id,
  primary_key: :id
  )


  belongs_to(
    :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id
  )

end


# app/models/artist.rb
class Artist
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    tracks_count = self
      .albums
      .select("albums.*, COUNT(*) AS tracks_count")   # now we have access to the tracks_count!
      .join(:tracks)                                  # and can use this later in the method
      .group("tracks.id")

      albums_count = {}
      tracks_count.each do |album|
        albums_count[album.name] = album.tracks_count

        
    tracks_count.map |album|          # this will return each album's name, and it's tack count for said album
      [album.name, album.tracks_count]
    end
  end
end
