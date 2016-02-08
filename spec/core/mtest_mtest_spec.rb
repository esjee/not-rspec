require 'test/unit'
require_relative '../../lib/mtest/core'

class TestMtest < Test::Unit::TestCase
  def test_it_can_pass
    Mtest.describe "Look at me" do
      it { expect(1).to eq 1 }
    end
  end

  def test_it_can_fail
    assert_raises MtestAssertionError do
      Mtest.describe "I'm testing something!" do
        it { expect(1).to eq 2 }
      end
    end
  end
end
