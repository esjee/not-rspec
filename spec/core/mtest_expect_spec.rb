require 'test/unit'
require_relative '../../lib/mtest/core'

class TestMtestDescribe < Test::Unit::TestCase
  def test_it_can_pass
    MtestDescribe.new(MtestDescribe) do
      it "can pass" do
        expect(1).to eq 1
      end
    end
  end

  def test_it_can_do_multiple_assertions_and_pass
    MtestDescribe.new(MtestDescribe) do
      it "can pass" do
        expect(1).to eq 1
        expect(-1).to eq -1
      end
    end
  end

  def test_it_can_fail
    assert_raises MtestAssertionError do
      MtestDescribe.new(MtestDescribe) do
        it "can fail" do
          expect(1).to eq 2
        end
      end
    end
  end

  def test_it_can_do_multiple_assertions_andfail
    assert_raises MtestAssertionError do
      MtestDescribe.new(MtestDescribe) do
        it "can fail" do
          expect(1).to eq 1
          expect(1).to eq 2
        end
      end
    end
  end
end
