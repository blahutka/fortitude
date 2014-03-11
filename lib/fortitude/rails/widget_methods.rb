require 'active_support'

module Fortitude
  module Rails
    module WidgetMethods
      extend ActiveSupport::Concern

      def widget_locale
        I18n.locale || I18n.default_locale
      end

      module ClassMethods
        def static_method_rails_helpers_from
          ApplicationController
        end

        def static_method_helpers_object(widget)
          out = ActionView::Base.new.extend(static_method_rails_helpers_from._helpers)
          class << out
            attr_accessor :widget

            def output_buffer
              widget.output_buffer
            end
          end
          out.widget = widget
          out
        end
      end
    end
  end
end
