require 'pry'

# def crack
#   *, second_to_last, last = chunk(encrypted)
#   encrypted_chunk, known_chunk
#
#   case message.length % 4
#   when 0 then [last,          [["n", "d", ".", "."]]
#   when 1 then [second_to_last, [["e", "n", "d", "."]]
#   when 2 then [second_to_last, [[".", "e", "n", "d"]]
#   when 3 then [second_to_last, [[".", ".", "e", "n"]]
#   end
#
#   offsets = known_chunk.zip(encryted_chunk).map do |char|
#     find_offset known_val, encypted_value
# end
#
# def find_offset(map, first, second)
#   map.index(second) = map.index(first)
# end
#
#
# ['a', 'b', 'c', 'd']
#
# ..end..
#
#
#   def assert_can_crack(message)
#     map = Encryption.char_map #take message
#     encrypted = Encryption.encrypt(message, key_generator, map) #encrypt it
#     cracked = Cracker.new(encrypted, map) #crack it
#     assert_equal message, cracked #get message back again
#   end
#
#   def test_it_cracks_a_message_of_1_mod_4
#
#     assert_can_crack "abcde..end.."
#   end
#
#   def test_it_cracks_a_message_of_1_mod_4
#     skip
#     assert_can_crack "abcdef..end.."
#   end
#
#   def test_it_cracks_a_message_of_2_mod_4
#     skip
#     assert_can_crack "abcdefg..end.."
#
#   end
#
#   def test_it_cracks_a_message_of_3_mod_4
#     skip
#     assert_can_crack "abcdefgh..end.."
#
#   end
#
