# def no_dupes?(arr)
#     new_arr = []
#     arr.each_with_index do |e1, i1|
#         dup = false
#         arr.each_with_index do |e2, i2|
#             if e1 == e2 && i1 != i2 
#                 dup = true
#             end
#         end
#         new_arr<< e1 if dup == false
#     end
#     return new_arr
# end

def no_dupes?(arr)
    hash = Hash.new(0)
    new_arr = []
    arr.each do |ele|
        hash[ele] += 1
    end
    hash.select {|k, v| v == 1}.keys
end

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        if i < arr.length - 1 && arr[i] == arr[i+1] 
            return false
        end
    end
    return true
end

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}  # need to review, it's h, k in brackets, not k, v
    str.each_char.with_index do |char, i|
        hash[char]<< i
    end
    return hash
end

def longest_streak (str)
    result = ""
    current_streak = ""
    str.each_char.with_index do |char, i|
        if i == 0 
            current_streak += char
        elsif str[i] == str[i-1]
            current_streak += char
        else
            current_streak = char
        end
        result = current_streak if current_streak.length >= result.length
    end
    return result

end

def bi_prime?(num) # need to review, care about two prime time to num, not just two prime factors
    floor = 2
    (2...num).each do |n|
        if is_prime?(n) && num % n == 0 && is_prime?(num/n)
            return true
        end
    end
    return false

end 

def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0 
            return false
        end 
    end
    return true 
end

def vigenere_cipher(str, keys)
    new_str = ""
    i = 0 
    str.each_char do |char|
        key = keys[i % keys.length]
        new_char = rotate(char, key)
        new_str += new_char
        i += 1
    end
    return new_str


end

def rotate(char, key)
    alp = "abcdefghijklmnopqrstuvwxyz"
    i = alp.index(char)  # need to review, arr.index(ele), or str.index(char) return the index based on value
    i2 = (i + key) % 26
    return alp[i2]
end



def vowel_rotate(str)
    vindex = vowel_idx(str)
    new_str = ""
    str.each_char.with_index do |char, i|
        if vindex.include?(i)
            j = vindex[vindex.index(i) - 1]
            new_str += str[j]
        else
            new_str += char
        end
    end
    return new_str
end


def vowel_idx(str)
    (0...str.length).select {|i| "aeiou".include?(str[i].downcase)}
end

class String 

    def select(&prc)
        return "" if prc == nil
        new_str = ""
        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        return new_str
    end


    def map!(&prc)
        self.each_char.with_index do |char, i|
            new_char = prc.call(char, i)
            self[i] = new_char
        end
        self
    end

end 

def multiply(a, b)
    return 0 if b == 0
    # return a if b == 1  Review, do not need these two lines
    # return -a if b == -1
    if b>0 
        return multiply(a, b-1) + a
    else
        return multiply(a, b+1) -a
    end
end


def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2
    return lucas_sequence(num-1) + [lucas_sequence(num-1)[-1]+lucas_sequence(num-1)[-2]]

end

def prime_factorization(num)
    return [num] if is_prime?(num)
    return [first_prime_factor(num)] + prime_factorization(num / first_prime_factor(num))
end

def first_prime_factor(num)
    (2..num).each do |n|
        if is_prime?(n) &&  num % n == 0
            return n
        end
    end
    return false
end