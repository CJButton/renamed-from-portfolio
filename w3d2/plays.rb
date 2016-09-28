require 'sqlite3'
require 'singleton'
#
class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    # notice that here, we one lined the query
    # but we could also have done it on several lines if we wished
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_playwright(name)
    # what is this line doing here?
    playwright = Playwright.find_by_name(name)
    p playwright
    raise "#{self} is not in the database" unless playwright

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
    SELECT
      *
    FROM
      plays
    WHERE
      playwright_id = ?

  SQL
  plays.map {|play| Play.new(play)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
    @name = options['name']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @name)
      INSERT INTO
        plays (title, year, playwright_id, name)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id, @name)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?, name = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year
  attr_reader :id

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      playwrights
    WHERE
      name = ?
    SQL
    return nil unless data.length > 0
    Playwright.new(data.first)
  end

  def get_plays
    # raise an error if he id isn't actually in the database
    raise "#{self} not in database" unless @id
    # the 'plays' variable will store the data we find in the query below
    plays = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    p plays
    puts
    plays.map {|play| Play.new(play)}
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| Playwright.new(datum) }
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

end
