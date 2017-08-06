# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ServicemanagementV1
      
      # Generated advice about this change, used for providing more
      # information about how a change will affect the existing service.
      class Advice
        include Google::Apis::Core::Hashable
      
        # Useful description for why this advice was applied and what actions should
        # be taken to mitigate any implied risks.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # The full representation of a Service that is managed by
      # Google Service Management.
      class ManagedService
        include Google::Apis::Core::Hashable
      
        # ID of the project that produces and owns this service.
        # Corresponds to the JSON property `producerProjectId`
        # @return [String]
        attr_accessor :producer_project_id
      
        # The name of the service. See the [overview](/service-management/overview)
        # for naming requirements.
        # Corresponds to the JSON property `serviceName`
        # @return [String]
        attr_accessor :service_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @producer_project_id = args[:producer_project_id] if args.key?(:producer_project_id)
          @service_name = args[:service_name] if args.key?(:service_name)
        end
      end
      
      # Usage configuration rules for the service.
      # NOTE: Under development.
      # Use this rule to configure unregistered calls for the service. Unregistered
      # calls are calls that do not contain consumer project identity.
      # (Example: calls that do not contain an API key).
      # By default, API methods do not allow unregistered calls, and each method call
      # must be identified by a consumer project identity. Use this rule to
      # allow/disallow unregistered calls.
      # Example of an API that wants to allow unregistered calls for entire service.
      # usage:
      # rules:
      # - selector: "*"
      # allow_unregistered_calls: true
      # Example of a method that wants to allow unregistered calls.
      # usage:
      # rules:
      # - selector: "google.example.library.v1.LibraryService.CreateBook"
      # allow_unregistered_calls: true
      class UsageRule
        include Google::Apis::Core::Hashable
      
        # Selects the methods to which this rule applies. Use '*' to indicate all
        # methods in all APIs.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # True, if the method allows unregistered calls; false otherwise.
        # Corresponds to the JSON property `allowUnregisteredCalls`
        # @return [Boolean]
        attr_accessor :allow_unregistered_calls
        alias_method :allow_unregistered_calls?, :allow_unregistered_calls
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @allow_unregistered_calls = args[:allow_unregistered_calls] if args.key?(:allow_unregistered_calls)
        end
      end
      
      # Strategy that specifies how Google Service Control should select
      # different
      # versions of service configurations based on traffic percentage.
      # One example of how to gradually rollout a new service configuration using
      # this
      # strategy:
      # Day 1
      # Rollout `
      # id: "example.googleapis.com/rollout_20160206"
      # traffic_percent_strategy `
      # percentages: `
      # "example.googleapis.com/20160201": 70.00
      # "example.googleapis.com/20160206": 30.00
      # `
      # `
      # `
      # Day 2
      # Rollout `
      # id: "example.googleapis.com/rollout_20160207"
      # traffic_percent_strategy: `
      # percentages: `
      # "example.googleapis.com/20160206": 100.00
      # `
      # `
      # `
      class TrafficPercentStrategy
        include Google::Apis::Core::Hashable
      
        # Maps service configuration IDs to their corresponding traffic percentage.
        # Key is the service configuration ID, Value is the traffic percentage
        # which must be greater than 0.0 and the sum must equal to 100.0.
        # Corresponds to the JSON property `percentages`
        # @return [Hash<String,Float>]
        attr_accessor :percentages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @percentages = args[:percentages] if args.key?(:percentages)
        end
      end
      
      # User-defined authentication requirements, including support for
      # [JSON Web Token (JWT)](https://tools.ietf.org/html/draft-ietf-oauth-json-web-
      # token-32).
      class AuthRequirement
        include Google::Apis::Core::Hashable
      
        # id from authentication provider.
        # Example:
        # provider_id: bookstore_auth
        # Corresponds to the JSON property `providerId`
        # @return [String]
        attr_accessor :provider_id
      
        # NOTE: This will be deprecated soon, once AuthProvider.audiences is
        # implemented and accepted in all the runtime components.
        # The list of JWT
        # [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#
        # section-4.1.3).
        # that are allowed to access. A JWT containing any of these audiences will
        # be accepted. When this setting is absent, only JWTs with audience
        # "https://Service_name/API_name"
        # will be accepted. For example, if no audiences are in the setting,
        # LibraryService API will only accept JWTs with the following audience
        # "https://library-example.googleapis.com/google.example.library.v1.
        # LibraryService".
        # Example:
        # audiences: bookstore_android.apps.googleusercontent.com,
        # bookstore_web.apps.googleusercontent.com
        # Corresponds to the JSON property `audiences`
        # @return [String]
        attr_accessor :audiences
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @provider_id = args[:provider_id] if args.key?(:provider_id)
          @audiences = args[:audiences] if args.key?(:audiences)
        end
      end
      
      # A condition to be met.
      class Condition
        include Google::Apis::Core::Hashable
      
        # Trusted attributes supplied by the IAM system.
        # Corresponds to the JSON property `iam`
        # @return [String]
        attr_accessor :iam
      
        # The objects of the condition. This is mutually exclusive with 'value'.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        # An operator to apply the subject with.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        # Trusted attributes discharged by the service.
        # Corresponds to the JSON property `svc`
        # @return [String]
        attr_accessor :svc
      
        # Trusted attributes supplied by any service that owns resources and uses
        # the IAM system for access control.
        # Corresponds to the JSON property `sys`
        # @return [String]
        attr_accessor :sys
      
        # DEPRECATED. Use 'values' instead.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @iam = args[:iam] if args.key?(:iam)
          @values = args[:values] if args.key?(:values)
          @op = args[:op] if args.key?(:op)
          @svc = args[:svc] if args.key?(:svc)
          @sys = args[:sys] if args.key?(:sys)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # `Documentation` provides the information for describing a service.
      # Example:
      # <pre><code>documentation:
      # summary: >
      # The Google Calendar API gives access
      # to most calendar features.
      # pages:
      # - name: Overview
      # content: &#40;== include google/foo/overview.md ==&#41;
      # - name: Tutorial
      # content: &#40;== include google/foo/tutorial.md ==&#41;
      # subpages;
      # - name: Java
      # content: &#40;== include google/foo/tutorial_java.md ==&#41;
      # rules:
      # - selector: google.calendar.Calendar.Get
      # description: >
      # ...
      # - selector: google.calendar.Calendar.Put
      # description: >
      # ...
      # </code></pre>
      # Documentation is provided in markdown syntax. In addition to
      # standard markdown features, definition lists, tables and fenced
      # code blocks are supported. Section headers can be provided and are
      # interpreted relative to the section nesting of the context where
      # a documentation fragment is embedded.
      # Documentation from the IDL is merged with documentation defined
      # via the config at normalization time, where documentation provided
      # by config rules overrides IDL provided.
      # A number of constructs specific to the API platform are supported
      # in documentation text.
      # In order to reference a proto element, the following
      # notation can be used:
      # <pre><code>&#91;fully.qualified.proto.name]&#91;]</code></pre>
      # To override the display text used for the link, this can be used:
      # <pre><code>&#91;display text]&#91;fully.qualified.proto.name]</code></pre>
      # Text can be excluded from doc using the following notation:
      # <pre><code>&#40;-- internal comment --&#41;</code></pre>
      # Comments can be made conditional using a visibility label. The below
      # text will be only rendered if the `BETA` label is available:
      # <pre><code>&#40;--BETA: comment for BETA users --&#41;</code></pre>
      # A few directives are available in documentation. Note that
      # directives must appear on a single line to be properly
      # identified. The `include` directive includes a markdown file from
      # an external source:
      # <pre><code>&#40;== include path/to/file ==&#41;</code></pre>
      # The `resource_for` directive marks a message to be the resource of
      # a collection in REST view. If it is not specified, tools attempt
      # to infer the resource from the operations in a collection:
      # <pre><code>&#40;== resource_for v1.shelves.books ==&#41;</code></pre>
      # The directive `suppress_warning` does not directly affect documentation
      # and is documented together with service config validation.
      class Documentation
        include Google::Apis::Core::Hashable
      
        # A list of documentation rules that apply to individual API elements.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::DocumentationRule>]
        attr_accessor :rules
      
        # Declares a single overview page. For example:
        # <pre><code>documentation:
        # summary: ...
        # overview: &#40;== include overview.md ==&#41;
        # </code></pre>
        # This is a shortcut for the following declaration (using pages style):
        # <pre><code>documentation:
        # summary: ...
        # pages:
        # - name: Overview
        # content: &#40;== include overview.md ==&#41;
        # </code></pre>
        # Note: you cannot specify both `overview` field and `pages` field.
        # Corresponds to the JSON property `overview`
        # @return [String]
        attr_accessor :overview
      
        # The top level pages for the documentation set.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::ServicemanagementV1::Page>]
        attr_accessor :pages
      
        # A short summary of what the service does. Can only be provided by
        # plain text.
        # Corresponds to the JSON property `summary`
        # @return [String]
        attr_accessor :summary
      
        # The URL to the root of documentation.
        # Corresponds to the JSON property `documentationRootUrl`
        # @return [String]
        attr_accessor :documentation_root_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
          @overview = args[:overview] if args.key?(:overview)
          @pages = args[:pages] if args.key?(:pages)
          @summary = args[:summary] if args.key?(:summary)
          @documentation_root_url = args[:documentation_root_url] if args.key?(:documentation_root_url)
        end
      end
      
      # Provides the configuration for logging a type of permissions.
      # Example:
      # `
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:foo@gmail.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `
      # ]
      # `
      # This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
      # foo@gmail.com from DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of
        # permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # Represents a source file which is used to generate the service configuration
      # defined by `google.api.Service`.
      class ConfigSource
        include Google::Apis::Core::Hashable
      
        # A unique ID for a specific instance of this message, typically assigned
        # by the client for tracking purpose. If empty, the server may choose to
        # generate one instead.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Set of source configuration files that are used to generate a service
        # configuration (`google.api.Service`).
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::ServicemanagementV1::ConfigFile>]
        attr_accessor :files
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @files = args[:files] if args.key?(:files)
        end
      end
      
      # A backend rule provides configuration for an individual API element.
      class BackendRule
        include Google::Apis::Core::Hashable
      
        # Minimum deadline in seconds needed for this method. Calls having deadline
        # value lower than this will be rejected.
        # Corresponds to the JSON property `minDeadline`
        # @return [Float]
        attr_accessor :min_deadline
      
        # The address of the API backend.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Selects the methods to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # The number of seconds to wait for a response from a request.  The
        # default depends on the deployment context.
        # Corresponds to the JSON property `deadline`
        # @return [Float]
        attr_accessor :deadline
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @min_deadline = args[:min_deadline] if args.key?(:min_deadline)
          @address = args[:address] if args.key?(:address)
          @selector = args[:selector] if args.key?(:selector)
          @deadline = args[:deadline] if args.key?(:deadline)
        end
      end
      
      # Authentication rules for the service.
      # By default, if a method has any authentication requirements, every request
      # must include a valid credential matching one of the requirements.
      # It's an error to include more than one kind of credential in a single
      # request.
      # If a method doesn't have any auth requirements, request credentials will be
      # ignored.
      class AuthenticationRule
        include Google::Apis::Core::Hashable
      
        # OAuth scopes are a way to define data and permissions on data. For example,
        # there are scopes defined for "Read-only access to Google Calendar" and
        # "Access to Cloud Platform". Users can consent to a scope for an application,
        # giving it permission to access that data on their behalf.
        # OAuth scope specifications should be fairly coarse grained; a user will need
        # to see and understand the text description of what your scope means.
        # In most cases: use one or at most two OAuth scopes for an entire family of
        # products. If your product has multiple APIs, you should probably be sharing
        # the OAuth scope across all of those APIs.
        # When you need finer grained OAuth consent screens: talk with your product
        # management about how developers will use them in practice.
        # Please note that even though each of the canonical scopes is enough for a
        # request to be accepted and passed to the backend, a request can still fail
        # due to the backend requiring additional scopes or permissions.
        # Corresponds to the JSON property `oauth`
        # @return [Google::Apis::ServicemanagementV1::OAuthRequirements]
        attr_accessor :oauth
      
        # Configuration for a custom authentication provider.
        # Corresponds to the JSON property `customAuth`
        # @return [Google::Apis::ServicemanagementV1::CustomAuthRequirements]
        attr_accessor :custom_auth
      
        # Requirements for additional authentication providers.
        # Corresponds to the JSON property `requirements`
        # @return [Array<Google::Apis::ServicemanagementV1::AuthRequirement>]
        attr_accessor :requirements
      
        # Selects the methods to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # Whether to allow requests without a credential. The credential can be
        # an OAuth token, Google cookies (first-party auth) or EndUserCreds.
        # For requests without credentials, if the service control environment is
        # specified, each incoming request **must** be associated with a service
        # consumer. This can be done by passing an API key that belongs to a consumer
        # project.
        # Corresponds to the JSON property `allowWithoutCredential`
        # @return [Boolean]
        attr_accessor :allow_without_credential
        alias_method :allow_without_credential?, :allow_without_credential
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @oauth = args[:oauth] if args.key?(:oauth)
          @custom_auth = args[:custom_auth] if args.key?(:custom_auth)
          @requirements = args[:requirements] if args.key?(:requirements)
          @selector = args[:selector] if args.key?(:selector)
          @allow_without_credential = args[:allow_without_credential] if args.key?(:allow_without_credential)
        end
      end
      
      # Response message for UndeleteService method.
      class UndeleteServiceResponse
        include Google::Apis::Core::Hashable
      
        # The full representation of a Service that is managed by
        # Google Service Management.
        # Corresponds to the JSON property `service`
        # @return [Google::Apis::ServicemanagementV1::ManagedService]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` consists of a list of `bindings`. A `Binding` binds a list of
      # `members` to a `role`, where the members can be user accounts, Google groups,
      # Google domains, and service accounts. A `role` is a named list of permissions
      # defined by IAM.
      # **Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/owner",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-other-app@appspot.gserviceaccount.com",
      # ]
      # `,
      # `
      # "role": "roles/viewer",
      # "members": ["user:sean@example.com"]
      # `
      # ]
      # `
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Version of the `Policy`. The default version is 0.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::ServicemanagementV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`.
        # Multiple `bindings` must not be specified for the same `role`.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::ServicemanagementV1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten blindly.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # 
        # Corresponds to the JSON property `iamOwned`
        # @return [Boolean]
        attr_accessor :iam_owned
        alias_method :iam_owned?, :iam_owned
      
        # If more than one rule is specified, the rules are applied in the following
        # manner:
        # - All matching LOG rules are always applied.
        # - If any DENY/DENY_WITH_LOG rule matches, permission is denied.
        # Logging will be applied if one or more matching rule requires logging.
        # - Otherwise, if any ALLOW/ALLOW_WITH_LOG rule matches, permission is
        # granted.
        # Logging will be applied if one or more matching rule requires logging.
        # - Otherwise, if no rule applies, permission is denied.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::Rule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version = args[:version] if args.key?(:version)
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @iam_owned = args[:iam_owned] if args.key?(:iam_owned)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Api is a light-weight descriptor for a protocol buffer service.
      class Api
        include Google::Apis::Core::Hashable
      
        # `SourceContext` represents information about the source of a
        # protobuf element, like the file in which it is defined.
        # Corresponds to the JSON property `sourceContext`
        # @return [Google::Apis::ServicemanagementV1::SourceContext]
        attr_accessor :source_context
      
        # The source syntax of the service.
        # Corresponds to the JSON property `syntax`
        # @return [String]
        attr_accessor :syntax
      
        # A version string for this api. If specified, must have the form
        # `major-version.minor-version`, as in `1.10`. If the minor version
        # is omitted, it defaults to zero. If the entire version field is
        # empty, the major version is derived from the package name, as
        # outlined below. If the field is not empty, the version in the
        # package name will be verified to be consistent with what is
        # provided here.
        # The versioning schema uses [semantic
        # versioning](http://semver.org) where the major version number
        # indicates a breaking change and the minor version an additive,
        # non-breaking change. Both version numbers are signals to users
        # what to expect from different versions, and should be carefully
        # chosen based on the product plan.
        # The major version is also reflected in the package name of the
        # API, which must end in `v<major-version>`, as in
        # `google.feature.v1`. For major versions 0 and 1, the suffix can
        # be omitted. Zero major versions must only be used for
        # experimental, none-GA apis.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # Included APIs. See Mixin.
        # Corresponds to the JSON property `mixins`
        # @return [Array<Google::Apis::ServicemanagementV1::Mixin>]
        attr_accessor :mixins
      
        # Any metadata attached to the API.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        # The methods of this api, in unspecified order.
        # Corresponds to the JSON property `methods`
        # @return [Array<Google::Apis::ServicemanagementV1::MethodProp>]
        attr_accessor :methods_prop
      
        # The fully qualified name of this api, including package name
        # followed by the api's simple name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_context = args[:source_context] if args.key?(:source_context)
          @syntax = args[:syntax] if args.key?(:syntax)
          @version = args[:version] if args.key?(:version)
          @mixins = args[:mixins] if args.key?(:mixins)
          @options = args[:options] if args.key?(:options)
          @methods_prop = args[:methods_prop] if args.key?(:methods_prop)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Write a Data Access (Gin) log
      class DataAccessOptions
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Bind API methods to metrics. Binding a method to a metric causes that
      # metric's configured quota behaviors to apply to the method call.
      class MetricRule
        include Google::Apis::Core::Hashable
      
        # Selects the methods to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # Metrics to update when the selected methods are called, and the associated
        # cost applied to each metric.
        # The key of the map is the metric name, and the values are the amount
        # increased for the metric against which the quota limits are defined.
        # The value must not be negative.
        # Corresponds to the JSON property `metricCosts`
        # @return [Hash<String,Fixnum>]
        attr_accessor :metric_costs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @metric_costs = args[:metric_costs] if args.key?(:metric_costs)
        end
      end
      
      # `Authentication` defines the authentication configuration for an API.
      # Example for an API targeted for external use:
      # name: calendar.googleapis.com
      # authentication:
      # providers:
      # - id: google_calendar_auth
      # jwks_uri: https://www.googleapis.com/oauth2/v1/certs
      # issuer: https://securetoken.google.com
      # rules:
      # - selector: "*"
      # requirements:
      # provider_id: google_calendar_auth
      class Authentication
        include Google::Apis::Core::Hashable
      
        # A list of authentication rules that apply to individual API methods.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::AuthenticationRule>]
        attr_accessor :rules
      
        # Defines a set of authentication providers that a service supports.
        # Corresponds to the JSON property `providers`
        # @return [Array<Google::Apis::ServicemanagementV1::AuthProvider>]
        attr_accessor :providers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
          @providers = args[:providers] if args.key?(:providers)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If true, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should have the format of `operations/some/unique/name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by
        # [gRPC](https://github.com/grpc). The error model is designed to be:
        # - Simple to use and understand for most users
        # - Flexible enough to meet unexpected needs
        # # Overview
        # The `Status` message contains three pieces of data: error code, error message,
        # and error details. The error code should be an enum value of
        # google.rpc.Code, but it may accept additional error codes if needed.  The
        # error message should be a developer-facing English message that helps
        # developers *understand* and *resolve* the error. If a localized user-facing
        # error message is needed, put the localized message in the error details or
        # localize it in the client. The optional error details may contain arbitrary
        # information about the error. There is a predefined set of error detail types
        # in the package `google.rpc` that can be used for common error conditions.
        # # Language mapping
        # The `Status` message is the logical representation of the error model, but it
        # is not necessarily the actual wire format. When the `Status` message is
        # exposed in different client libraries and different wire protocols, it can be
        # mapped differently. For example, it will likely be mapped to some exceptions
        # in Java, but more likely mapped to some error codes in C.
        # # Other uses
        # The error model and the `Status` message can be used in a variety of
        # environments, either with or without APIs, to provide a
        # consistent developer experience across different environments.
        # Example uses of this error model include:
        # - Partial errors. If a service needs to return partial errors to the client,
        # it may embed the `Status` in the normal response to indicate the partial
        # errors.
        # - Workflow errors. A typical workflow has multiple steps. Each step may
        # have a `Status` message for error reporting.
        # - Batch operations. If a client uses batch request and batch response, the
        # `Status` message should be used directly inside batch response, one for
        # each error sub-response.
        # - Asynchronous operations. If an API call embeds asynchronous operation
        # results in its response, the status of those operations should be
        # represented directly using the `Status` message.
        # - Logging. If some API errors are stored in logs, the message `Status` could
        # be used directly after any stripping needed for security/privacy reasons.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::ServicemanagementV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @response = args[:response] if args.key?(:response)
          @name = args[:name] if args.key?(:name)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # Represents a documentation page. A page can contain subpages to represent
      # nested documentation set structure.
      class Page
        include Google::Apis::Core::Hashable
      
        # The name of the page. It will be used as an identity of the page to
        # generate URI of the page, text of the link to this page in navigation,
        # etc. The full page name (start from the root page name to this page
        # concatenated with `.`) can be used as reference to the page in your
        # documentation. For example:
        # <pre><code>pages:
        # - name: Tutorial
        # content: &#40;== include tutorial.md ==&#41;
        # subpages:
        # - name: Java
        # content: &#40;== include tutorial_java.md ==&#41;
        # </code></pre>
        # You can reference `Java` page using Markdown reference link syntax:
        # `Java`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The Markdown content of the page. You can use <code>&#40;== include `path` ==&#
        # 41;</code>
        # to include content from a Markdown file.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Subpages of this page. The order of subpages specified here will be
        # honored in the generated docset.
        # Corresponds to the JSON property `subpages`
        # @return [Array<Google::Apis::ServicemanagementV1::Page>]
        attr_accessor :subpages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @content = args[:content] if args.key?(:content)
          @subpages = args[:subpages] if args.key?(:subpages)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by
      # [gRPC](https://github.com/grpc). The error model is designed to be:
      # - Simple to use and understand for most users
      # - Flexible enough to meet unexpected needs
      # # Overview
      # The `Status` message contains three pieces of data: error code, error message,
      # and error details. The error code should be an enum value of
      # google.rpc.Code, but it may accept additional error codes if needed.  The
      # error message should be a developer-facing English message that helps
      # developers *understand* and *resolve* the error. If a localized user-facing
      # error message is needed, put the localized message in the error details or
      # localize it in the client. The optional error details may contain arbitrary
      # information about the error. There is a predefined set of error detail types
      # in the package `google.rpc` that can be used for common error conditions.
      # # Language mapping
      # The `Status` message is the logical representation of the error model, but it
      # is not necessarily the actual wire format. When the `Status` message is
      # exposed in different client libraries and different wire protocols, it can be
      # mapped differently. For example, it will likely be mapped to some exceptions
      # in Java, but more likely mapped to some error codes in C.
      # # Other uses
      # The error model and the `Status` message can be used in a variety of
      # environments, either with or without APIs, to provide a
      # consistent developer experience across different environments.
      # Example uses of this error model include:
      # - Partial errors. If a service needs to return partial errors to the client,
      # it may embed the `Status` in the normal response to indicate the partial
      # errors.
      # - Workflow errors. A typical workflow has multiple steps. Each step may
      # have a `Status` message for error reporting.
      # - Batch operations. If a client uses batch request and batch response, the
      # `Status` message should be used directly inside batch response, one for
      # each error sub-response.
      # - Asynchronous operations. If an API call embeds asynchronous operation
      # results in its response, the status of those operations should be
      # represented directly using the `Status` message.
      # - Logging. If some API errors are stored in logs, the message `Status` could
      # be used directly after any stripping needed for security/privacy reasons.
      class Status
        include Google::Apis::Core::Hashable
      
        # A list of messages that carry the error details.  There will be a
        # common set of message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @details = args[:details] if args.key?(:details)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@gmail.com` or `joe@example.com`.
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: A Google Apps domain name that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Required
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Configuration for an anthentication provider, including support for
      # [JSON Web Token (JWT)](https://tools.ietf.org/html/draft-ietf-oauth-json-web-
      # token-32).
      class AuthProvider
        include Google::Apis::Core::Hashable
      
        # The list of JWT
        # [audiences](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#
        # section-4.1.3).
        # that are allowed to access. A JWT containing any of these audiences will
        # be accepted. When this setting is absent, only JWTs with audience
        # "https://Service_name/API_name"
        # will be accepted. For example, if no audiences are in the setting,
        # LibraryService API will only accept JWTs with the following audience
        # "https://library-example.googleapis.com/google.example.library.v1.
        # LibraryService".
        # Example:
        # audiences: bookstore_android.apps.googleusercontent.com,
        # bookstore_web.apps.googleusercontent.com
        # Corresponds to the JSON property `audiences`
        # @return [String]
        attr_accessor :audiences
      
        # The unique identifier of the auth provider. It will be referred to by
        # `AuthRequirement.provider_id`.
        # Example: "bookstore_auth".
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies the principal that issued the JWT. See
        # https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32#section-4.1.1
        # Usually a URL or an email address.
        # Example: https://securetoken.google.com
        # Example: 1234567-compute@developer.gserviceaccount.com
        # Corresponds to the JSON property `issuer`
        # @return [String]
        attr_accessor :issuer
      
        # URL of the provider's public key set to validate signature of the JWT. See
        # [OpenID Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html#
        # ProviderMetadata).
        # Optional if the key set document:
        # - can be retrieved from
        # [OpenID Discovery](https://openid.net/specs/openid-connect-discovery-1_0.
        # html
        # of the issuer.
        # - can be inferred from the email domain of the issuer (e.g. a Google service
        # account).
        # Example: https://www.googleapis.com/oauth2/v1/certs
        # Corresponds to the JSON property `jwksUri`
        # @return [String]
        attr_accessor :jwks_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audiences = args[:audiences] if args.key?(:audiences)
          @id = args[:id] if args.key?(:id)
          @issuer = args[:issuer] if args.key?(:issuer)
          @jwks_uri = args[:jwks_uri] if args.key?(:jwks_uri)
        end
      end
      
      # `Service` is the root object of Google service configuration schema. It
      # describes basic information about a service, such as the name and the
      # title, and delegates other aspects to sub-sections. Each sub-section is
      # either a proto message or a repeated proto message that configures a
      # specific aspect, such as auth. See each proto message definition for details.
      # Example:
      # type: google.api.Service
      # config_version: 3
      # name: calendar.googleapis.com
      # title: Google Calendar API
      # apis:
      # - name: google.calendar.v3.Calendar
      # authentication:
      # providers:
      # - id: google_calendar_auth
      # jwks_uri: https://www.googleapis.com/oauth2/v1/certs
      # issuer: https://securetoken.google.com
      # rules:
      # - selector: "*"
      # requirements:
      # provider_id: google_calendar_auth
      class Service
        include Google::Apis::Core::Hashable
      
        # `Documentation` provides the information for describing a service.
        # Example:
        # <pre><code>documentation:
        # summary: >
        # The Google Calendar API gives access
        # to most calendar features.
        # pages:
        # - name: Overview
        # content: &#40;== include google/foo/overview.md ==&#41;
        # - name: Tutorial
        # content: &#40;== include google/foo/tutorial.md ==&#41;
        # subpages;
        # - name: Java
        # content: &#40;== include google/foo/tutorial_java.md ==&#41;
        # rules:
        # - selector: google.calendar.Calendar.Get
        # description: >
        # ...
        # - selector: google.calendar.Calendar.Put
        # description: >
        # ...
        # </code></pre>
        # Documentation is provided in markdown syntax. In addition to
        # standard markdown features, definition lists, tables and fenced
        # code blocks are supported. Section headers can be provided and are
        # interpreted relative to the section nesting of the context where
        # a documentation fragment is embedded.
        # Documentation from the IDL is merged with documentation defined
        # via the config at normalization time, where documentation provided
        # by config rules overrides IDL provided.
        # A number of constructs specific to the API platform are supported
        # in documentation text.
        # In order to reference a proto element, the following
        # notation can be used:
        # <pre><code>&#91;fully.qualified.proto.name]&#91;]</code></pre>
        # To override the display text used for the link, this can be used:
        # <pre><code>&#91;display text]&#91;fully.qualified.proto.name]</code></pre>
        # Text can be excluded from doc using the following notation:
        # <pre><code>&#40;-- internal comment --&#41;</code></pre>
        # Comments can be made conditional using a visibility label. The below
        # text will be only rendered if the `BETA` label is available:
        # <pre><code>&#40;--BETA: comment for BETA users --&#41;</code></pre>
        # A few directives are available in documentation. Note that
        # directives must appear on a single line to be properly
        # identified. The `include` directive includes a markdown file from
        # an external source:
        # <pre><code>&#40;== include path/to/file ==&#41;</code></pre>
        # The `resource_for` directive marks a message to be the resource of
        # a collection in REST view. If it is not specified, tools attempt
        # to infer the resource from the operations in a collection:
        # <pre><code>&#40;== resource_for v1.shelves.books ==&#41;</code></pre>
        # The directive `suppress_warning` does not directly affect documentation
        # and is documented together with service config validation.
        # Corresponds to the JSON property `documentation`
        # @return [Google::Apis::ServicemanagementV1::Documentation]
        attr_accessor :documentation
      
        # Logging configuration of the service.
        # The following example shows how to configure logs to be sent to the
        # producer and consumer projects. In the example, the `activity_history`
        # log is sent to both the producer and consumer projects, whereas the
        # `purchase_history` log is only sent to the producer project.
        # monitored_resources:
        # - type: library.googleapis.com/branch
        # labels:
        # - key: /city
        # description: The city where the library branch is located in.
        # - key: /name
        # description: The name of the branch.
        # logs:
        # - name: activity_history
        # labels:
        # - key: /customer_id
        # - name: purchase_history
        # logging:
        # producer_destinations:
        # - monitored_resource: library.googleapis.com/branch
        # logs:
        # - activity_history
        # - purchase_history
        # consumer_destinations:
        # - monitored_resource: library.googleapis.com/branch
        # logs:
        # - activity_history
        # Corresponds to the JSON property `logging`
        # @return [Google::Apis::ServicemanagementV1::Logging]
        attr_accessor :logging
      
        # Defines the monitored resources used by this service. This is required
        # by the Service.monitoring and Service.logging configurations.
        # Corresponds to the JSON property `monitoredResources`
        # @return [Array<Google::Apis::ServicemanagementV1::MonitoredResourceDescriptor>]
        attr_accessor :monitored_resources
      
        # `Context` defines which contexts an API requests.
        # Example:
        # context:
        # rules:
        # - selector: "*"
        # requested:
        # - google.rpc.context.ProjectContext
        # - google.rpc.context.OriginContext
        # The above specifies that all methods in the API request
        # `google.rpc.context.ProjectContext` and
        # `google.rpc.context.OriginContext`.
        # Available context types are defined in package
        # `google.rpc.context`.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::ServicemanagementV1::Context]
        attr_accessor :context
      
        # A list of all enum types included in this API service.  Enums
        # referenced directly or indirectly by the `apis` are automatically
        # included.  Enums which are not referenced but shall be included
        # should be listed here by name. Example:
        # enums:
        # - name: google.someapi.v1.SomeEnum
        # Corresponds to the JSON property `enums`
        # @return [Array<Google::Apis::ServicemanagementV1::Enum>]
        attr_accessor :enums
      
        # A unique ID for a specific instance of this message, typically assigned
        # by the client for tracking purpose. If empty, the server may choose to
        # generate one instead.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Configuration controlling usage of a service.
        # Corresponds to the JSON property `usage`
        # @return [Google::Apis::ServicemanagementV1::Usage]
        attr_accessor :usage
      
        # Defines the metrics used by this service.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::ServicemanagementV1::MetricDescriptor>]
        attr_accessor :metrics
      
        # `Authentication` defines the authentication configuration for an API.
        # Example for an API targeted for external use:
        # name: calendar.googleapis.com
        # authentication:
        # providers:
        # - id: google_calendar_auth
        # jwks_uri: https://www.googleapis.com/oauth2/v1/certs
        # issuer: https://securetoken.google.com
        # rules:
        # - selector: "*"
        # requirements:
        # provider_id: google_calendar_auth
        # Corresponds to the JSON property `authentication`
        # @return [Google::Apis::ServicemanagementV1::Authentication]
        attr_accessor :authentication
      
        # Experimental service configuration. These configuration options can
        # only be used by whitelisted users.
        # Corresponds to the JSON property `experimental`
        # @return [Google::Apis::ServicemanagementV1::Experimental]
        attr_accessor :experimental
      
        # Selects and configures the service controller used by the service.  The
        # service controller handles features like abuse, quota, billing, logging,
        # monitoring, etc.
        # Corresponds to the JSON property `control`
        # @return [Google::Apis::ServicemanagementV1::Control]
        attr_accessor :control
      
        # The version of the service configuration. The config version may
        # influence interpretation of the configuration, for example, to
        # determine defaults. This is documented together with applicable
        # options. The current default for the config version itself is `3`.
        # Corresponds to the JSON property `configVersion`
        # @return [Fixnum]
        attr_accessor :config_version
      
        # Monitoring configuration of the service.
        # The example below shows how to configure monitored resources and metrics
        # for monitoring. In the example, a monitored resource and two metrics are
        # defined. The `library.googleapis.com/book/returned_count` metric is sent
        # to both producer and consumer projects, whereas the
        # `library.googleapis.com/book/overdue_count` metric is only sent to the
        # consumer project.
        # monitored_resources:
        # - type: library.googleapis.com/branch
        # labels:
        # - key: /city
        # description: The city where the library branch is located in.
        # - key: /name
        # description: The name of the branch.
        # metrics:
        # - name: library.googleapis.com/book/returned_count
        # metric_kind: DELTA
        # value_type: INT64
        # labels:
        # - key: /customer_id
        # - name: library.googleapis.com/book/overdue_count
        # metric_kind: GAUGE
        # value_type: INT64
        # labels:
        # - key: /customer_id
        # monitoring:
        # producer_destinations:
        # - monitored_resource: library.googleapis.com/branch
        # metrics:
        # - library.googleapis.com/book/returned_count
        # consumer_destinations:
        # - monitored_resource: library.googleapis.com/branch
        # metrics:
        # - library.googleapis.com/book/returned_count
        # - library.googleapis.com/book/overdue_count
        # Corresponds to the JSON property `monitoring`
        # @return [Google::Apis::ServicemanagementV1::Monitoring]
        attr_accessor :monitoring
      
        # A list of all proto message types included in this API service.
        # It serves similar purpose as [google.api.Service.types], except that
        # these types are not needed by user-defined APIs. Therefore, they will not
        # show up in the generated discovery doc. This field should only be used
        # to define system APIs in ESF.
        # Corresponds to the JSON property `systemTypes`
        # @return [Array<Google::Apis::ServicemanagementV1::Type>]
        attr_accessor :system_types
      
        # The id of the Google developer project that owns the service.
        # Members of this project can manage the service configuration,
        # manage consumption of the service, etc.
        # Corresponds to the JSON property `producerProjectId`
        # @return [String]
        attr_accessor :producer_project_id
      
        # `Visibility` defines restrictions for the visibility of service
        # elements.  Restrictions are specified using visibility labels
        # (e.g., TRUSTED_TESTER) that are elsewhere linked to users and projects.
        # Users and projects can have access to more than one visibility label. The
        # effective visibility for multiple labels is the union of each label's
        # elements, plus any unrestricted elements.
        # If an element and its parents have no restrictions, visibility is
        # unconditionally granted.
        # Example:
        # visibility:
        # rules:
        # - selector: google.calendar.Calendar.EnhancedSearch
        # restriction: TRUSTED_TESTER
        # - selector: google.calendar.Calendar.Delegate
        # restriction: GOOGLE_INTERNAL
        # Here, all methods are publicly visible except for the restricted methods
        # EnhancedSearch and Delegate.
        # Corresponds to the JSON property `visibility`
        # @return [Google::Apis::ServicemanagementV1::Visibility]
        attr_accessor :visibility
      
        # Quota configuration helps to achieve fairness and budgeting in service
        # usage.
        # The quota configuration works this way:
        # - The service configuration defines a set of metrics.
        # - For API calls, the quota.metric_rules maps methods to metrics with
        # corresponding costs.
        # - The quota.limits defines limits on the metrics, which will be used for
        # quota checks at runtime.
        # An example quota configuration in yaml format:
        # quota:
        # - name: apiWriteQpsPerProject
        # metric: library.googleapis.com/write_calls
        # unit: "1/min/`project`"  # rate limit for consumer projects
        # values:
        # STANDARD: 10000
        # # The metric rules bind all methods to the read_calls metric,
        # # except for the UpdateBook and DeleteBook methods. These two methods
        # # are mapped to the write_calls metric, with the UpdateBook method
        # # consuming at twice rate as the DeleteBook method.
        # metric_rules:
        # - selector: "*"
        # metric_costs:
        # library.googleapis.com/read_calls: 1
        # - selector: google.example.library.v1.LibraryService.UpdateBook
        # metric_costs:
        # library.googleapis.com/write_calls: 2
        # - selector: google.example.library.v1.LibraryService.DeleteBook
        # metric_costs:
        # library.googleapis.com/write_calls: 1
        # Corresponding Metric definition:
        # metrics:
        # - name: library.googleapis.com/read_calls
        # display_name: Read requests
        # metric_kind: DELTA
        # value_type: INT64
        # - name: library.googleapis.com/write_calls
        # display_name: Write requests
        # metric_kind: DELTA
        # value_type: INT64
        # Corresponds to the JSON property `quota`
        # @return [Google::Apis::ServicemanagementV1::Quota]
        attr_accessor :quota
      
        # The DNS address at which this service is available,
        # e.g. `calendar.googleapis.com`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Customize service error responses.  For example, list any service
        # specific protobuf types that can appear in error detail lists of
        # error responses.
        # Example:
        # custom_error:
        # types:
        # - google.foo.v1.CustomError
        # - google.foo.v1.AnotherError
        # Corresponds to the JSON property `customError`
        # @return [Google::Apis::ServicemanagementV1::CustomError]
        attr_accessor :custom_error
      
        # The product title associated with this service.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Configuration for network endpoints.  If this is empty, then an endpoint
        # with the same name as the service is automatically generated to service all
        # defined APIs.
        # Corresponds to the JSON property `endpoints`
        # @return [Array<Google::Apis::ServicemanagementV1::Endpoint>]
        attr_accessor :endpoints
      
        # A list of API interfaces exported by this service. Only the `name` field
        # of the google.protobuf.Api needs to be provided by the configuration
        # author, as the remaining fields will be derived from the IDL during the
        # normalization process. It is an error to specify an API interface here
        # which cannot be resolved against the associated IDL files.
        # Corresponds to the JSON property `apis`
        # @return [Array<Google::Apis::ServicemanagementV1::Api>]
        attr_accessor :apis
      
        # Defines the logs used by this service.
        # Corresponds to the JSON property `logs`
        # @return [Array<Google::Apis::ServicemanagementV1::LogDescriptor>]
        attr_accessor :logs
      
        # A list of all proto message types included in this API service.
        # Types referenced directly or indirectly by the `apis` are
        # automatically included.  Messages which are not referenced but
        # shall be included, such as types used by the `google.protobuf.Any` type,
        # should be listed here by name. Example:
        # types:
        # - name: google.protobuf.Int32
        # Corresponds to the JSON property `types`
        # @return [Array<Google::Apis::ServicemanagementV1::Type>]
        attr_accessor :types
      
        # Source information used to create a Service Config
        # Corresponds to the JSON property `sourceInfo`
        # @return [Google::Apis::ServicemanagementV1::SourceInfo]
        attr_accessor :source_info
      
        # Defines the HTTP configuration for a service. It contains a list of
        # HttpRule, each specifying the mapping of an RPC method
        # to one or more HTTP REST API methods.
        # Corresponds to the JSON property `http`
        # @return [Google::Apis::ServicemanagementV1::Http]
        attr_accessor :http
      
        # ### System parameter configuration
        # A system parameter is a special kind of parameter defined by the API
        # system, not by an individual API. It is typically mapped to an HTTP header
        # and/or a URL query parameter. This configuration specifies which methods
        # change the names of the system parameters.
        # Corresponds to the JSON property `systemParameters`
        # @return [Google::Apis::ServicemanagementV1::SystemParameters]
        attr_accessor :system_parameters
      
        # `Backend` defines the backend configuration for a service.
        # Corresponds to the JSON property `backend`
        # @return [Google::Apis::ServicemanagementV1::Backend]
        attr_accessor :backend
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @documentation = args[:documentation] if args.key?(:documentation)
          @logging = args[:logging] if args.key?(:logging)
          @monitored_resources = args[:monitored_resources] if args.key?(:monitored_resources)
          @context = args[:context] if args.key?(:context)
          @enums = args[:enums] if args.key?(:enums)
          @id = args[:id] if args.key?(:id)
          @usage = args[:usage] if args.key?(:usage)
          @metrics = args[:metrics] if args.key?(:metrics)
          @authentication = args[:authentication] if args.key?(:authentication)
          @experimental = args[:experimental] if args.key?(:experimental)
          @control = args[:control] if args.key?(:control)
          @config_version = args[:config_version] if args.key?(:config_version)
          @monitoring = args[:monitoring] if args.key?(:monitoring)
          @system_types = args[:system_types] if args.key?(:system_types)
          @producer_project_id = args[:producer_project_id] if args.key?(:producer_project_id)
          @visibility = args[:visibility] if args.key?(:visibility)
          @quota = args[:quota] if args.key?(:quota)
          @name = args[:name] if args.key?(:name)
          @custom_error = args[:custom_error] if args.key?(:custom_error)
          @title = args[:title] if args.key?(:title)
          @endpoints = args[:endpoints] if args.key?(:endpoints)
          @apis = args[:apis] if args.key?(:apis)
          @logs = args[:logs] if args.key?(:logs)
          @types = args[:types] if args.key?(:types)
          @source_info = args[:source_info] if args.key?(:source_info)
          @http = args[:http] if args.key?(:http)
          @system_parameters = args[:system_parameters] if args.key?(:system_parameters)
          @backend = args[:backend] if args.key?(:backend)
        end
      end
      
      # Enum value definition.
      class EnumValue
        include Google::Apis::Core::Hashable
      
        # Protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        # Enum value number.
        # Corresponds to the JSON property `number`
        # @return [Fixnum]
        attr_accessor :number
      
        # Enum value name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
          @number = args[:number] if args.key?(:number)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::ServicemanagementV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # A custom pattern is used for defining custom HTTP verb.
      class CustomHttpPattern
        include Google::Apis::Core::Hashable
      
        # The path matched by this custom verb.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The name of this custom HTTP verb.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @path = args[:path] if args.key?(:path)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # The metadata associated with a long running operation resource.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The start time of the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The full name of the resources that this operation is directly
        # associated with.
        # Corresponds to the JSON property `resourceNames`
        # @return [Array<String>]
        attr_accessor :resource_names
      
        # Detailed status information for each step. The order is undetermined.
        # Corresponds to the JSON property `steps`
        # @return [Array<Google::Apis::ServicemanagementV1::Step>]
        attr_accessor :steps
      
        # Percentage of completion of this operation, ranging from 0 to 100.
        # Corresponds to the JSON property `progressPercentage`
        # @return [Fixnum]
        attr_accessor :progress_percentage
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @start_time = args[:start_time] if args.key?(:start_time)
          @resource_names = args[:resource_names] if args.key?(:resource_names)
          @steps = args[:steps] if args.key?(:steps)
          @progress_percentage = args[:progress_percentage] if args.key?(:progress_percentage)
        end
      end
      
      # Define a system parameter rule mapping system parameter definitions to
      # methods.
      class SystemParameterRule
        include Google::Apis::Core::Hashable
      
        # Selects the methods to which this rule applies. Use '*' to indicate all
        # methods in all APIs.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # Define parameters. Multiple names may be defined for a parameter.
        # For a given method call, only one of them should be used. If multiple
        # names are used the behavior is implementation-dependent.
        # If none of the specified names are present the behavior is
        # parameter-dependent.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::ServicemanagementV1::SystemParameter>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
      end
      
      # `HttpRule` defines the mapping of an RPC method to one or more HTTP
      # REST APIs.  The mapping determines what portions of the request
      # message are populated from the path, query parameters, or body of
      # the HTTP request.  The mapping is typically specified as an
      # `google.api.http` annotation, see "google/api/annotations.proto"
      # for details.
      # The mapping consists of a field specifying the path template and
      # method kind.  The path template can refer to fields in the request
      # message, as in the example below which describes a REST GET
      # operation on a resource collection of messages:
      # service Messaging `
      # rpc GetMessage(GetMessageRequest) returns (Message) `
      # option (google.api.http).get = "/v1/messages/`message_id`/`sub.
      # subfield`";
      # `
      # `
      # message GetMessageRequest `
      # message SubMessage `
      # string subfield = 1;
      # `
      # string message_id = 1; // mapped to the URL
      # SubMessage sub = 2;    // `sub.subfield` is url-mapped
      # `
      # message Message `
      # string text = 1; // content of the resource
      # `
      # The same http annotation can alternatively be expressed inside the
      # `GRPC API Configuration` YAML file.
      # http:
      # rules:
      # - selector: <proto_package_name>.Messaging.GetMessage
      # get: /v1/messages/`message_id`/`sub.subfield`
      # This definition enables an automatic, bidrectional mapping of HTTP
      # JSON to RPC. Example:
      # HTTP | RPC
      # -----|-----
      # `GET /v1/messages/123456/foo`  | `GetMessage(message_id: "123456" sub:
      # SubMessage(subfield: "foo"))`
      # In general, not only fields but also field paths can be referenced
      # from a path pattern. Fields mapped to the path pattern cannot be
      # repeated and must have a primitive (non-message) type.
      # Any fields in the request message which are not bound by the path
      # pattern automatically become (optional) HTTP query
      # parameters. Assume the following definition of the request message:
      # service Messaging `
      # rpc GetMessage(GetMessageRequest) returns (Message) `
      # option (google.api.http).get = "/v1/messages/`message_id`";
      # `
      # `
      # message GetMessageRequest `
      # message SubMessage `
      # string subfield = 1;
      # `
      # string message_id = 1; // mapped to the URL
      # int64 revision = 2;    // becomes a parameter
      # SubMessage sub = 3;    // `sub.subfield` becomes a parameter
      # `
      # This enables a HTTP JSON to RPC mapping as below:
      # HTTP | RPC
      # -----|-----
      # `GET /v1/messages/123456?revision=2&sub.subfield=foo` | `GetMessage(message_id:
      # "123456" revision: 2 sub: SubMessage(subfield: "foo"))`
      # Note that fields which are mapped to HTTP parameters must have a
      # primitive type or a repeated primitive type. Message types are not
      # allowed. In the case of a repeated type, the parameter can be
      # repeated in the URL, as in `...?param=A&param=B`.
      # For HTTP method kinds which allow a request body, the `body` field
      # specifies the mapping. Consider a REST update method on the
      # message resource collection:
      # service Messaging `
      # rpc UpdateMessage(UpdateMessageRequest) returns (Message) `
      # option (google.api.http) = `
      # put: "/v1/messages/`message_id`"
      # body: "message"
      # `;
      # `
      # `
      # message UpdateMessageRequest `
      # string message_id = 1; // mapped to the URL
      # Message message = 2;   // mapped to the body
      # `
      # The following HTTP JSON to RPC mapping is enabled, where the
      # representation of the JSON in the request body is determined by
      # protos JSON encoding:
      # HTTP | RPC
      # -----|-----
      # `PUT /v1/messages/123456 ` "text": "Hi!" `` | `UpdateMessage(message_id: "
      # 123456" message ` text: "Hi!" `)`
      # The special name `*` can be used in the body mapping to define that
      # every field not bound by the path template should be mapped to the
      # request body.  This enables the following alternative definition of
      # the update method:
      # service Messaging `
      # rpc UpdateMessage(Message) returns (Message) `
      # option (google.api.http) = `
      # put: "/v1/messages/`message_id`"
      # body: "*"
      # `;
      # `
      # `
      # message Message `
      # string message_id = 1;
      # string text = 2;
      # `
      # The following HTTP JSON to RPC mapping is enabled:
      # HTTP | RPC
      # -----|-----
      # `PUT /v1/messages/123456 ` "text": "Hi!" `` | `UpdateMessage(message_id: "
      # 123456" text: "Hi!")`
      # Note that when using `*` in the body mapping, it is not possible to
      # have HTTP parameters, as all fields not bound by the path end in
      # the body. This makes this option more rarely used in practice of
      # defining REST APIs. The common usage of `*` is in custom methods
      # which don't use the URL at all for transferring data.
      # It is possible to define multiple HTTP methods for one RPC by using
      # the `additional_bindings` option. Example:
      # service Messaging `
      # rpc GetMessage(GetMessageRequest) returns (Message) `
      # option (google.api.http) = `
      # get: "/v1/messages/`message_id`"
      # additional_bindings `
      # get: "/v1/users/`user_id`/messages/`message_id`"
      # `
      # `;
      # `
      # `
      # message GetMessageRequest `
      # string message_id = 1;
      # string user_id = 2;
      # `
      # This enables the following two alternative HTTP JSON to RPC
      # mappings:
      # HTTP | RPC
      # -----|-----
      # `GET /v1/messages/123456` | `GetMessage(message_id: "123456")`
      # `GET /v1/users/me/messages/123456` | `GetMessage(user_id: "me" message_id: "
      # 123456")`
      # # Rules for HTTP mapping
      # The rules for mapping HTTP path, query parameters, and body fields
      # to the request message are as follows:
      # 1. The `body` field specifies either `*` or a field path, or is
      # omitted. If omitted, it assumes there is no HTTP body.
      # 2. Leaf fields (recursive expansion of nested messages in the
      # request) can be classified into three types:
      # (a) Matched in the URL template.
      # (b) Covered by body (if body is `*`, everything except (a) fields;
      # else everything under the body field)
      # (c) All other fields.
      # 3. URL query parameters found in the HTTP request are mapped to (c) fields.
      # 4. Any body sent with an HTTP request can contain only (b) fields.
      # The syntax of the path template is as follows:
      # Template = "/" Segments [ Verb ] ;
      # Segments = Segment ` "/" Segment ` ;
      # Segment  = "*" | "**" | LITERAL | Variable ;
      # Variable = "`" FieldPath [ "=" Segments ] "`" ;
      # FieldPath = IDENT ` "." IDENT ` ;
      # Verb     = ":" LITERAL ;
      # The syntax `*` matches a single path segment. It follows the semantics of
      # [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.2 Simple String
      # Expansion.
      # The syntax `**` matches zero or more path segments. It follows the semantics
      # of [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.3 Reserved
      # Expansion. NOTE: it must be the last segment in the path except the Verb.
      # The syntax `LITERAL` matches literal text in the URL path.
      # The syntax `Variable` matches the entire path as specified by its template;
      # this nested template must not contain further variables. If a variable
      # matches a single path segment, its template may be omitted, e.g. ``var``
      # is equivalent to ``var=*``.
      # NOTE: the field paths in variables and in the `body` must not refer to
      # repeated fields or map fields.
      # Use CustomHttpPattern to specify any HTTP method that is not included in the
      # `pattern` field, such as HEAD, or "*" to leave the HTTP method unspecified for
      # a given URL path rule. The wild-card rule is useful for services that provide
      # content to Web (HTML) clients.
      class HttpRule
        include Google::Apis::Core::Hashable
      
        # Used for updating a resource.
        # Corresponds to the JSON property `put`
        # @return [String]
        attr_accessor :put
      
        # Used for deleting a resource.
        # Corresponds to the JSON property `delete`
        # @return [String]
        attr_accessor :delete
      
        # The name of the request field whose value is mapped to the HTTP body, or
        # `*` for mapping all fields not captured by the path pattern to the HTTP
        # body. NOTE: the referred field must not be a repeated field and must be
        # present at the top-level of request message type.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # Used for creating a resource.
        # Corresponds to the JSON property `post`
        # @return [String]
        attr_accessor :post
      
        # Defines the Media configuration for a service in case of a download.
        # Use this only for Scotty Requests. Do not use this for media support using
        # Bytestream, add instead [][google.bytestream.RestByteStream] as an API to
        # your configuration for Bytestream methods.
        # Corresponds to the JSON property `mediaDownload`
        # @return [Google::Apis::ServicemanagementV1::MediaDownload]
        attr_accessor :media_download
      
        # Optional. The rest method name is by default derived from the URL
        # pattern. If specified, this field overrides the default method name.
        # Example:
        # rpc CreateResource(CreateResourceRequest)
        # returns (CreateResourceResponse) `
        # option (google.api.http) = `
        # post: "/v1/resources",
        # body: "resource",
        # rest_method_name: "insert"
        # `;
        # `
        # This method has the automatically derived rest method name "create", but
        # for backwards compatability with apiary, it is specified as insert.
        # Corresponds to the JSON property `restMethodName`
        # @return [String]
        attr_accessor :rest_method_name
      
        # Additional HTTP bindings for the selector. Nested bindings must
        # not contain an `additional_bindings` field themselves (that is,
        # the nesting may only be one level deep).
        # Corresponds to the JSON property `additionalBindings`
        # @return [Array<Google::Apis::ServicemanagementV1::HttpRule>]
        attr_accessor :additional_bindings
      
        # The name of the response field whose value is mapped to the HTTP body of
        # response. Other response fields are ignored. This field is optional. When
        # not set, the response message will be used as HTTP body of response.
        # NOTE: the referred field must be not a repeated field and must be present
        # at the top-level of response message type.
        # Corresponds to the JSON property `responseBody`
        # @return [String]
        attr_accessor :response_body
      
        # Optional. The REST collection name is by default derived from the URL
        # pattern. If specified, this field overrides the default collection name.
        # Example:
        # rpc AddressesAggregatedList(AddressesAggregatedListRequest)
        # returns (AddressesAggregatedListResponse) `
        # option (google.api.http) = `
        # get: "/v1/projects/`project_id`/aggregated/addresses"
        # rest_collection: "projects.addresses"
        # `;
        # `
        # This method has the automatically derived collection name
        # "projects.aggregated". Because, semantically, this rpc is actually an
        # operation on the "projects.addresses" collection, the `rest_collection`
        # field is configured to override the derived collection name.
        # Corresponds to the JSON property `restCollection`
        # @return [String]
        attr_accessor :rest_collection
      
        # Defines the Media configuration for a service in case of an upload.
        # Use this only for Scotty Requests. Do not use this for media support using
        # Bytestream, add instead [][google.bytestream.RestByteStream] as an API to
        # your configuration for Bytestream methods.
        # Corresponds to the JSON property `mediaUpload`
        # @return [Google::Apis::ServicemanagementV1::MediaUpload]
        attr_accessor :media_upload
      
        # Selects methods to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # A custom pattern is used for defining custom HTTP verb.
        # Corresponds to the JSON property `custom`
        # @return [Google::Apis::ServicemanagementV1::CustomHttpPattern]
        attr_accessor :custom
      
        # Used for updating a resource.
        # Corresponds to the JSON property `patch`
        # @return [String]
        attr_accessor :patch
      
        # Used for listing and getting information about resources.
        # Corresponds to the JSON property `get`
        # @return [String]
        attr_accessor :get
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @put = args[:put] if args.key?(:put)
          @delete = args[:delete] if args.key?(:delete)
          @body = args[:body] if args.key?(:body)
          @post = args[:post] if args.key?(:post)
          @media_download = args[:media_download] if args.key?(:media_download)
          @rest_method_name = args[:rest_method_name] if args.key?(:rest_method_name)
          @additional_bindings = args[:additional_bindings] if args.key?(:additional_bindings)
          @response_body = args[:response_body] if args.key?(:response_body)
          @rest_collection = args[:rest_collection] if args.key?(:rest_collection)
          @media_upload = args[:media_upload] if args.key?(:media_upload)
          @selector = args[:selector] if args.key?(:selector)
          @custom = args[:custom] if args.key?(:custom)
          @patch = args[:patch] if args.key?(:patch)
          @get = args[:get] if args.key?(:get)
        end
      end
      
      # A visibility rule provides visibility configuration for an individual API
      # element.
      class VisibilityRule
        include Google::Apis::Core::Hashable
      
        # Selects methods, messages, fields, enums, etc. to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # A comma-separated list of visibility labels that apply to the `selector`.
        # Any of the listed labels can be used to grant the visibility.
        # If a rule has multiple labels, removing one of the labels but not all of
        # them can break clients.
        # Example:
        # visibility:
        # rules:
        # - selector: google.calendar.Calendar.EnhancedSearch
        # restriction: GOOGLE_INTERNAL, TRUSTED_TESTER
        # Removing GOOGLE_INTERNAL from this restriction will break clients that
        # rely on this method and only had access to it through GOOGLE_INTERNAL.
        # Corresponds to the JSON property `restriction`
        # @return [String]
        attr_accessor :restriction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @restriction = args[:restriction] if args.key?(:restriction)
        end
      end
      
      # Configuration of a specific monitoring destination (the producer project
      # or the consumer project).
      class MonitoringDestination
        include Google::Apis::Core::Hashable
      
        # The monitored resource type. The type must be defined in
        # Service.monitored_resources section.
        # Corresponds to the JSON property `monitoredResource`
        # @return [String]
        attr_accessor :monitored_resource
      
        # Names of the metrics to report to this monitoring destination.
        # Each name must be defined in Service.metrics section.
        # Corresponds to the JSON property `metrics`
        # @return [Array<String>]
        attr_accessor :metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @monitored_resource = args[:monitored_resource] if args.key?(:monitored_resource)
          @metrics = args[:metrics] if args.key?(:metrics)
        end
      end
      
      # `Visibility` defines restrictions for the visibility of service
      # elements.  Restrictions are specified using visibility labels
      # (e.g., TRUSTED_TESTER) that are elsewhere linked to users and projects.
      # Users and projects can have access to more than one visibility label. The
      # effective visibility for multiple labels is the union of each label's
      # elements, plus any unrestricted elements.
      # If an element and its parents have no restrictions, visibility is
      # unconditionally granted.
      # Example:
      # visibility:
      # rules:
      # - selector: google.calendar.Calendar.EnhancedSearch
      # restriction: TRUSTED_TESTER
      # - selector: google.calendar.Calendar.Delegate
      # restriction: GOOGLE_INTERNAL
      # Here, all methods are publicly visible except for the restricted methods
      # EnhancedSearch and Delegate.
      class Visibility
        include Google::Apis::Core::Hashable
      
        # A list of visibility rules that apply to individual API elements.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::VisibilityRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # ### System parameter configuration
      # A system parameter is a special kind of parameter defined by the API
      # system, not by an individual API. It is typically mapped to an HTTP header
      # and/or a URL query parameter. This configuration specifies which methods
      # change the names of the system parameters.
      class SystemParameters
        include Google::Apis::Core::Hashable
      
        # Define system parameters.
        # The parameters defined here will override the default parameters
        # implemented by the system. If this field is missing from the service
        # config, default system parameters will be used. Default system parameters
        # and names is implementation-dependent.
        # Example: define api key for all methods
        # system_parameters
        # rules:
        # - selector: "*"
        # parameters:
        # - name: api_key
        # url_query_parameter: api_key
        # Example: define 2 api key names for a specific method.
        # system_parameters
        # rules:
        # - selector: "/ListShelves"
        # parameters:
        # - name: api_key
        # http_header: Api-Key1
        # - name: api_key
        # http_header: Api-Key2
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::SystemParameterRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Output generated from semantically comparing two versions of a service
      # configuration.
      # Includes detailed information about a field that have changed with
      # applicable advice about potential consequences for the change, such as
      # backwards-incompatibility.
      class ConfigChange
        include Google::Apis::Core::Hashable
      
        # Value of the changed object in the new Service configuration,
        # in JSON format. This field will not be populated if ChangeType == REMOVED.
        # Corresponds to the JSON property `newValue`
        # @return [String]
        attr_accessor :new_value
      
        # The type for this change, either ADDED, REMOVED, or MODIFIED.
        # Corresponds to the JSON property `changeType`
        # @return [String]
        attr_accessor :change_type
      
        # Object hierarchy path to the change, with levels separated by a '.'
        # character. For repeated fields, an applicable unique identifier field is
        # used for the index (usually selector, name, or id). For maps, the term
        # 'key' is used. If the field has no unique identifier, the numeric index
        # is used.
        # Examples:
        # - visibility.rules[selector=="google.LibraryService.CreateBook"].restriction
        # - quota.metric_rules[selector=="google"].metric_costs[key=="reads"].value
        # - logging.producer_destinations[0]
        # Corresponds to the JSON property `element`
        # @return [String]
        attr_accessor :element
      
        # Value of the changed object in the old Service configuration,
        # in JSON format. This field will not be populated if ChangeType == ADDED.
        # Corresponds to the JSON property `oldValue`
        # @return [String]
        attr_accessor :old_value
      
        # Collection of advice provided for this change, useful for determining the
        # possible impact of this change.
        # Corresponds to the JSON property `advices`
        # @return [Array<Google::Apis::ServicemanagementV1::Advice>]
        attr_accessor :advices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_value = args[:new_value] if args.key?(:new_value)
          @change_type = args[:change_type] if args.key?(:change_type)
          @element = args[:element] if args.key?(:element)
          @old_value = args[:old_value] if args.key?(:old_value)
          @advices = args[:advices] if args.key?(:advices)
        end
      end
      
      # Quota configuration helps to achieve fairness and budgeting in service
      # usage.
      # The quota configuration works this way:
      # - The service configuration defines a set of metrics.
      # - For API calls, the quota.metric_rules maps methods to metrics with
      # corresponding costs.
      # - The quota.limits defines limits on the metrics, which will be used for
      # quota checks at runtime.
      # An example quota configuration in yaml format:
      # quota:
      # - name: apiWriteQpsPerProject
      # metric: library.googleapis.com/write_calls
      # unit: "1/min/`project`"  # rate limit for consumer projects
      # values:
      # STANDARD: 10000
      # # The metric rules bind all methods to the read_calls metric,
      # # except for the UpdateBook and DeleteBook methods. These two methods
      # # are mapped to the write_calls metric, with the UpdateBook method
      # # consuming at twice rate as the DeleteBook method.
      # metric_rules:
      # - selector: "*"
      # metric_costs:
      # library.googleapis.com/read_calls: 1
      # - selector: google.example.library.v1.LibraryService.UpdateBook
      # metric_costs:
      # library.googleapis.com/write_calls: 2
      # - selector: google.example.library.v1.LibraryService.DeleteBook
      # metric_costs:
      # library.googleapis.com/write_calls: 1
      # Corresponding Metric definition:
      # metrics:
      # - name: library.googleapis.com/read_calls
      # display_name: Read requests
      # metric_kind: DELTA
      # value_type: INT64
      # - name: library.googleapis.com/write_calls
      # display_name: Write requests
      # metric_kind: DELTA
      # value_type: INT64
      class Quota
        include Google::Apis::Core::Hashable
      
        # List of `QuotaLimit` definitions for the service.
        # Corresponds to the JSON property `limits`
        # @return [Array<Google::Apis::ServicemanagementV1::QuotaLimit>]
        attr_accessor :limits
      
        # List of `MetricRule` definitions, each one mapping a selected method to one
        # or more metrics.
        # Corresponds to the JSON property `metricRules`
        # @return [Array<Google::Apis::ServicemanagementV1::MetricRule>]
        attr_accessor :metric_rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @limits = args[:limits] if args.key?(:limits)
          @metric_rules = args[:metric_rules] if args.key?(:metric_rules)
        end
      end
      
      # A rollout resource that defines how service configuration versions are pushed
      # to control plane systems. Typically, you create a new version of the
      # service config, and then create a Rollout to push the service config.
      class Rollout
        include Google::Apis::Core::Hashable
      
        # Optional unique identifier of this Rollout. Only lower case letters, digits
        # and '-' are allowed.
        # If not specified by client, the server will generate one. The generated id
        # will have the form of <date><revision number>, where "date" is the create
        # date in ISO 8601 format.  "revision number" is a monotonically increasing
        # positive number that is reset every day for each service.
        # An example of the generated rollout_id is '2016-02-16r1'
        # Corresponds to the JSON property `rolloutId`
        # @return [String]
        attr_accessor :rollout_id
      
        # Strategy used to delete a service. This strategy is a placeholder only
        # used by the system generated rollout to delete a service.
        # Corresponds to the JSON property `deleteServiceStrategy`
        # @return [Google::Apis::ServicemanagementV1::DeleteServiceStrategy]
        attr_accessor :delete_service_strategy
      
        # Creation time of the rollout. Readonly.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The status of this rollout. Readonly. In case of a failed rollout,
        # the system will automatically rollback to the current Rollout
        # version. Readonly.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The name of the service associated with this Rollout.
        # Corresponds to the JSON property `serviceName`
        # @return [String]
        attr_accessor :service_name
      
        # Strategy that specifies how Google Service Control should select
        # different
        # versions of service configurations based on traffic percentage.
        # One example of how to gradually rollout a new service configuration using
        # this
        # strategy:
        # Day 1
        # Rollout `
        # id: "example.googleapis.com/rollout_20160206"
        # traffic_percent_strategy `
        # percentages: `
        # "example.googleapis.com/20160201": 70.00
        # "example.googleapis.com/20160206": 30.00
        # `
        # `
        # `
        # Day 2
        # Rollout `
        # id: "example.googleapis.com/rollout_20160207"
        # traffic_percent_strategy: `
        # percentages: `
        # "example.googleapis.com/20160206": 100.00
        # `
        # `
        # `
        # Corresponds to the JSON property `trafficPercentStrategy`
        # @return [Google::Apis::ServicemanagementV1::TrafficPercentStrategy]
        attr_accessor :traffic_percent_strategy
      
        # The user who created the Rollout. Readonly.
        # Corresponds to the JSON property `createdBy`
        # @return [String]
        attr_accessor :created_by
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rollout_id = args[:rollout_id] if args.key?(:rollout_id)
          @delete_service_strategy = args[:delete_service_strategy] if args.key?(:delete_service_strategy)
          @create_time = args[:create_time] if args.key?(:create_time)
          @status = args[:status] if args.key?(:status)
          @service_name = args[:service_name] if args.key?(:service_name)
          @traffic_percent_strategy = args[:traffic_percent_strategy] if args.key?(:traffic_percent_strategy)
          @created_by = args[:created_by] if args.key?(:created_by)
        end
      end
      
      # Request message for GenerateConfigReport method.
      class GenerateConfigReportRequest
        include Google::Apis::Core::Hashable
      
        # Service configuration against which the comparison will be done.
        # For this version of API, the supported types are
        # google.api.servicemanagement.v1.ConfigRef,
        # google.api.servicemanagement.v1.ConfigSource,
        # and google.api.Service
        # Corresponds to the JSON property `oldConfig`
        # @return [Hash<String,Object>]
        attr_accessor :old_config
      
        # Service configuration for which we want to generate the report.
        # For this version of API, the supported types are
        # google.api.servicemanagement.v1.ConfigRef,
        # google.api.servicemanagement.v1.ConfigSource,
        # and google.api.Service
        # Corresponds to the JSON property `newConfig`
        # @return [Hash<String,Object>]
        attr_accessor :new_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @old_config = args[:old_config] if args.key?(:old_config)
          @new_config = args[:new_config] if args.key?(:new_config)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` consists of a list of `bindings`. A `Binding` binds a list of
        # `members` to a `role`, where the members can be user accounts, Google groups,
        # Google domains, and service accounts. A `role` is a named list of permissions
        # defined by IAM.
        # **Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/owner",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-other-app@appspot.gserviceaccount.com",
        # ]
        # `,
        # `
        # "role": "roles/viewer",
        # "members": ["user:sean@example.com"]
        # `
        # ]
        # `
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::ServicemanagementV1::Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the
        # following default mask is used:
        # paths: "bindings, etag"
        # This field is only used by Cloud IAM.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Strategy used to delete a service. This strategy is a placeholder only
      # used by the system generated rollout to delete a service.
      class DeleteServiceStrategy
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents the status of one operation step.
      class Step
        include Google::Apis::Core::Hashable
      
        # The short description of the step.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The status code.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Configuration of a specific logging destination (the producer project
      # or the consumer project).
      class LoggingDestination
        include Google::Apis::Core::Hashable
      
        # Names of the logs to be sent to this destination. Each name must
        # be defined in the Service.logs section. If the log name is
        # not a domain scoped name, it will be automatically prefixed with
        # the service name followed by "/".
        # Corresponds to the JSON property `logs`
        # @return [Array<String>]
        attr_accessor :logs
      
        # The monitored resource type. The type must be defined in the
        # Service.monitored_resources section.
        # Corresponds to the JSON property `monitoredResource`
        # @return [String]
        attr_accessor :monitored_resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @logs = args[:logs] if args.key?(:logs)
          @monitored_resource = args[:monitored_resource] if args.key?(:monitored_resource)
        end
      end
      
      # A protocol buffer option, which can be attached to a message, field,
      # enumeration, etc.
      class Option
        include Google::Apis::Core::Hashable
      
        # The option's value packed in an Any message. If the value is a primitive,
        # the corresponding wrapper type defined in google/protobuf/wrappers.proto
        # should be used. If the value is an enum, it should be stored as an int32
        # value using the google.protobuf.Int32Value type.
        # Corresponds to the JSON property `value`
        # @return [Hash<String,Object>]
        attr_accessor :value
      
        # The option's name. For protobuf built-in options (options defined in
        # descriptor.proto), this is the short name. For example, `"map_entry"`.
        # For custom options, it should be the fully-qualified name. For example,
        # `"google.api.http"`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value = args[:value] if args.key?(:value)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Logging configuration of the service.
      # The following example shows how to configure logs to be sent to the
      # producer and consumer projects. In the example, the `activity_history`
      # log is sent to both the producer and consumer projects, whereas the
      # `purchase_history` log is only sent to the producer project.
      # monitored_resources:
      # - type: library.googleapis.com/branch
      # labels:
      # - key: /city
      # description: The city where the library branch is located in.
      # - key: /name
      # description: The name of the branch.
      # logs:
      # - name: activity_history
      # labels:
      # - key: /customer_id
      # - name: purchase_history
      # logging:
      # producer_destinations:
      # - monitored_resource: library.googleapis.com/branch
      # logs:
      # - activity_history
      # - purchase_history
      # consumer_destinations:
      # - monitored_resource: library.googleapis.com/branch
      # logs:
      # - activity_history
      class Logging
        include Google::Apis::Core::Hashable
      
        # Logging configurations for sending logs to the producer project.
        # There can be multiple producer destinations, each one must have a
        # different monitored resource type. A log can be used in at most
        # one producer destination.
        # Corresponds to the JSON property `producerDestinations`
        # @return [Array<Google::Apis::ServicemanagementV1::LoggingDestination>]
        attr_accessor :producer_destinations
      
        # Logging configurations for sending logs to the consumer project.
        # There can be multiple consumer destinations, each one must have a
        # different monitored resource type. A log can be used in at most
        # one consumer destination.
        # Corresponds to the JSON property `consumerDestinations`
        # @return [Array<Google::Apis::ServicemanagementV1::LoggingDestination>]
        attr_accessor :consumer_destinations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @producer_destinations = args[:producer_destinations] if args.key?(:producer_destinations)
          @consumer_destinations = args[:consumer_destinations] if args.key?(:consumer_destinations)
        end
      end
      
      # `QuotaLimit` defines a specific limit that applies over a specified duration
      # for a limit type. There can be at most one limit for a duration and limit
      # type combination defined within a `QuotaGroup`.
      class QuotaLimit
        include Google::Apis::Core::Hashable
      
        # Default number of tokens that can be consumed during the specified
        # duration. This is the number of tokens assigned when a client
        # application developer activates the service for his/her project.
        # Specifying a value of 0 will block all requests. This can be used if you
        # are provisioning quota to selected consumers and blocking others.
        # Similarly, a value of -1 will indicate an unlimited quota. No other
        # negative values are allowed.
        # Used by group-based quotas only.
        # Corresponds to the JSON property `defaultLimit`
        # @return [Fixnum]
        attr_accessor :default_limit
      
        # The name of the metric this quota limit applies to. The quota limits with
        # the same metric will be checked together during runtime. The metric must be
        # defined within the service config.
        # Used by metric-based quotas only.
        # Corresponds to the JSON property `metric`
        # @return [String]
        attr_accessor :metric
      
        # User-visible display name for this limit.
        # Optional. If not set, the UI will provide a default display name based on
        # the quota configuration. This field can be used to override the default
        # display name generated from the configuration.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. User-visible, extended description for this quota limit.
        # Should be used only when more context is needed to understand this limit
        # than provided by the limit's display name (see: `display_name`).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Tiered limit values, currently only STANDARD is supported.
        # Corresponds to the JSON property `values`
        # @return [Hash<String,Fixnum>]
        attr_accessor :values
      
        # Specify the unit of the quota limit. It uses the same syntax as
        # Metric.unit. The supported unit kinds are determined by the quota
        # backend system.
        # The [Google Service Control](https://cloud.google.com/service-control)
        # supports the following unit components:
        # * One of the time intevals:
        # * "/min"  for quota every minute.
        # * "/d"  for quota every 24 hours, starting 00:00 US Pacific Time.
        # * Otherwise the quota won't be reset by time, such as storage limit.
        # * One and only one of the granted containers:
        # * "/`project`" quota for a project
        # Here are some examples:
        # * "1/min/`project`" for quota per minute per project.
        # Note: the order of unit components is insignificant.
        # The "1" at the beginning is required to follow the metric unit syntax.
        # Used by metric-based quotas only.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # Maximum number of tokens that can be consumed during the specified
        # duration. Client application developers can override the default limit up
        # to this maximum. If specified, this value cannot be set to a value less
        # than the default limit. If not specified, it is set to the default limit.
        # To allow clients to apply overrides with no upper bound, set this to -1,
        # indicating unlimited maximum quota.
        # Used by group-based quotas only.
        # Corresponds to the JSON property `maxLimit`
        # @return [Fixnum]
        attr_accessor :max_limit
      
        # Name of the quota limit. The name is used to refer to the limit when
        # overriding the default limit on per-consumer basis.
        # For metric-based quota limits, the name must be provided, and it must be
        # unique within the service. The name can only include alphanumeric
        # characters as well as '-'.
        # The maximum length of the limit name is 64 characters.
        # The name of a limit is used as a unique identifier for this limit.
        # Therefore, once a limit has been put into use, its name should be
        # immutable. You can use the display_name field to provide a user-friendly
        # name for the limit. The display name can be evolved over time without
        # affecting the identity of the limit.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Duration of this limit in textual notation. Example: "100s", "24h", "1d".
        # For duration longer than a day, only multiple of days is supported. We
        # support only "100s" and "1d" for now. Additional support will be added in
        # the future. "0" indicates indefinite duration.
        # Used by group-based quotas only.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Free tier value displayed in the Developers Console for this limit.
        # The free tier is the number of tokens that will be subtracted from the
        # billed amount when billing is enabled.
        # This field can only be set on a limit with duration "1d", in a billable
        # group; it is invalid on any other limit. If this field is not set, it
        # defaults to 0, indicating that there is no free tier for this service.
        # Used by group-based quotas only.
        # Corresponds to the JSON property `freeTier`
        # @return [Fixnum]
        attr_accessor :free_tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_limit = args[:default_limit] if args.key?(:default_limit)
          @metric = args[:metric] if args.key?(:metric)
          @display_name = args[:display_name] if args.key?(:display_name)
          @description = args[:description] if args.key?(:description)
          @values = args[:values] if args.key?(:values)
          @unit = args[:unit] if args.key?(:unit)
          @max_limit = args[:max_limit] if args.key?(:max_limit)
          @name = args[:name] if args.key?(:name)
          @duration = args[:duration] if args.key?(:duration)
          @free_tier = args[:free_tier] if args.key?(:free_tier)
        end
      end
      
      # Method represents a method of an api.
      class MethodProp
        include Google::Apis::Core::Hashable
      
        # The URL of the output message type.
        # Corresponds to the JSON property `responseTypeUrl`
        # @return [String]
        attr_accessor :response_type_url
      
        # Any metadata attached to the method.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        # If true, the response is streamed.
        # Corresponds to the JSON property `responseStreaming`
        # @return [Boolean]
        attr_accessor :response_streaming
        alias_method :response_streaming?, :response_streaming
      
        # The simple name of this method.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A URL of the input message type.
        # Corresponds to the JSON property `requestTypeUrl`
        # @return [String]
        attr_accessor :request_type_url
      
        # If true, the request is streamed.
        # Corresponds to the JSON property `requestStreaming`
        # @return [Boolean]
        attr_accessor :request_streaming
        alias_method :request_streaming?, :request_streaming
      
        # The source syntax of this method.
        # Corresponds to the JSON property `syntax`
        # @return [String]
        attr_accessor :syntax
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @response_type_url = args[:response_type_url] if args.key?(:response_type_url)
          @options = args[:options] if args.key?(:options)
          @response_streaming = args[:response_streaming] if args.key?(:response_streaming)
          @name = args[:name] if args.key?(:name)
          @request_type_url = args[:request_type_url] if args.key?(:request_type_url)
          @request_streaming = args[:request_streaming] if args.key?(:request_streaming)
          @syntax = args[:syntax] if args.key?(:syntax)
        end
      end
      
      # Response message for ListServiceRollouts method.
      class ListServiceRolloutsResponse
        include Google::Apis::Core::Hashable
      
        # The token of the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of rollout resources.
        # Corresponds to the JSON property `rollouts`
        # @return [Array<Google::Apis::ServicemanagementV1::Rollout>]
        attr_accessor :rollouts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @rollouts = args[:rollouts] if args.key?(:rollouts)
        end
      end
      
      # Represents a service configuration with its name and id.
      class ConfigRef
        include Google::Apis::Core::Hashable
      
        # Resource name of a service config. It must have the following
        # format: "services/`service name`/configs/`config id`".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Declares an API to be included in this API. The including API must
      # redeclare all the methods from the included API, but documentation
      # and options are inherited as follows:
      # - If after comment and whitespace stripping, the documentation
      # string of the redeclared method is empty, it will be inherited
      # from the original method.
      # - Each annotation belonging to the service config (http,
      # visibility) which is not set in the redeclared method will be
      # inherited.
      # - If an http annotation is inherited, the path pattern will be
      # modified as follows. Any version prefix will be replaced by the
      # version of the including API plus the root path if specified.
      # Example of a simple mixin:
      # package google.acl.v1;
      # service AccessControl `
      # // Get the underlying ACL object.
      # rpc GetAcl(GetAclRequest) returns (Acl) `
      # option (google.api.http).get = "/v1/`resource=**`:getAcl";
      # `
      # `
      # package google.storage.v2;
      # service Storage `
      # //       rpc GetAcl(GetAclRequest) returns (Acl);
      # // Get a data record.
      # rpc GetData(GetDataRequest) returns (Data) `
      # option (google.api.http).get = "/v2/`resource=**`";
      # `
      # `
      # Example of a mixin configuration:
      # apis:
      # - name: google.storage.v2.Storage
      # mixins:
      # - name: google.acl.v1.AccessControl
      # The mixin construct implies that all methods in `AccessControl` are
      # also declared with same name and request/response types in
      # `Storage`. A documentation generator or annotation processor will
      # see the effective `Storage.GetAcl` method after inherting
      # documentation and annotations as follows:
      # service Storage `
      # // Get the underlying ACL object.
      # rpc GetAcl(GetAclRequest) returns (Acl) `
      # option (google.api.http).get = "/v2/`resource=**`:getAcl";
      # `
      # ...
      # `
      # Note how the version in the path pattern changed from `v1` to `v2`.
      # If the `root` field in the mixin is specified, it should be a
      # relative path under which inherited HTTP paths are placed. Example:
      # apis:
      # - name: google.storage.v2.Storage
      # mixins:
      # - name: google.acl.v1.AccessControl
      # root: acls
      # This implies the following inherited HTTP annotation:
      # service Storage `
      # // Get the underlying ACL object.
      # rpc GetAcl(GetAclRequest) returns (Acl) `
      # option (google.api.http).get = "/v2/acls/`resource=**`:getAcl";
      # `
      # ...
      # `
      class Mixin
        include Google::Apis::Core::Hashable
      
        # The fully qualified name of the API which is included.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # If non-empty specifies a path under which inherited HTTP paths
        # are rooted.
        # Corresponds to the JSON property `root`
        # @return [String]
        attr_accessor :root
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @root = args[:root] if args.key?(:root)
        end
      end
      
      # The metadata associated with a long running operation resource.
      class FlowOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The state of the operation with respect to cancellation.
        # Corresponds to the JSON property `cancelState`
        # @return [String]
        attr_accessor :cancel_state
      
        # Deadline for the flow to complete, to prevent orphaned Operations.
        # If the flow has not completed by this time, it may be terminated by
        # the engine, or force-failed by Operation lookup.
        # Note that this is not a hard deadline after which the Flow will
        # definitely be failed, rather it is a deadline after which it is reasonable
        # to suspect a problem and other parts of the system may kill operation
        # to ensure we don't have orphans.
        # see also: go/prevent-orphaned-operations
        # Corresponds to the JSON property `deadline`
        # @return [String]
        attr_accessor :deadline
      
        # The start time of the operation.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The name of the top-level flow corresponding to this operation.
        # Must be equal to the "name" field for a FlowName enum.
        # Corresponds to the JSON property `flowName`
        # @return [String]
        attr_accessor :flow_name
      
        # The full name of the resources that this flow is directly associated with.
        # Corresponds to the JSON property `resourceNames`
        # @return [Array<String>]
        attr_accessor :resource_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cancel_state = args[:cancel_state] if args.key?(:cancel_state)
          @deadline = args[:deadline] if args.key?(:deadline)
          @start_time = args[:start_time] if args.key?(:start_time)
          @flow_name = args[:flow_name] if args.key?(:flow_name)
          @resource_names = args[:resource_names] if args.key?(:resource_names)
        end
      end
      
      # Customize service error responses.  For example, list any service
      # specific protobuf types that can appear in error detail lists of
      # error responses.
      # Example:
      # custom_error:
      # types:
      # - google.foo.v1.CustomError
      # - google.foo.v1.AnotherError
      class CustomError
        include Google::Apis::Core::Hashable
      
        # The list of custom error rules that apply to individual API messages.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::CustomErrorRule>]
        attr_accessor :rules
      
        # The list of custom error detail types, e.g. 'google.foo.v1.CustomError'.
        # Corresponds to the JSON property `types`
        # @return [Array<String>]
        attr_accessor :types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
          @types = args[:types] if args.key?(:types)
        end
      end
      
      # Options for counters
      class CounterOptions
        include Google::Apis::Core::Hashable
      
        # The metric to update.
        # Corresponds to the JSON property `metric`
        # @return [String]
        attr_accessor :metric
      
        # The field value to attribute.
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric = args[:metric] if args.key?(:metric)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # Defines the HTTP configuration for a service. It contains a list of
      # HttpRule, each specifying the mapping of an RPC method
      # to one or more HTTP REST API methods.
      class Http
        include Google::Apis::Core::Hashable
      
        # When set to true, URL path parmeters will be fully URI-decoded except in
        # cases of single segment matches in reserved expansion, where "%2F" will be
        # left encoded.
        # The default behavior is to not decode RFC 6570 reserved characters in multi
        # segment matches.
        # Corresponds to the JSON property `fullyDecodeReservedExpansion`
        # @return [Boolean]
        attr_accessor :fully_decode_reserved_expansion
        alias_method :fully_decode_reserved_expansion?, :fully_decode_reserved_expansion
      
        # A list of HTTP configuration rules that apply to individual API methods.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::HttpRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fully_decode_reserved_expansion = args[:fully_decode_reserved_expansion] if args.key?(:fully_decode_reserved_expansion)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Source information used to create a Service Config
      class SourceInfo
        include Google::Apis::Core::Hashable
      
        # All files used during config generation.
        # Corresponds to the JSON property `sourceFiles`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :source_files
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_files = args[:source_files] if args.key?(:source_files)
        end
      end
      
      # Selects and configures the service controller used by the service.  The
      # service controller handles features like abuse, quota, billing, logging,
      # monitoring, etc.
      class Control
        include Google::Apis::Core::Hashable
      
        # The service control environment to use. If empty, no control plane
        # feature (like quota and billing) will be enabled.
        # Corresponds to the JSON property `environment`
        # @return [String]
        attr_accessor :environment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
        end
      end
      
      # Define a parameter's name and location. The parameter may be passed as either
      # an HTTP header or a URL query parameter, and if both are passed the behavior
      # is implementation-dependent.
      class SystemParameter
        include Google::Apis::Core::Hashable
      
        # Define the HTTP header name to use for the parameter. It is case
        # insensitive.
        # Corresponds to the JSON property `httpHeader`
        # @return [String]
        attr_accessor :http_header
      
        # Define the name of the parameter, such as "api_key" . It is case sensitive.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Define the URL query parameter name to use for the parameter. It is case
        # sensitive.
        # Corresponds to the JSON property `urlQueryParameter`
        # @return [String]
        attr_accessor :url_query_parameter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_header = args[:http_header] if args.key?(:http_header)
          @name = args[:name] if args.key?(:name)
          @url_query_parameter = args[:url_query_parameter] if args.key?(:url_query_parameter)
        end
      end
      
      # A single field of a message type.
      class Field
        include Google::Apis::Core::Hashable
      
        # The field type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The field JSON name.
        # Corresponds to the JSON property `jsonName`
        # @return [String]
        attr_accessor :json_name
      
        # The protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        # The index of the field type in `Type.oneofs`, for message or enumeration
        # types. The first type has index 1; zero means the type is not in the list.
        # Corresponds to the JSON property `oneofIndex`
        # @return [Fixnum]
        attr_accessor :oneof_index
      
        # The field cardinality.
        # Corresponds to the JSON property `cardinality`
        # @return [String]
        attr_accessor :cardinality
      
        # Whether to use alternative packed wire representation.
        # Corresponds to the JSON property `packed`
        # @return [Boolean]
        attr_accessor :packed
        alias_method :packed?, :packed
      
        # The string value of the default value of this field. Proto2 syntax only.
        # Corresponds to the JSON property `defaultValue`
        # @return [String]
        attr_accessor :default_value
      
        # The field name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The field type URL, without the scheme, for message or enumeration
        # types. Example: `"type.googleapis.com/google.protobuf.Timestamp"`.
        # Corresponds to the JSON property `typeUrl`
        # @return [String]
        attr_accessor :type_url
      
        # The field number.
        # Corresponds to the JSON property `number`
        # @return [Fixnum]
        attr_accessor :number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @json_name = args[:json_name] if args.key?(:json_name)
          @options = args[:options] if args.key?(:options)
          @oneof_index = args[:oneof_index] if args.key?(:oneof_index)
          @cardinality = args[:cardinality] if args.key?(:cardinality)
          @packed = args[:packed] if args.key?(:packed)
          @default_value = args[:default_value] if args.key?(:default_value)
          @name = args[:name] if args.key?(:name)
          @type_url = args[:type_url] if args.key?(:type_url)
          @number = args[:number] if args.key?(:number)
        end
      end
      
      # Monitoring configuration of the service.
      # The example below shows how to configure monitored resources and metrics
      # for monitoring. In the example, a monitored resource and two metrics are
      # defined. The `library.googleapis.com/book/returned_count` metric is sent
      # to both producer and consumer projects, whereas the
      # `library.googleapis.com/book/overdue_count` metric is only sent to the
      # consumer project.
      # monitored_resources:
      # - type: library.googleapis.com/branch
      # labels:
      # - key: /city
      # description: The city where the library branch is located in.
      # - key: /name
      # description: The name of the branch.
      # metrics:
      # - name: library.googleapis.com/book/returned_count
      # metric_kind: DELTA
      # value_type: INT64
      # labels:
      # - key: /customer_id
      # - name: library.googleapis.com/book/overdue_count
      # metric_kind: GAUGE
      # value_type: INT64
      # labels:
      # - key: /customer_id
      # monitoring:
      # producer_destinations:
      # - monitored_resource: library.googleapis.com/branch
      # metrics:
      # - library.googleapis.com/book/returned_count
      # consumer_destinations:
      # - monitored_resource: library.googleapis.com/branch
      # metrics:
      # - library.googleapis.com/book/returned_count
      # - library.googleapis.com/book/overdue_count
      class Monitoring
        include Google::Apis::Core::Hashable
      
        # Monitoring configurations for sending metrics to the consumer project.
        # There can be multiple consumer destinations, each one must have a
        # different monitored resource type. A metric can be used in at most
        # one consumer destination.
        # Corresponds to the JSON property `consumerDestinations`
        # @return [Array<Google::Apis::ServicemanagementV1::MonitoringDestination>]
        attr_accessor :consumer_destinations
      
        # Monitoring configurations for sending metrics to the producer project.
        # There can be multiple producer destinations, each one must have a
        # different monitored resource type. A metric can be used in at most
        # one producer destination.
        # Corresponds to the JSON property `producerDestinations`
        # @return [Array<Google::Apis::ServicemanagementV1::MonitoringDestination>]
        attr_accessor :producer_destinations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_destinations = args[:consumer_destinations] if args.key?(:consumer_destinations)
          @producer_destinations = args[:producer_destinations] if args.key?(:producer_destinations)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Enum type definition.
      class Enum
        include Google::Apis::Core::Hashable
      
        # Enum type name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Enum value definitions.
        # Corresponds to the JSON property `enumvalue`
        # @return [Array<Google::Apis::ServicemanagementV1::EnumValue>]
        attr_accessor :enumvalue
      
        # Protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        # `SourceContext` represents information about the source of a
        # protobuf element, like the file in which it is defined.
        # Corresponds to the JSON property `sourceContext`
        # @return [Google::Apis::ServicemanagementV1::SourceContext]
        attr_accessor :source_context
      
        # The source syntax.
        # Corresponds to the JSON property `syntax`
        # @return [String]
        attr_accessor :syntax
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @enumvalue = args[:enumvalue] if args.key?(:enumvalue)
          @options = args[:options] if args.key?(:options)
          @source_context = args[:source_context] if args.key?(:source_context)
          @syntax = args[:syntax] if args.key?(:syntax)
        end
      end
      
      # A description of a label.
      class LabelDescriptor
        include Google::Apis::Core::Hashable
      
        # The type of data that can be assigned to the label.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        # The label key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # A human-readable description for the label.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value_type = args[:value_type] if args.key?(:value_type)
          @key = args[:key] if args.key?(:key)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # Represents a diagnostic message (error or warning)
      class Diagnostic
        include Google::Apis::Core::Hashable
      
        # Message describing the error or warning.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # File name and line number of the error or warning.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The kind of diagnostic information provided.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
          @location = args[:location] if args.key?(:location)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Request message for EnableService method.
      class EnableServiceRequest
        include Google::Apis::Core::Hashable
      
        # The identity of consumer resource which service enablement will be
        # applied to.
        # The Google Service Management implementation accepts the following
        # forms:
        # - "project:<project_id>"
        # Note: this is made compatible with
        # google.api.servicecontrol.v1.Operation.consumer_id.
        # Corresponds to the JSON property `consumerId`
        # @return [String]
        attr_accessor :consumer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_id = args[:consumer_id] if args.key?(:consumer_id)
        end
      end
      
      # A protocol buffer message type.
      class Type
        include Google::Apis::Core::Hashable
      
        # The list of fields.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::ServicemanagementV1::Field>]
        attr_accessor :fields
      
        # The fully qualified message name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The list of types appearing in `oneof` definitions in this type.
        # Corresponds to the JSON property `oneofs`
        # @return [Array<String>]
        attr_accessor :oneofs
      
        # The source syntax.
        # Corresponds to the JSON property `syntax`
        # @return [String]
        attr_accessor :syntax
      
        # `SourceContext` represents information about the source of a
        # protobuf element, like the file in which it is defined.
        # Corresponds to the JSON property `sourceContext`
        # @return [Google::Apis::ServicemanagementV1::SourceContext]
        attr_accessor :source_context
      
        # The protocol buffer options.
        # Corresponds to the JSON property `options`
        # @return [Array<Google::Apis::ServicemanagementV1::Option>]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @oneofs = args[:oneofs] if args.key?(:oneofs)
          @syntax = args[:syntax] if args.key?(:syntax)
          @source_context = args[:source_context] if args.key?(:source_context)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Response message for GenerateConfigReport method.
      class GenerateConfigReportResponse
        include Google::Apis::Core::Hashable
      
        # ID of the service configuration this report belongs to.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Errors / Linter warnings associated with the service definition this
        # report
        # belongs to.
        # Corresponds to the JSON property `diagnostics`
        # @return [Array<Google::Apis::ServicemanagementV1::Diagnostic>]
        attr_accessor :diagnostics
      
        # Name of the service this report belongs to.
        # Corresponds to the JSON property `serviceName`
        # @return [String]
        attr_accessor :service_name
      
        # list of ChangeReport, each corresponding to comparison between two
        # service configurations.
        # Corresponds to the JSON property `changeReports`
        # @return [Array<Google::Apis::ServicemanagementV1::ChangeReport>]
        attr_accessor :change_reports
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @diagnostics = args[:diagnostics] if args.key?(:diagnostics)
          @service_name = args[:service_name] if args.key?(:service_name)
          @change_reports = args[:change_reports] if args.key?(:change_reports)
        end
      end
      
      # Response message for ListServiceConfigs method.
      class ListServiceConfigsResponse
        include Google::Apis::Core::Hashable
      
        # The list of service configuration resources.
        # Corresponds to the JSON property `serviceConfigs`
        # @return [Array<Google::Apis::ServicemanagementV1::Service>]
        attr_accessor :service_configs
      
        # The token of the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service_configs = args[:service_configs] if args.key?(:service_configs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Experimental service configuration. These configuration options can
      # only be used by whitelisted users.
      class Experimental
        include Google::Apis::Core::Hashable
      
        # Configuration of authorization.
        # This section determines the authorization provider, if unspecified, then no
        # authorization check will be done.
        # Example:
        # experimental:
        # authorization:
        # provider: firebaserules.googleapis.com
        # Corresponds to the JSON property `authorization`
        # @return [Google::Apis::ServicemanagementV1::AuthorizationConfig]
        attr_accessor :authorization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authorization = args[:authorization] if args.key?(:authorization)
        end
      end
      
      # `Backend` defines the backend configuration for a service.
      class Backend
        include Google::Apis::Core::Hashable
      
        # A list of API backend rules that apply to individual API methods.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::BackendRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Specifies the audit configuration for a service.
      # The configuration determines which permission types are logged, and what
      # identities, if any, are exempted from logging.
      # An AuditConfig must have one or more AuditLogConfigs.
      # If there are AuditConfigs for both `allServices` and a specific service,
      # the union of the two AuditConfigs is used for that service: the log_types
      # specified in each AuditConfig are enabled, and the exempted_members in each
      # AuditConfig are exempted.
      # Example Policy with multiple AuditConfigs:
      # `
      # "audit_configs": [
      # `
      # "service": "allServices"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:foo@gmail.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `,
      # `
      # "log_type": "ADMIN_READ",
      # `
      # ]
      # `,
      # `
      # "service": "fooservice.googleapis.com"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # "exempted_members": [
      # "user:bar@gmail.com"
      # ]
      # `
      # ]
      # `
      # ]
      # `
      # For fooservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
      # logging. It also exempts foo@gmail.com from DATA_READ logging, and
      # bar@gmail.com from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # Specifies a service that will be enabled for audit logging.
        # For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
        # `allServices` is a special value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        # The configuration for logging of each type of permission.
        # Next ID: 4
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::ServicemanagementV1::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # 
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service = args[:service] if args.key?(:service)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
        end
      end
      
      # Request message for SubmitConfigSource method.
      class SubmitConfigSourceRequest
        include Google::Apis::Core::Hashable
      
        # Represents a source file which is used to generate the service configuration
        # defined by `google.api.Service`.
        # Corresponds to the JSON property `configSource`
        # @return [Google::Apis::ServicemanagementV1::ConfigSource]
        attr_accessor :config_source
      
        # Optional. If set, this will result in the generation of a
        # `google.api.Service` configuration based on the `ConfigSource` provided,
        # but the generated config and the sources will NOT be persisted.
        # Corresponds to the JSON property `validateOnly`
        # @return [Boolean]
        attr_accessor :validate_only
        alias_method :validate_only?, :validate_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_source = args[:config_source] if args.key?(:config_source)
          @validate_only = args[:validate_only] if args.key?(:validate_only)
        end
      end
      
      # Configuration of authorization.
      # This section determines the authorization provider, if unspecified, then no
      # authorization check will be done.
      # Example:
      # experimental:
      # authorization:
      # provider: firebaserules.googleapis.com
      class AuthorizationConfig
        include Google::Apis::Core::Hashable
      
        # The name of the authorization provider, such as
        # firebaserules.googleapis.com.
        # Corresponds to the JSON property `provider`
        # @return [String]
        attr_accessor :provider
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @provider = args[:provider] if args.key?(:provider)
        end
      end
      
      # A documentation rule provides information about individual API elements.
      class DocumentationRule
        include Google::Apis::Core::Hashable
      
        # Description of the selected API(s).
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Deprecation description of the selected element(s). It can be provided if an
        # element is marked as `deprecated`.
        # Corresponds to the JSON property `deprecationDescription`
        # @return [String]
        attr_accessor :deprecation_description
      
        # The selector is a comma-separated list of patterns. Each pattern is a
        # qualified name of the element which may end in "*", indicating a wildcard.
        # Wildcards are only allowed at the end and for a whole component of the
        # qualified name, i.e. "foo.*" is ok, but not "foo.b*" or "foo.*.bar". To
        # specify a default for all applicable elements, the whole pattern "*"
        # is used.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @deprecation_description = args[:deprecation_description] if args.key?(:deprecation_description)
          @selector = args[:selector] if args.key?(:selector)
        end
      end
      
      # Write a Cloud Audit log
      class CloudAuditOptions
        include Google::Apis::Core::Hashable
      
        # The log_name to populate in the Cloud Audit Record.
        # Corresponds to the JSON property `logName`
        # @return [String]
        attr_accessor :log_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @log_name = args[:log_name] if args.key?(:log_name)
        end
      end
      
      # A context rule provides information about the context for an individual API
      # element.
      class ContextRule
        include Google::Apis::Core::Hashable
      
        # Selects the methods to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # A list of full type names of provided contexts.
        # Corresponds to the JSON property `provided`
        # @return [Array<String>]
        attr_accessor :provided
      
        # A list of full type names of requested contexts.
        # Corresponds to the JSON property `requested`
        # @return [Array<String>]
        attr_accessor :requested
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @provided = args[:provided] if args.key?(:provided)
          @requested = args[:requested] if args.key?(:requested)
        end
      end
      
      # Defines a metric type and its schema. Once a metric descriptor is created,
      # deleting or altering it stops data collection and makes the metric type's
      # existing data unusable.
      class MetricDescriptor
        include Google::Apis::Core::Hashable
      
        # Whether the metric records instantaneous values, changes to a value, etc.
        # Some combinations of `metric_kind` and `value_type` might not be supported.
        # Corresponds to the JSON property `metricKind`
        # @return [String]
        attr_accessor :metric_kind
      
        # A detailed description of the metric, which can be used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A concise name for the metric, which can be displayed in user interfaces.
        # Use sentence case without an ending period, for example "Request count".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The unit in which the metric value is reported. It is only applicable
        # if the `value_type` is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The
        # supported units are a subset of [The Unified Code for Units of
        # Measure](http://unitsofmeasure.org/ucum.html) standard:
        # **Basic units (UNIT)**
        # * `bit`   bit
        # * `By`    byte
        # * `s`     second
        # * `min`   minute
        # * `h`     hour
        # * `d`     day
        # **Prefixes (PREFIX)**
        # * `k`     kilo    (10**3)
        # * `M`     mega    (10**6)
        # * `G`     giga    (10**9)
        # * `T`     tera    (10**12)
        # * `P`     peta    (10**15)
        # * `E`     exa     (10**18)
        # * `Z`     zetta   (10**21)
        # * `Y`     yotta   (10**24)
        # * `m`     milli   (10**-3)
        # * `u`     micro   (10**-6)
        # * `n`     nano    (10**-9)
        # * `p`     pico    (10**-12)
        # * `f`     femto   (10**-15)
        # * `a`     atto    (10**-18)
        # * `z`     zepto   (10**-21)
        # * `y`     yocto   (10**-24)
        # * `Ki`    kibi    (2**10)
        # * `Mi`    mebi    (2**20)
        # * `Gi`    gibi    (2**30)
        # * `Ti`    tebi    (2**40)
        # **Grammar**
        # The grammar includes the dimensionless unit `1`, such as `1/s`.
        # The grammar also includes these connectors:
        # * `/`    division (as an infix operator, e.g. `1/s`).
        # * `.`    multiplication (as an infix operator, e.g. `GBy.d`)
        # The grammar for a unit is as follows:
        # Expression = Component ` "." Component ` ` "/" Component ` ;
        # Component = [ PREFIX ] UNIT [ Annotation ]
        # | Annotation
        # | "1"
        # ;
        # Annotation = "`" NAME "`" ;
        # Notes:
        # * `Annotation` is just a comment if it follows a `UNIT` and is
        # equivalent to `1` if it is used alone. For examples,
        # ``requests`/s == 1/s`, `By`transmitted`/s == By/s`.
        # * `NAME` is a sequence of non-blank printable ASCII characters not
        # containing '`' or '`'.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # The set of labels that can be used to describe a specific
        # instance of this metric type. For example, the
        # `appengine.googleapis.com/http/server/response_latencies` metric
        # type has a label for the HTTP response code, `response_code`, so
        # you can look at latencies for successful responses or just
        # for responses that failed.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::ServicemanagementV1::LabelDescriptor>]
        attr_accessor :labels
      
        # The resource name of the metric descriptor. Depending on the
        # implementation, the name typically includes: (1) the parent resource name
        # that defines the scope of the metric type or of its data; and (2) the
        # metric's URL-encoded type, which also appears in the `type` field of this
        # descriptor. For example, following is the resource name of a custom
        # metric within the GCP project `my-project-id`:
        # "projects/my-project-id/metricDescriptors/custom.googleapis.com%2Finvoice%
        # 2Fpaid%2Famount"
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The metric type, including its DNS name prefix. The type is not
        # URL-encoded.  All user-defined custom metric types have the DNS name
        # `custom.googleapis.com`.  Metric types should use a natural hierarchical
        # grouping. For example:
        # "custom.googleapis.com/invoice/paid/amount"
        # "appengine.googleapis.com/http/server/response_latencies"
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Whether the measurement is an integer, a floating-point number, etc.
        # Some combinations of `metric_kind` and `value_type` might not be supported.
        # Corresponds to the JSON property `valueType`
        # @return [String]
        attr_accessor :value_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metric_kind = args[:metric_kind] if args.key?(:metric_kind)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @unit = args[:unit] if args.key?(:unit)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
          @value_type = args[:value_type] if args.key?(:value_type)
        end
      end
      
      # `SourceContext` represents information about the source of a
      # protobuf element, like the file in which it is defined.
      class SourceContext
        include Google::Apis::Core::Hashable
      
        # The path-qualified name of the .proto file that contained the associated
        # protobuf element.  For example: `"google/protobuf/source_context.proto"`.
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_name = args[:file_name] if args.key?(:file_name)
        end
      end
      
      # Response message for `ListServices` method.
      class ListServicesResponse
        include Google::Apis::Core::Hashable
      
        # The returned services will only have the name field set.
        # Corresponds to the JSON property `services`
        # @return [Array<Google::Apis::ServicemanagementV1::ManagedService>]
        attr_accessor :services
      
        # Token that can be passed to `ListServices` to resume a paginated query.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @services = args[:services] if args.key?(:services)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # `Endpoint` describes a network endpoint that serves a set of APIs.
      # A service may expose any number of endpoints, and all endpoints share the
      # same service configuration, such as quota configuration and monitoring
      # configuration.
      # Example service configuration:
      # name: library-example.googleapis.com
      # endpoints:
      # # Below entry makes 'google.example.library.v1.Library'
      # # API be served from endpoint address library-example.googleapis.com.
      # # It also allows HTTP OPTIONS calls to be passed to the backend, for
      # # it to decide whether the subsequent cross-origin request is
      # # allowed to proceed.
      # - name: library-example.googleapis.com
      # allow_cors: true
      class Endpoint
        include Google::Apis::Core::Hashable
      
        # The list of APIs served by this endpoint.
        # If no APIs are specified this translates to "all APIs" exported by the
        # service, as defined in the top-level service configuration.
        # Corresponds to the JSON property `apis`
        # @return [Array<String>]
        attr_accessor :apis
      
        # Allowing
        # [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing), aka
        # cross-domain traffic, would allow the backends served from this endpoint to
        # receive and respond to HTTP OPTIONS requests. The response will be used by
        # the browser to determine whether the subsequent cross-origin request is
        # allowed to proceed.
        # Corresponds to the JSON property `allowCors`
        # @return [Boolean]
        attr_accessor :allow_cors
        alias_method :allow_cors?, :allow_cors
      
        # DEPRECATED: This field is no longer supported. Instead of using aliases,
        # please specify multiple google.api.Endpoint for each of the intented
        # alias.
        # Additional names that this endpoint will be hosted on.
        # Corresponds to the JSON property `aliases`
        # @return [Array<String>]
        attr_accessor :aliases
      
        # The canonical name of this endpoint.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The specification of an Internet routable address of API frontend that will
        # handle requests to this [API Endpoint](https://cloud.google.com/apis/design/
        # glossary).
        # It should be either a valid IPv4 address or a fully-qualified domain name.
        # For example, "8.8.8.8" or "myservice.appspot.com".
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        # The list of features enabled on this endpoint.
        # Corresponds to the JSON property `features`
        # @return [Array<String>]
        attr_accessor :features
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apis = args[:apis] if args.key?(:apis)
          @allow_cors = args[:allow_cors] if args.key?(:allow_cors)
          @aliases = args[:aliases] if args.key?(:aliases)
          @name = args[:name] if args.key?(:name)
          @target = args[:target] if args.key?(:target)
          @features = args[:features] if args.key?(:features)
        end
      end
      
      # OAuth scopes are a way to define data and permissions on data. For example,
      # there are scopes defined for "Read-only access to Google Calendar" and
      # "Access to Cloud Platform". Users can consent to a scope for an application,
      # giving it permission to access that data on their behalf.
      # OAuth scope specifications should be fairly coarse grained; a user will need
      # to see and understand the text description of what your scope means.
      # In most cases: use one or at most two OAuth scopes for an entire family of
      # products. If your product has multiple APIs, you should probably be sharing
      # the OAuth scope across all of those APIs.
      # When you need finer grained OAuth consent screens: talk with your product
      # management about how developers will use them in practice.
      # Please note that even though each of the canonical scopes is enough for a
      # request to be accepted and passed to the backend, a request can still fail
      # due to the backend requiring additional scopes or permissions.
      class OAuthRequirements
        include Google::Apis::Core::Hashable
      
        # The list of publicly documented OAuth scopes that are allowed access. An
        # OAuth token containing any of these scopes will be accepted.
        # Example:
        # canonical_scopes: https://www.googleapis.com/auth/calendar,
        # https://www.googleapis.com/auth/calendar.read
        # Corresponds to the JSON property `canonicalScopes`
        # @return [String]
        attr_accessor :canonical_scopes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @canonical_scopes = args[:canonical_scopes] if args.key?(:canonical_scopes)
        end
      end
      
      # Configuration controlling usage of a service.
      class Usage
        include Google::Apis::Core::Hashable
      
        # The full resource name of a channel used for sending notifications to the
        # service producer.
        # Google Service Management currently only supports
        # [Google Cloud Pub/Sub](https://cloud.google.com/pubsub) as a notification
        # channel. To use Google Cloud Pub/Sub as the channel, this must be the name
        # of a Cloud Pub/Sub topic that uses the Cloud Pub/Sub topic name format
        # documented in https://cloud.google.com/pubsub/docs/overview.
        # Corresponds to the JSON property `producerNotificationChannel`
        # @return [String]
        attr_accessor :producer_notification_channel
      
        # A list of usage rules that apply to individual API methods.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::UsageRule>]
        attr_accessor :rules
      
        # Requirements that must be satisfied before a consumer project can use the
        # service. Each requirement is of the form <service.name>/<requirement-id>;
        # for example 'serviceusage.googleapis.com/billing-enabled'.
        # Corresponds to the JSON property `requirements`
        # @return [Array<String>]
        attr_accessor :requirements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @producer_notification_channel = args[:producer_notification_channel] if args.key?(:producer_notification_channel)
          @rules = args[:rules] if args.key?(:rules)
          @requirements = args[:requirements] if args.key?(:requirements)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # `Context` defines which contexts an API requests.
      # Example:
      # context:
      # rules:
      # - selector: "*"
      # requested:
      # - google.rpc.context.ProjectContext
      # - google.rpc.context.OriginContext
      # The above specifies that all methods in the API request
      # `google.rpc.context.ProjectContext` and
      # `google.rpc.context.OriginContext`.
      # Available context types are defined in package
      # `google.rpc.context`.
      class Context
        include Google::Apis::Core::Hashable
      
        # A list of RPC context rules that apply to individual API methods.
        # **NOTE:** All service configuration rules follow "last one wins" order.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::ServicemanagementV1::ContextRule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # A rule to be applied in a Policy.
      class Rule
        include Google::Apis::Core::Hashable
      
        # Human-readable description of the rule.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Additional restrictions that must be met
        # Corresponds to the JSON property `conditions`
        # @return [Array<Google::Apis::ServicemanagementV1::Condition>]
        attr_accessor :conditions
      
        # The config returned to callers of tech.iam.IAM.CheckPolicy for any entries
        # that match the LOG action.
        # Corresponds to the JSON property `logConfig`
        # @return [Array<Google::Apis::ServicemanagementV1::LogConfig>]
        attr_accessor :log_config
      
        # If one or more 'in' clauses are specified, the rule matches if
        # the PRINCIPAL/AUTHORITY_SELECTOR is in at least one of these entries.
        # Corresponds to the JSON property `in`
        # @return [Array<String>]
        attr_accessor :in
      
        # A permission is a string of form '<service>.<resource type>.<verb>'
        # (e.g., 'storage.buckets.list'). A value of '*' matches all permissions,
        # and a verb part of '*' (e.g., 'storage.buckets.*') matches all verbs.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        # Required
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # If one or more 'not_in' clauses are specified, the rule matches
        # if the PRINCIPAL/AUTHORITY_SELECTOR is in none of the entries.
        # The format for in and not_in entries is the same as for members in a
        # Binding (see google/iam/v1/policy.proto).
        # Corresponds to the JSON property `notIn`
        # @return [Array<String>]
        attr_accessor :not_in
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @conditions = args[:conditions] if args.key?(:conditions)
          @log_config = args[:log_config] if args.key?(:log_config)
          @in = args[:in] if args.key?(:in)
          @permissions = args[:permissions] if args.key?(:permissions)
          @action = args[:action] if args.key?(:action)
          @not_in = args[:not_in] if args.key?(:not_in)
        end
      end
      
      # Specifies what kind of log the caller must write
      class LogConfig
        include Google::Apis::Core::Hashable
      
        # Write a Data Access (Gin) log
        # Corresponds to the JSON property `dataAccess`
        # @return [Google::Apis::ServicemanagementV1::DataAccessOptions]
        attr_accessor :data_access
      
        # Write a Cloud Audit log
        # Corresponds to the JSON property `cloudAudit`
        # @return [Google::Apis::ServicemanagementV1::CloudAuditOptions]
        attr_accessor :cloud_audit
      
        # Options for counters
        # Corresponds to the JSON property `counter`
        # @return [Google::Apis::ServicemanagementV1::CounterOptions]
        attr_accessor :counter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_access = args[:data_access] if args.key?(:data_access)
          @cloud_audit = args[:cloud_audit] if args.key?(:cloud_audit)
          @counter = args[:counter] if args.key?(:counter)
        end
      end
      
      # A description of a log type. Example in YAML format:
      # - name: library.googleapis.com/activity_history
      # description: The history of borrowing and returning library items.
      # display_name: Activity
      # labels:
      # - key: /customer_id
      # description: Identifier of a library customer
      class LogDescriptor
        include Google::Apis::Core::Hashable
      
        # The name of the log. It must be less than 512 characters long and can
        # include the following characters: upper- and lower-case alphanumeric
        # characters [A-Za-z0-9], and punctuation characters including
        # slash, underscore, hyphen, period [/_-.].
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A human-readable description of this log. This information appears in
        # the documentation and can contain details.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The human-readable name for this log. This information appears on
        # the user interface and should be concise.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The set of labels that are available to describe a specific log entry.
        # Runtime requests that contain labels not specified here are
        # considered invalid.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::ServicemanagementV1::LabelDescriptor>]
        attr_accessor :labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
        end
      end
      
      # Generic specification of a source configuration file
      class ConfigFile
        include Google::Apis::Core::Hashable
      
        # The file name of the configuration file (full or relative path).
        # Corresponds to the JSON property `filePath`
        # @return [String]
        attr_accessor :file_path
      
        # The type of configuration file this represents.
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # The bytes that constitute the file.
        # Corresponds to the JSON property `fileContents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :file_contents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_path = args[:file_path] if args.key?(:file_path)
          @file_type = args[:file_type] if args.key?(:file_type)
          @file_contents = args[:file_contents] if args.key?(:file_contents)
        end
      end
      
      # An object that describes the schema of a MonitoredResource object using a
      # type name and a set of labels.  For example, the monitored resource
      # descriptor for Google Compute Engine VM instances has a type of
      # `"gce_instance"` and specifies the use of the labels `"instance_id"` and
      # `"zone"` to identify particular VM instances.
      # Different APIs can support different monitored resource types. APIs generally
      # provide a `list` method that returns the monitored resource descriptors used
      # by the API.
      class MonitoredResourceDescriptor
        include Google::Apis::Core::Hashable
      
        # Required. A set of labels used to describe instances of this monitored
        # resource type. For example, an individual Google Cloud SQL database is
        # identified by values for the labels `"database_id"` and `"zone"`.
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::ServicemanagementV1::LabelDescriptor>]
        attr_accessor :labels
      
        # Optional. The resource name of the monitored resource descriptor:
        # `"projects/`project_id`/monitoredResourceDescriptors/`type`"` where
        # `type` is the value of the `type` field in this object and
        # `project_id` is a project ID that provides API-specific context for
        # accessing the type.  APIs that do not use project information can use the
        # resource name format `"monitoredResourceDescriptors/`type`"`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. A concise name for the monitored resource type that might be
        # displayed in user interfaces. It should be a Title Cased Noun Phrase,
        # without any article or other determiners. For example,
        # `"Google Cloud SQL Database"`.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Optional. A detailed description of the monitored resource type that might
        # be used in documentation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Required. The monitored resource type. For example, the type
        # `"cloudsql_database"` represents databases in Google Cloud SQL.
        # The maximum length of this value is 256 characters.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @display_name = args[:display_name] if args.key?(:display_name)
          @description = args[:description] if args.key?(:description)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A custom error rule.
      class CustomErrorRule
        include Google::Apis::Core::Hashable
      
        # Selects messages to which this rule applies.
        # Refer to selector for syntax details.
        # Corresponds to the JSON property `selector`
        # @return [String]
        attr_accessor :selector
      
        # Mark this message as possible payload in error response.  Otherwise,
        # objects of this type will be filtered when they appear in error payload.
        # Corresponds to the JSON property `isErrorType`
        # @return [Boolean]
        attr_accessor :is_error_type
        alias_method :is_error_type?, :is_error_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @selector = args[:selector] if args.key?(:selector)
          @is_error_type = args[:is_error_type] if args.key?(:is_error_type)
        end
      end
      
      # Defines the Media configuration for a service in case of a download.
      # Use this only for Scotty Requests. Do not use this for media support using
      # Bytestream, add instead [][google.bytestream.RestByteStream] as an API to
      # your configuration for Bytestream methods.
      class MediaDownload
        include Google::Apis::Core::Hashable
      
        # Whether download is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # DO NOT USE FIELDS BELOW THIS LINE UNTIL THIS WARNING IS REMOVED.
        # Specify name of the download service if one is used for download.
        # Corresponds to the JSON property `downloadService`
        # @return [String]
        attr_accessor :download_service
      
        # A boolean that determines whether a notification for the completion of a
        # download should be sent to the backend.
        # Corresponds to the JSON property `completeNotification`
        # @return [Boolean]
        attr_accessor :complete_notification
        alias_method :complete_notification?, :complete_notification
      
        # Optional maximum acceptable size for direct download.
        # The size is specified in bytes.
        # Corresponds to the JSON property `maxDirectDownloadSize`
        # @return [Fixnum]
        attr_accessor :max_direct_download_size
      
        # Name of the Scotty dropzone to use for the current API.
        # Corresponds to the JSON property `dropzone`
        # @return [String]
        attr_accessor :dropzone
      
        # A boolean that determines if direct download from ESF should be used for
        # download of this media.
        # Corresponds to the JSON property `useDirectDownload`
        # @return [Boolean]
        attr_accessor :use_direct_download
        alias_method :use_direct_download?, :use_direct_download
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @download_service = args[:download_service] if args.key?(:download_service)
          @complete_notification = args[:complete_notification] if args.key?(:complete_notification)
          @max_direct_download_size = args[:max_direct_download_size] if args.key?(:max_direct_download_size)
          @dropzone = args[:dropzone] if args.key?(:dropzone)
          @use_direct_download = args[:use_direct_download] if args.key?(:use_direct_download)
        end
      end
      
      # Configuration for a custom authentication provider.
      class CustomAuthRequirements
        include Google::Apis::Core::Hashable
      
        # A configuration string containing connection information for the
        # authentication provider, typically formatted as a SmartService string
        # (go/smartservice).
        # Corresponds to the JSON property `provider`
        # @return [String]
        attr_accessor :provider
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @provider = args[:provider] if args.key?(:provider)
        end
      end
      
      # Change report associated with a particular service configuration.
      # It contains a list of ConfigChanges based on the comparison between
      # two service configurations.
      class ChangeReport
        include Google::Apis::Core::Hashable
      
        # List of changes between two service configurations.
        # The changes will be alphabetically sorted based on the identifier
        # of each change.
        # A ConfigChange identifier is a dot separated path to the configuration.
        # Example: visibility.rules[selector='LibraryService.CreateBook'].restriction
        # Corresponds to the JSON property `configChanges`
        # @return [Array<Google::Apis::ServicemanagementV1::ConfigChange>]
        attr_accessor :config_changes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_changes = args[:config_changes] if args.key?(:config_changes)
        end
      end
      
      # Request message for DisableService method.
      class DisableServiceRequest
        include Google::Apis::Core::Hashable
      
        # The identity of consumer resource which service disablement will be
        # applied to.
        # The Google Service Management implementation accepts the following
        # forms:
        # - "project:<project_id>"
        # Note: this is made compatible with
        # google.api.servicecontrol.v1.Operation.consumer_id.
        # Corresponds to the JSON property `consumerId`
        # @return [String]
        attr_accessor :consumer_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consumer_id = args[:consumer_id] if args.key?(:consumer_id)
        end
      end
      
      # Response message for SubmitConfigSource method.
      class SubmitConfigSourceResponse
        include Google::Apis::Core::Hashable
      
        # `Service` is the root object of Google service configuration schema. It
        # describes basic information about a service, such as the name and the
        # title, and delegates other aspects to sub-sections. Each sub-section is
        # either a proto message or a repeated proto message that configures a
        # specific aspect, such as auth. See each proto message definition for details.
        # Example:
        # type: google.api.Service
        # config_version: 3
        # name: calendar.googleapis.com
        # title: Google Calendar API
        # apis:
        # - name: google.calendar.v3.Calendar
        # authentication:
        # providers:
        # - id: google_calendar_auth
        # jwks_uri: https://www.googleapis.com/oauth2/v1/certs
        # issuer: https://securetoken.google.com
        # rules:
        # - selector: "*"
        # requirements:
        # provider_id: google_calendar_auth
        # Corresponds to the JSON property `serviceConfig`
        # @return [Google::Apis::ServicemanagementV1::Service]
        attr_accessor :service_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @service_config = args[:service_config] if args.key?(:service_config)
        end
      end
      
      # Defines the Media configuration for a service in case of an upload.
      # Use this only for Scotty Requests. Do not use this for media support using
      # Bytestream, add instead [][google.bytestream.RestByteStream] as an API to
      # your configuration for Bytestream methods.
      class MediaUpload
        include Google::Apis::Core::Hashable
      
        # A boolean that determines whether a notification for the completion of an
        # upload should be sent to the backend. These notifications will not be seen
        # by the client and will not consume quota.
        # Corresponds to the JSON property `completeNotification`
        # @return [Boolean]
        attr_accessor :complete_notification
        alias_method :complete_notification?, :complete_notification
      
        # Whether to receive a notification for progress changes of media upload.
        # Corresponds to the JSON property `progressNotification`
        # @return [Boolean]
        attr_accessor :progress_notification
        alias_method :progress_notification?, :progress_notification
      
        # Whether upload is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Name of the Scotty dropzone to use for the current API.
        # Corresponds to the JSON property `dropzone`
        # @return [String]
        attr_accessor :dropzone
      
        # Whether to receive a notification on the start of media upload.
        # Corresponds to the JSON property `startNotification`
        # @return [Boolean]
        attr_accessor :start_notification
        alias_method :start_notification?, :start_notification
      
        # DO NOT USE FIELDS BELOW THIS LINE UNTIL THIS WARNING IS REMOVED.
        # Specify name of the upload service if one is used for upload.
        # Corresponds to the JSON property `uploadService`
        # @return [String]
        attr_accessor :upload_service
      
        # Optional maximum acceptable size for an upload.
        # The size is specified in bytes.
        # Corresponds to the JSON property `maxSize`
        # @return [Fixnum]
        attr_accessor :max_size
      
        # An array of mimetype patterns. Esf will only accept uploads that match one
        # of the given patterns.
        # Corresponds to the JSON property `mimeTypes`
        # @return [Array<String>]
        attr_accessor :mime_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @complete_notification = args[:complete_notification] if args.key?(:complete_notification)
          @progress_notification = args[:progress_notification] if args.key?(:progress_notification)
          @enabled = args[:enabled] if args.key?(:enabled)
          @dropzone = args[:dropzone] if args.key?(:dropzone)
          @start_notification = args[:start_notification] if args.key?(:start_notification)
          @upload_service = args[:upload_service] if args.key?(:upload_service)
          @max_size = args[:max_size] if args.key?(:max_size)
          @mime_types = args[:mime_types] if args.key?(:mime_types)
        end
      end
    end
  end
end
