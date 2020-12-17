require 'pg'

class DatabaseConnection

    def self.setup(db_name)
        @connection = PG.connect :dbname => "#{db_name}"
    end

    def self.query(query_string)
        result = @connection.exec("#{query_string}")
    end

end