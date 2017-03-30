module FileIOModule

  def open_file
    file = File.open(ARGV[0], "r")
  end

  def read_file
    message = open_file.readlines
    message.join("").chomp
  end

  def write_to_new_file
    cryptonic_file = File.open(ARGV[1], "w+")
    cryptonic_file.write(crypted_file)
  end

end
