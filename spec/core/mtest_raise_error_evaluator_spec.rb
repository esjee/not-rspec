require 'test/unit'
require_relative '../../lib/mtest/core'

class TestMtestRaiseErrorEvaluator < Test::Unit::TestCase
  include Mtest

  def test_it_can_pass
    Mtest.describe MtestRaiseErrorEvaluator do
      it "doesn't fail if the expected error is raised" do
        expect { raise IndexError, 'kerk' }.to raise_error IndexError
      end
    end
  end

  def test_it_can_fail
    assert_raises MtestAssertionError do
      Mtest.describe MtestRaiseErrorEvaluator do
        it "fails if the expected error doesn't raise" do
          expect { "no raise for you" }.to raise_error IndexError
        end
      end
    end
  end
end
