require 'helper'

class ToSOutputTest < Test::Unit::TestCase
	def setup
		Fluent::Test.setup
	end

	CONFIG = %[
		tag_prefix pre_hoge
		field_name fname_fuga
	]

	def create_driver(conf=CONFIG, tag='test')
		Fluent::Test::OutputTestDriver.new(Fluent::ToSOutput, tag).configure(conf)
	end

	def test_configure
		d = create_driver
		assert_equal 'pre_hoge', d.instance.config["tag_prefix"]
		assert_equal 'fname_fuga', d.instance.config["field_name"]
	end

	def test_tos
		d = create_driver
		time = Time.parse("2011-01-02 13:14:15 UTC").to_i

		d.run do
			d.emit({"a" => 1})
		end

		assert_equal [
			{"a" => 1, d.instance.config["field_name"] => {"a" => 1}.to_s}
		], d.records

		d.run
	end
end
