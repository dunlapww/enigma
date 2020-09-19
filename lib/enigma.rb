class Enigma
  attr_reader :message, :key, :date

  def initialize(details)
    @message = details[:message]
    @key = details[:key]
    @date = details[:date]
  end

end
