class Fluent::ToSOutput < Fluent::Output
  Fluent::Plugin.register_output('to_s', self)

  config_param :tag_prefix, :string, :default => ''
  config_param :field_name, :string, :default => 'to_s'

  def configure(conf)
    super

    @prefix = "#{@tag_prefix}."
    @tag_proc =
      if !@tag_prefix.empty?
        Proc.new {|tag| "#{@prefix}#{tag}"}
      else
        Proc.new {|tag| tag}
      end
    @to_s =
      Proc.new {|record| record.to_s}
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
