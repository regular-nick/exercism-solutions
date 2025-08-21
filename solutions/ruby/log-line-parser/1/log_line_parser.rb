class LogLineParser
  def initialize(line)
    @line = line
  end

  def split_log
    @line.split(": ")
  end

  def message
    split_log[1].strip
  end

  def log_level
    split_log[0].gsub(/[\[\]]/, "").downcase # look up method for lowercase conversion
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
