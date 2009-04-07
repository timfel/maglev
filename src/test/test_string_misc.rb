# Misellaneous tests for string (e.g., regressions and random corner cases)

require File.expand_path('simple', File.dirname(__FILE__))

#     BEGIN TEST CASES

#

test 'fooo'.rindex('oo'),    2,   "GemStone rindex A"
test 'foooo'.rindex('oo'),   3,   "GemStone rindex B" # throws ST error...
test 'abcabc'.rindex('abc'), 3,   "GemStone rindex C"
test 'abcabc'.rindex('xyz'), nil, "GemStone rindex D"
test ''.rindex('abc'),       nil, "GemStone rindex E"
test ''.rindex(''),          0,   "GemStone rindex F"
test 'abc'.rindex(''),       3,   "GemStone rindex G"
test 'ruby.rbx'.rindex('x'), 7,   "GemStone rindex H"  # Regression
test 'rubx.rbx'.rindex('x'), 7,   "GemStone rindex I"  # Regression

s = "-rw-r--r--  1 650  0  0 Oct 20  1999 /tmp/FileStatTest-234\n"
test s.split, ["-rw-r--r--", "1", "650", "0", "0", "Oct", "20", "1999", "/tmp/FileStatTest-234"], "GemStone split A"

test(" now's   the time".split,      ["now's", "the", "time"],  "PA split A")
test(" now's   the time".split(' '), ["now's", "the", "time"],  "PA split B")
test(" now's   the time".split(/ /), ["", "now's", "", "", "the", "time"], "PA split C")

test("a@1bb@2ccc".split(/@\d/),     ["a", "bb", "ccc"],           "PA split D")
test("a@1bb@2ccc".split(/@(\d)/),   ["a", "1", "bb", "2", "ccc"], "PA split E")
test("1, 2.34,56, 7".split(/,\s*/), ["1", "2.34", "56", "7"],     "PA split F")

test("hello".split(//),      ["h", "e", "l", "l", "o"], "PA split G")
test("hello".split(//, 3),   ["h", "e", "llo"],         "PA split H")
test("hi mom".split(/\s*/),  ["h", "i", "m", "o", "m"], "PA split I")
test("".split,               [],                        "PA split J")

test "mellow yellow".split("ello"), ["m", "w y", "w"], "PA split J"

test "1,2,,3,4,,".split(','),     ["1", "2", "", "3", "4"], "PA split K"
test "1,2,,3,4,,".split(',',4),   ["1", "2", "", "3,4,,"],  "PA split L"
#test "1,2,,3,4,,".split(',', -4), ["1", "2", "", "3", "4", "", ""], "PA split M"

# Test that string.inspect uses double quotes etc.
test("".inspect,       "\"\"",          'inspect A')
test("A".inspect,      "\"A\"",         'inspect B')
test("\A".inspect,     "\"A\"",         'inspect C')
test("\\A".inspect,    "\"\\\\A\"",     'inspect D')
test("\\\"A".inspect,  "\"\\\\\\\"A\"", 'inspect E')

foo = 1
test("#{foo}".inspect, "\"1\"",         'inspect F')
test("\t\n".inspect,   "\"\\t\\n\"",    'inspect G')

# Integer conversions from PickAxe p 622
test('12345'.to_i,           12345, '12345')
test('99 red balloons'.to_i,    99, '99 red balloons')

test('0a'.to_i,                  0, '0a')
test('0a'.to_i(16),             10, '"0a".to_i(16)')

test('0x10'.to_i,                0, '"0x10".to_i')
test('0x10'.to_i(0),            16, '"0x10".to_i(0)')
test('-0x10'.to_i(0),          -16, '-0x10.to_i(0)')

test('hello'.to_i,                0, '"hello".to_i')
test('hello'.to_i(30),   14_167_554, '"hello".to_i(30)')

test('1100101'.to_i(2),         101, '"1100101".to_i(2)')
test('1100101'.to_i(8),     294_977, '"1100101".to_i(8)')
test('1100101'.to_i(10),  1_100_101, '"1100101".to_i(10)')
test('1100101'.to_i(16), 17_826_049, '"1100101".to_i(16)')
test('1100101'.to_i(24),  199066177, '"1100101".to_i(24)')

test("10".hex, 16, '"10".hex')
test("0x10".hex, 16, '"0x10".hex')
test("0X10".hex, 16, '"0X10".hex')
test("0X10 blue balloons".hex, 16, '"0X10 blue balloons".hex')

# From pickaxe
test('0x0a'.hex,     10, '"0x0a".hex')
test('-1234'.hex, -4660, '"-1234".hex')
test('0'.hex,         0, '"0".hex')
test('wombat'.hex,    0, '"wombat".hex')

test('123'.oct,      83, '"123".oct')
test('-377'.oct,   -255, '"-377".oct')
test('0377bad'.oct, 255, '"0377bad".oct')

# Some weird ones...
test('0b1010'.oct, 10, '"0b1010".oct')
test('0755_333'.oct, 252635, '"0755_333".oct')

# Some of these were raising exceptions at one point...
test('0a'.to_i,     0, '"0a".to_i')     # radix is 10
test('0a'.to_i(10), 0, '"0a".to_i(10)') # radix is 10
test('0a'.to_i(0),  0, '"0a".to_i(0)')

# Ensure succ is present
test('zzz'.succ, 'aaaa', '"zzz".succ')

# Create a string with each possible byte value and ensure the inspect of
# that string is ok.
r = ''
255.times { |i| r << i }
ins = r.inspect
expected = "\"\\000\\001\\002\\003\\004\\005\\006\\a\\b\\t\\n\\v\\f\\r\\016\\017\\020\\021\\022\\023\\024\\025\\026\\027\\030\\031\\032\\e\\034\\035\\036\\037 !\\\"\\\#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\\177\\200\\201\\202\\203\\204\\205\\206\\207\\210\\211\\212\\213\\214\\215\\216\\217\\220\\221\\222\\223\\224\\225\\226\\227\\230\\231\\232\\233\\234\\235\\236\\237\\240\\241\\242\\243\\244\\245\\246\\247\\250\\251\\252\\253\\254\\255\\256\\257\\260\\261\\262\\263\\264\\265\\266\\267\\270\\271\\272\\273\\274\\275\\276\\277\\300\\301\\302\\303\\304\\305\\306\\307\\310\\311\\312\\313\\314\\315\\316\\317\\320\\321\\322\\323\\324\\325\\326\\327\\330\\331\\332\\333\\334\\335\\336\\337\\340\\341\\342\\343\\344\\345\\346\\347\\350\\351\\352\\353\\354\\355\\356\\357\\360\\361\\362\\363\\364\\365\\366\\367\\370\\371\\372\\373\\374\\375\\376\""

puts "========= ins ============="
puts ins
puts "========= expected ============="
puts expected


test(ins, expected, 'All byte values inspected')

def test_chomp
  s = 'abcd'
  r = s.chomp
  unless r == s ; raise 'Err'; end
  if r.equal?(s) ; raise 'Err'; end
  r = s.chomp!
  unless r.equal?(nil) ; raise 'Err'; end

  s = "abcd\n"
  r = s.chomp
  if r.equal?(s) ; raise 'Err'; end
  unless r == 'abcd' ; raise 'Err'; end
  r = s.chomp!
  unless r.equal?(s) ; raise 'Err'; end
  unless r == 'abcd' ; raise 'Err'; end
  s = "abcd\r\n"
  r = s.chomp
  if r.equal?(s) ; raise 'Err'; end
  unless r == 'abcd' ; raise 'Err'; end
  r = s.chomp!
  unless r.equal?(s) ; raise 'Err'; end
  unless r == 'abcd' ; raise 'Err'; end

  s = 'abcd'
  r = s.chop
  unless r == 'abc' ; raise 'Err'; end
  if r.equal?(s) ; raise 'Err'; end
  r = s.chop!
  unless r == 'abc' ; raise 'Err'; end
  unless r.equal?(s) ; raise 'Err'; end
  s = ''
  r = s.chop!
  unless r.equal?(nil) ; raise 'Err'; end
  r = s.chop
  unless r.length == 0 ; raise 'Err'; end
  return true
end

test(test_chomp() , true, "testing chomp, chop")

# gsub was generating undefined method for each_match.  This tests that case:
test('a.rb'.gsub('\\', ''), 'a.rb',  'gsub regression')

test( 'xay'.sub(/xa/) {$1} , 'y' , "Markus 10Mar09" )

test(String.new("test"), 'test',  'String.new("test")')

# Test all the forms of sub/sub!
test("hello".sub(/[aeiou]/, '*'),              'h*llo',   "sub A")
test("hello".sub(/[aeiou]/) { |match| 'FOO' }, 'hFOOllo', "sub B")

x = "hello"
x.sub!(/[aeiou]/, '*')
test(x, 'h*llo',   "sub! C")

x = "hello"
x.sub!(/[aeiou]/) { |match| 'FOO' }
test(x, 'hFOOllo', "sub! D")

# This exercises a path through gsub that wasn't being tested before.
ALPHA = "a-zA-Z"
ALNUM = "#{ALPHA}\\d"
RESERVED = ";/?:@&=+$,\\[\\]"
UNRESERVED = "-_.!~*'()#{ALNUM}"
UNSAFE = Regexp.new("[^#{UNRESERVED}#{RESERVED}]", false, 'N').freeze

str = '/__sinatra__/:image.png'
str.gsub(UNSAFE) do |us|
  puts "us: #{us}"
end

actual = "hello".gsub(/./) { |s| s[0].to_s + '|' }
test(actual, "104|101|108|108|111|", "gsub with block")

begin
  r = "xxx" =~ "yyy"
  failed_test("Expected TypeError", TypeError, nil)
rescue TypeError
  # OK
rescue Exception => x
  failed_test("Expected TypeError", TypeError, x)
end

class C
  def to_str
    '/xxx/'
  end
  def to_s
    '/yyy/'
  end
end

test('xxx'   =~ C.new, false, "'xxx'   =~ C.new")
test('yyy'   =~ C.new, false, "'yyy'   =~ C.new")

test('/xxx/' =~ C.new, false, "'/xxx/' =~ C.new")
test('/yyy/' =~ C.new, false, "'/yyy/' =~ C.new")

test(C.new =~ 'xxx',   false, "C.new =~ 'xxx'")
test(C.new =~ 'yyy',   false, "C.new =~ 'yyy'")

test(C.new =~ '/xxx/', false, "C.new =~ '/xxx/'")
test(C.new =~ '/yyy/', false, "C.new =~ '/yyy/'")

report

