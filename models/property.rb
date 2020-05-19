require('pg')

class Property

    attr_reader :id
    attr_accessor :address, :value, :number_of_bedrooms, :buy_let_status

  def initialize(options)
    @id = options['id'] if options['id']
    @address = options['address']
    @value = options['value']
    @number_of_bedrooms = options['number_of_bedrooms']
    @buy_let_status = options['buy_let_status']

  end

  def save()
# create db connection
  db = PG.connect({dbname: 'property_listing', host: 'localhost'})
# writing sql
  sql = "INSERT INTO property_listing
          (address,value, number_of_bedrooms, buy_let_status)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"
  values = [@address, @value, @number_of_bedrooms, @buy_let_status]
#  execute the sql command
  db.prepare("save", sql)
  db.exec_prepared("save", values)

  pg_result = db.exec_prepared("save", values)
  @id = pg_result[0]["id"].to_i
# close the connection
  db.close()
  end

  def update()
    db = PG.connect({dbname: 'property_listing', host: 'localhost'})
    sql = "UPDATE property_listing
      SET (address, value, number_of_bedrooms, buy_let_status) = ($1, $2, $3, $4)
      WHERE id = $5"
      values = [@address, @value, @number_of_bedrooms, @buy_let_status, @id]

    db.prepare("update", sql)
    db.exec_prepared("update", values)

    db.close()
  end

  def delete()
# connect to db
    db = PG.connect({dbname: 'property_listing', host:'localhost'})
#  write the SQL statement
    sql = "DELETE FROM property_listing WHERE buy_let_status = 'buy'"
    values = [@address, @value, @number_of_bedrooms, @buy_let_status, @id]

# prepare the database
  db.prepare("delete",sql)
  db.exec_prepared("delete", values)

#  close the db connection
  db.close()
  end

  def find()
  # connect to the db
    db = PG.connect({dbname: 'property_listing', host: 'localhost'})

  # write the SQL statement
    sql = "SELECT FROM property_listing WHERE id = $1"
    values = [@id]
  # execute
    db.prepare("Find", sql)
    db.exec_prepared("Find", values)

  # close connection to db
    db.close()

  end

end
