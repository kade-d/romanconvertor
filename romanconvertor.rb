def fromRoman(romanString)
    regex = "^[MDCLXVI]+$"
    if !romanString.match(regex) then
        raise TypeError
    end

    arabicValue = {
                "M" => 1000,
                "CM" => 900,
                "D" => 500,
                "CD" => 400,
                "C" => 100,
                "XC" => 90,
                "L" => 50,
                "XL" => 40,
                "X" => 10,
                "IX" => 9,
                "V" => 5,
                "IV" => 4,
                "I" => 1
            }
    
    sum = 0
    until romanString.length == 0 do
        arabicValue.each do |key, value|
            if romanString[0 .. key.length - 1] == key then
                sum += value
                romanString = romanString[key.length .. romanString.length - 1]
            end
        end
    end
    return sum
end

def toRoman(arabicNumber)
    if arabicNumber >= 4000 || arabicNumber <= 0 then
        raise RangeError
    end

    romanValue = {
                1000 => "M",
                900 => "CM",
                500 => "D",
                400 => "CD",
                100 => "C",
                90 => "XC",
                50 => "L",
                40 => "XL",
                10 => "X",
                9 => "IX",
                5 => "V",  
                4 => "IV",
                1 => "I"
            }


    romanString = ""
    romanValue.each do |key, value|
        until key > arabicNumber do
            arabicNumber -= key
            romanString.concat(value)
        end
    end

    return romanString
end