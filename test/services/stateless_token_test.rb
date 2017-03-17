require 'test_helper'

class StatelessTokenTest < ActiveSupport::TestCase
  setup do
    @payload = JSON.dump({ e: "geral@porto.codes", t: Time.now.utc.to_i })
  end

  test "roundtrip" do
    t = StatelessToken.new("abracadabra")


    assert_equal @payload, t.decode(t.encode(@payload))
  end

  test "different secrets" do
    t1 = StatelessToken.new("abracadabra")
    t2 = StatelessToken.new("alakazam")

    assert_not_equal t2.encode(@payload), t1.encode(@payload)
  end

  test "idempotency" do
    t = StatelessToken.new("alakazam")

    assert_equal t.encode(@payload), t.encode(@payload)
  end
end
