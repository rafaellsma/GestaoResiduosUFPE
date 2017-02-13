$("#laboratories_select").empty().append("<%= escape_javascript(render(partial: 'laboratories/laboratory', collection: @laboratories)) %>")
