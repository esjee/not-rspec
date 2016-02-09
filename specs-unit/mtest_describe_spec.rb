require 'test/unit'
require_relative '../../lib/mtest/core'

class TestMtestDescribe < Test::Unit::TestCase
  include Mtest

  def test_that_it_can_pass
    MtestDescribe.new(MtestDescribe) do
      it { }
    end
  end

  def test_that_it_can_fail
    assert_raises IndexError do
      MtestDescribe.new(MtestDescribe) do
        it { fail IndexError,  'kerk' }
      end
    end
  end
end
