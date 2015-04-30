require "postgre_mass_loader/version"

module PostgreMassLoader
  # Your code goes here...

  class Loader
    attr_reader :connection, :table_name, :column_names

    # @param connection
    # @param table_name
    # @param [Array] column_names
    def initialize(connection, table_name, column_names)
      @connection = connection
      @table_name = table_name
      @column_names = column_names
      @sql = "COPY #{@table_name} (#{@column_names.join(',')}) FROM STDIN WITH CSV"
    end

    # @param [Array<Array>] rows  Array of rows, each row is array of values
    def import_rows(rows)
      if rows.present?
        # benchmark "UPLOAD CSV (rows: #{rows.count})" do
        data = create_csv(rows)
        #puts sql
        @connection.execute @sql
        @connection.raw_connection.put_copy_data data
        @connection.raw_connection.put_copy_end
        while res = @connection.raw_connection.get_result
          raise res.error_message if res.error_message.present?
        end
        # end
      end
    end


    private

    def row_to_csv(values)
      values.map do |value|
        if value.is_a?(String)
          "\"#{value.gsub('"', '""')}\"" # делаем 2 кавычки
        else
          value.to_s
        end
      end.join(',') # Разделитель колонок
    end

    def create_csv(rows_array)
      rows_array.map{|row| row_to_csv(row) }.join("\n")  # Разделитель строк
    end

  end
end
