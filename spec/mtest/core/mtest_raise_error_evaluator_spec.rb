require_relative '../../../lib/mtest/core'

Mtest.describe Mtest::MtestRaiseErrorEvaluator do
  it "succeeds if the expected error is raised" do
    describe = Mtest.describe "test describe" do
      it "might raise" do
        expect { fail IndexError, 'kerkshine' }.to raise_error IndexError
      end
    end

    describe.evaluate_quietly

    expect(describe.number_of_tests_run).to eq 1
    expect(describe.all_passed?).to eq true
  end

  it "fails if no error is raised at all" do
    describe = Mtest.describe 'test describe' do
      it "might raise" do
        expect { nil }.to raise_error IndexError
      end
    end
    expected_assertion_error_message = "expected IndexError to be raised, but nothing was raised"

    describe.evaluate_quietly

    expect(describe.number_of_tests_run).to eq 1
    expect(describe.all_failed?).to eq true
    expect(describe.assertion_errors.map(&:message)).to eq [expected_assertion_error_message]
  end

  it "fails if an unkown error is raised" do
    describe = Mtest.describe 'test describe' do
      it "might raise" do
        expect { fail StandardError, 'kerk' }.to raise_error IndexError
      end
    end
    expected_assertion_error_message = "raise_error assertion failed: "\
                                       "expected IndexError got StandardError"

    describe.evaluate_quietly

    expect(describe.number_of_tests_run).to eq 1
    expect(describe.all_failed?).to eq true
    expect(describe.assertion_errors.map(&:message)).to eq [expected_assertion_error_message]
  end
end.evaluate
