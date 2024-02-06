module ApplicationHelper
    # returns full title if present, else returns base title
    def full_title(page_title="")
        base_title = "YWAM Extra"
        if page_title.blank?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end

    # flash helper
    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/flash"
    end
end
