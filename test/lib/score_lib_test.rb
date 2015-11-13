require 'score_lib'
include ScoreLib

class ScoreLibTest < ActionController::TestCase
  test "test kamicha-dori" do
    assert_equal [{:score => -15,:name => "pei"},
                  {:score => -10,:name => "sha"},
                  {:score => 0,:name => "nan"},
                  {:score => 25,:name => "ton"}],
                 uma([{:score => 25000,:name => "ton"},
                      {:score => 25000,:name => "nan"},
                      {:score => 25000,:name => "sha"},
                      {:score => 25000,:name => "pei"}])
  end

  test "test kiriage" do
    assert_equal [{:score => -16,:name => "pei"},
                  {:score => -10,:name => "sha"},
                  {:score => 0,:name => "nan"},
                  {:score => 26,:name => "ton"}],
                 uma([{:score => 25500,:name => "ton"},
                      {:score => 25000,:name => "nan"},
                      {:score => 25000,:name => "sha"},
                      {:score => 24500,:name => "pei"}])
  end

  test "test tobi" do
    assert_equal [{:score => -42,:name => "ton"},
                  {:score => -18,:name => "sha"},
                  {:score => 10,:name => "nan"},
                  {:score => 50,:name => "pei"}],
                 uma([{:score => -2000,:name => "ton"},
                      {:score => 35500,:name => "nan"},
                      {:score => 175o00,:name => "sha"},
                      {:score => 49000,:name => "pei"}])
  end

  test "test gosha" do
    assert_equal [{:score => -42,:name => "ton"},
                  {:score => -17,:name => "sha"},
                  {:score => 10,:name => "nan"},
                  {:score => 49,:name => "pei"}],
                 uma([{:score => -2000,:name => "ton"},
                      {:score => 35200,:name => "nan"},
                      {:score => 17800,:name => "sha"},
                      {:score => 49000,:name => "pei"}])
  end

  test "test sor" do
    assert_equal [{:score => -43,:name => "ton"},
                  {:score => -17,:name => "sha"},
                  {:score => 10,:name => "pei"},
                  {:score => 50,:name => "nan"}],
                 uma([{:score => -2500,:name => "ton"},
                      {:score => 49500,:name => "nan"},
                      {:score => 17600,:name => "sha"},
                      {:score => 35400,:name => "pei"}])
  end
end
