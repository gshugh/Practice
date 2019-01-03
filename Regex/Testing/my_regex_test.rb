require 'test/unit'
require_relative '../my_regex'

class MyRegexTest < Test::Unit::TestCase

  RAND_STR = "asdfdasd"
  TEST_MONTHS = {"January" => 31, "February" => 28, "March" => 31,
                 "April" => 30, "May" => 31, "June" => 30, "July" => 31,
                 "August" => 31, "September" => 30, "October" => 31,
                 "November" => 31, "December" =>31}


###############################################################################
# Called before every test method runs. Can be used
# to set up fixture information.

  def setup
    # Do nothing
  end

###############################################################################
# Called after every test method runs. Can be used to tear
# down fixture information.

  def teardown
    # Do nothing
  end

###############################################################################
# Test the find_sorted_dates routine. It searches the given string for valid
# dates and returns nil if none are found.

  def test_find_sorted_dates
    assert_nil(MyRegex.find_sorted_dates(RAND_STR),
               "Test failure for #{RAND_STR}")
    assert_nil(MyRegex.find_sorted_dates("Jnue 25, 1999"),
               "Test failure for invalid month")
    TEST_MONTHS.each do |m|
      [1-50].each do |d|
        test = "#{m}, #{d}, 1999"
        begin
          date = Date.strptime(test)
          assert_equal(MyRegex.find_sorted_dates(test), date,
                       "Test failure for #{test}")
        rescue
          assert_nil(MyRegex.find_sorted_dates(test), "Test failue for #{test}")
        end
      end
    end
  end

end