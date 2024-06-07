class String
    def is_upper?
        if ('A'..'Z').include? self
            self == self.upcase
        end
    end

    def is_lower?
        if ('a'..'z').include? self
            self == self.downcase
        end
    end
end

def caesar_cipher(string, number_of_positions = 0)
    characters = string.split('')

    alphabet = ('a'..'z').to_a

    cipher = []

    characters.each do |character|
        if character == ' '
            cipher.push(character)
        elsif character.is_lower?
            if alphabet.include? character
                cipher.push(alphabet[(alphabet.find_index(character) + number_of_positions) % 26])
            end
        elsif character.is_upper?
            if alphabet.include? character.downcase
                cipher.push(alphabet[(alphabet.find_index(character.downcase) + number_of_positions) % 26].upcase)
            end
        else
            cipher.push(character)
        end
    end
    
    cipher = cipher.join
end

puts caesar_cipher('What a string!', 5)         # Expected: 'Bmfy f xywnsl!'
puts caesar_cipher('abc', 1)                    # Expected: 'bcd'
puts caesar_cipher('xyz', 3)                    # Expected: 'abc'
puts caesar_cipher('ABC', 2)                    # Expected: 'CDE'
puts caesar_cipher('Hello, World!', 5)          # Expected: 'Mjqqt, Btwqi!'
puts caesar_cipher('Test String', 0)            # Expected: 'Test String'
puts caesar_cipher('Defend the east wall', -3)  # Expected: 'Abcbka qeb bzpq txii'
puts caesar_cipher('Shift Large', 30)           # Expected: 'Wlmjx Pevki'
puts caesar_cipher('', 5)                       # Expected: ''
puts caesar_cipher('1234!@#$', 7)               # Expected: '1234!@#$'
