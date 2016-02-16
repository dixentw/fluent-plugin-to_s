class Fluent::ToSFilter < Fluent::Filter
  Fluent::Plugin.register_filter('to_jstr', self)

  config_param :field_name, :string, :default => 'to_s'

  def configure(conf)
    super
  end

  def filter(tag, time, record)
      record[@field_name] = record.to_json
      return record
  end
end
