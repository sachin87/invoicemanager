module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", items_form: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-success add_item", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def data_pre_text(items_form)
    if items_form.object.new_record?
      [].to_json
    else
      [{ "name" => items_form.object.try(:description), "id" => items_form.object.try(:id).to_s  }].to_json
    end
  end

  def client_tokens(object)
    if object.new_record?
      [].to_json
    else
      [{"id" => object.receiver.try(:id), "name" => object.receiver.try(:first_name) }].to_json
    end
  end

  def error_messages!(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

end
