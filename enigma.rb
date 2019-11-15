class Enigma
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  # 初期エニグマに倣い、三つのボードを準備
  @@board1 = [*"A".."Z"," ", *"a".."z"].reverse
  @@board2 = [*"A".."Z", " ", *"a".."x"].reverse.append(["z","y"]).flatten
  @@board3 = [*"A".."Z", " ", *"a".."v"].reverse.append(["z","y","x","w"]).flatten
  
  def get_board(count)
    if count == 0
      @@board1
    elsif count == 1
      @@board2
    else
      @@board3
    end
  end

  def encode
    words_list = self.text.split("")
    encoded_word = []
    words_list.count.times do |i|
      board = self.get_board(i % 3)
      index_of_words_list = [*"A".."Z", " ", *"a".."z"].index(words_list[i])
      encoded_word << board[index_of_words_list]
    end
    encoded_word.join
  end

  def decode
    encrypted_words_list = self.text.split("")
    decoded_word = []
    encrypted_words_list.count.times do |i|
      board = self.get_board(i % 3)
      index_of_words_list = board.index(encrypted_words_list[i])
      decoded_word << [*"A".."Z", " ", *"a".."z"][index_of_words_list]
    end
    decoded_word.join
  end
end

puts "1: encode, 2: decode"
input = gets.chomp.to_i
if input == 1
  puts "暗号化する文字列を入力"
  input = gets.chomp
  puts "暗号化中"
  text = Enigma.new(input).encode
  sleep(1)
  puts text
elsif input == 2
  puts "デコードする文字列を入力"
  input = gets.chomp
  puts "デコード中"
  text = Enigma.new(input).decode
  sleep(1)
  puts text
else
  puts "入力値が間違っています"
end
