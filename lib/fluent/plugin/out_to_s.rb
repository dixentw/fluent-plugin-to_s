class Fluent::ToSOutput < Fluent::Output
  Fluent::Plugin.register_output('to_s', self)

  config_param :tag_prefix, :string, :default => 'to_s'
  config_param :field_name, :string, :default => 'to_s'

  def configure(conf)
    super

    @tag_proc = Proc.new {|tag| "#{@tag_prefix}.#{tag}"}
  end

  def emit(tag, es, chain)
    emit_tag = @tag_proc.call(tag)

    es.each do |time, record|
      record[@field_name] = record.to_s
      Fluent::Engine.emit(emit_tag, time, record)
    end

    chain.next
  end
end
