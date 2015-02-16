module Dummy
  module API
    module Helpers
      def not_found!
        error! data(404, 'Not found'), 404
      end

      def data(code, message)
        { status: { code: code, message: message } }
      end
    end
  end
end