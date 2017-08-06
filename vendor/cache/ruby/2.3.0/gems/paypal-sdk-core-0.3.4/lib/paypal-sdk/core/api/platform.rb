require 'multi_json'

module PayPal::SDK::Core
  module API

    # Use NVP protocol to communicate with Platform Web services
    # == Example
    #   api       = API::Platform.new("AdaptivePayments")
    #   response  = client.request("ConvertCurrency", {
    #     "baseAmountList"        => { "currency" => [ { "code" => "USD", "amount" => "2.0"} ]},
    #     "convertToCurrencyList" => { "currencyCode" => ["GBP"] } })
    class Platform < Base

      NVP_AUTH_HEADER = {
        :username       => "X-PAYPAL-SECURITY-USERID",
        :password       => "X-PAYPAL-SECURITY-PASSWORD",
        :signature      => "X-PAYPAL-SECURITY-SIGNATURE",
        :app_id         => "X-PAYPAL-APPLICATION-ID",
        :authorization  => "X-PAYPAL-AUTHORIZATION",
        :sandbox_email_address => "X-PAYPAL-SANDBOX-EMAIL-ADDRESS",
        :device_ipaddress      => "X-PAYPAL-DEVICE-IPADDRESS"
      }
      DEFAULT_NVP_HTTP_HEADER = {
        "X-PAYPAL-REQUEST-DATA-FORMAT"  => "JSON",
        "X-PAYPAL-RESPONSE-DATA-FORMAT" => "JSON"
      }
      DEFAULT_PARAMS = Util::OrderedHash.new.merge!({
        "requestEnvelope" => { "errorLanguage" => "en_US" } })
      DEFAULT_END_POINTS = {
        :sandbox => "https://svcs.sandbox.paypal.com/",
        :live    => "https://svcs.paypal.com/",
        :tls_test => "test-svcs.sandbox.paypal.com"
      }

      # Get service end point
      def service_endpoint
        config.platform_endpoint || config.endpoint || DEFAULT_END_POINTS[api_mode]
      end

      # Format the Request.
      # === Arguments
      # * <tt>action</tt> -- Action to perform
      # * <tt>params</tt> -- Action parameters will be in Hash
      # === Return
      # * <tt>request_path</tt> -- Generated URL for requested action
      # * <tt>request_content</tt> -- Format parameters in JSON with default values.
      def format_request(payload)
        payload[:uri].path = url_join(payload[:uri].path, payload[:action])
        credential_properties = credential(payload[:uri].to_s).properties
        header   = map_header_value(NVP_AUTH_HEADER, credential_properties).
          merge(DEFAULT_NVP_HTTP_HEADER)
        payload[:header] = header.merge(payload[:header])
        payload[:body]   = MultiJson.dump(DEFAULT_PARAMS.merge(payload[:params]))
        payload
      end

      # Format the Response object
      # === Arguments
      # * <tt>action</tt> -- Requested action name
      # * <tt>response</tt> -- HTTP response object
      # === Return
      # Parse response content using JSON and return the Hash object
      def format_response(payload)
        payload[:data] =
          if payload[:response].code == "200"
            MultiJson.load(payload[:response].body)
          else
            format_error(payload[:response], payload[:response].message)
          end
        payload
      end

      # Format Error object.
      # == Arguments
      # * <tt>exception</tt> -- Exception object or HTTP response object.
      # * <tt>message</tt> -- Readable error message.
      def format_error(exception, message)
        {"responseEnvelope" => {"ack" => "Failure"}, "error" => [{"message" => message}]}
      end
    end
  end
end
